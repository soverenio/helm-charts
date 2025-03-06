{{/*
Selector labels
*/}}

{{- define "common.matchLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "common.metaLabels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "crawler.matchLabels" -}}
app.kubernetes.io/component: crawler
{{ include "common.matchLabels" . }}
{{- end -}}

{{- define "crawler.labels" -}}
{{ include "crawler.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "prometheusAgent.matchLabels" -}}
app.kubernetes.io/component: prometheus-agent
{{ include "common.matchLabels" . }}
{{- end -}}

{{- define "prometheusAgent.labels" -}}
{{ include "prometheusAgent.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "kafka.matchLabels" -}}
app.kubernetes.io/component: kafka
{{ include "common.matchLabels" . }}
{{- end -}}

{{- define "kafka.labels" -}}
{{ include "kafka.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "detectionTool.matchLabels" -}}
app.kubernetes.io/component: detection-tool
{{ include "common.matchLabels" . }}
{{- end -}}

{{- define "detectionTool.labels" -}}
{{ include "detectionTool.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "kafka.brokersStr" -}}
{{- if .Values.kafka.embedded.enabled -}}
{{ .Release.Name }}-kafka:{{ .Values.kafka.embedded.service.port }}
{{- else -}}
{{ join "," .Values.kafka.external.brokers }}
{{- end -}}
{{- end -}}

{{- define "crawl.kafka" -}}
{{- range $key, $value := .Values.crawler.cfg.kafka.elements -}}
{{- if $value.password }}
{{- $pwd := print "$(KAFKA_PASSWORDS_" $key ")" -}}
{{- $_ := set $value "password" $pwd -}}
{{- end -}}
{{- end -}}
{{ toJson .Values.crawler.cfg.kafka.elements | quote }}
{{- end -}}

{{- define "crawl.database.postgres" -}}
{{- range $key, $value := .Values.crawler.cfg.database.postgres.elements -}}
{{- $connString := print "$(DATABASE_POSTGRES_CONN_STRINGS_" $key ")" -}}
{{- $_ := set $value "connectionString" $connString -}}
{{- end -}}
{{ toJson .Values.crawler.cfg.database.postgres.elements | quote }}
{{- end -}}

{{- define "crawl.database.mysql" -}}
{{- range $key, $value := .Values.crawler.cfg.database.mysql.elements -}}
{{- $connString := print "$(DATABASE_MYSQL_CONN_STRINGS_" $key ")" -}}
{{- $_ := set $value "connectionString" $connString -}}
{{- end -}}
{{ toJson .Values.crawler.cfg.database.mysql.elements | quote }}
{{- end -}}


{{- define "crawl.database.mssql" -}}
{{- range $key, $value := .Values.crawler.cfg.database.mssql.elements -}}
{{- $connString := print "$(DATABASE_MSSQL_CONN_STRINGS_" $key ")" -}}
{{- $_ := set $value "connectionString" $connString -}}
{{- end -}}
{{ toJson .Values.crawler.cfg.database.mssql.elements | quote }}
{{- end -}}

{{- define "crawl.nosqldatabase.mongodb" -}}
{{- range $key, $value := .Values.crawler.cfg.nosqldatabase.mongodb.elements -}}
{{- $connString := print "$(NOSQLDATABASE_MONGODB_CONN_STRINGS_" $key ")" -}}
{{- $_ := set $value "connectionString" $connString -}}
{{- end -}}
{{ toJson .Values.crawler.cfg.nosqldatabase.mongodb.elements | quote }}
{{- end -}}

{{- define "crawl.s3" -}}
{{- $enabled := .Values.crawler.cfg.s3.enabled -}}
{{- $_ := unset .Values.crawler.cfg.s3 "enabled" -}}
{{- $_ := set .Values.crawler.cfg.s3 "accessKeyId" "$(S3_ACCESSKEYID)" -}}
{{- $_ := set .Values.crawler.cfg.s3 "secretAccessKey" "$(S3_SECRETACCESSKEY)" -}}
{{- if .Values.crawler.cfg.s3.yandexcloud.privatekey }}
{{- $_ := set .Values.crawler.cfg.s3.yandexcloud "privatekey" "$(S3_PRIVATEKEY)" -}}
{{- end -}}
"[{{ toJson .Values.crawler.cfg.s3 | quote | trimPrefix "\"" | trimSuffix "\"" }}]"
{{- $_ := set .Values.crawler.cfg.s3 "enabled" $enabled -}}
{{- end -}}

{{- define "discoveryservices.consul.kafka" -}}
{{ toJson .Values.crawler.cfg.discoveryservices.consul.kafka | quote }}
{{- end -}}

{{- define "discoveryservices.consul.postgres" -}}
{{ toJson .Values.crawler.cfg.discoveryservices.consul.postgres | quote }}
{{- end -}}

{{- define "discoveryservices.consul.mysql" -}}
{{ toJson .Values.crawler.cfg.discoveryservices.consul.mysql | quote }}
{{- end -}}

{{- define "discoveryservices.consul.mssql" -}}
{{ toJson .Values.crawler.cfg.discoveryservices.consul.mssql | quote }}
{{- end -}}

{{- define "statsClientAddress" -}}
{{- if eq .Values.appCloud "aws" -}}
stats.soveren.io:443
{{- else if eq .Values.appCloud "yandex" -}}
stats.ru.soveren.io:443
{{- else -}}
stats.soveren.io:443
{{- end -}}
{{- end -}}

{{- define "common.proxySettings" -}}
{{- if .Values.httpsProxy }}
# HTTPS Proxy Settings
- name: HTTPS_PROXY
  value: {{ .Values.httpsProxy }}
{{- $defaultNoProxy := printf "%s-crawler,%s-detection-tool,%s-kafka,%s-crawler:%v,%s-detection-tool:%v,%s-kafka:%v"
       .Release.Name .Release.Name .Release.Name .Release.Name .Values.crawler.service.grpcPort .Release.Name .Values.detectionTool.service.port .Release.Name .Values.kafka.embedded.service.port -}}
{{- if .Values.httpsProxyNoProxy }}
  {{- $userNoProxy := tpl .Values.httpsProxyNoProxy . -}}
  {{- $mergedNoProxy := printf "%s,%s" $defaultNoProxy $userNoProxy }}
- name: NO_PROXY
  value: {{ $mergedNoProxy }}
{{- else }}
- name: NO_PROXY
  value: {{ $defaultNoProxy }}
{{- end }}
{{- end }}
{{- end }}

{{- define "dt.proxySettings" -}}
{{- if .Values.httpsProxy }}
# HTTPS Proxy Settings
- name: https_proxy
  value: {{ .Values.httpsProxy }}
{{- $defaultNoProxy := printf "%s-digger,%s-detection-tool,%s-kafka,$(KUBERNETES_SERVICE_HOST),%s-digger:%v,%s-detection-tool:%v,$(KUBERNETES_SERVICE_HOST):$(KUBERNETES_SERVICE_PORT) %s-kafka:%v"
       .Release.Name .Release.Name .Release.Name .Release.Name .Values.digger.service.grpcPort .Release.Name .Values.detectionTool.service.port .Release.Name .Values.kafka.embedded.service.port -}}
{{- if .Values.httpsProxyNoProxy }}
  {{- $userNoProxy := tpl .Values.httpsProxyNoProxy . -}}
  {{- $mergedNoProxy := printf "%s,%s" $defaultNoProxy $userNoProxy }}
- name: no_proxy
  value: {{ $mergedNoProxy }}
{{- else }}
- name: no_proxy
  value: {{ $defaultNoProxy }}
{{- end }}
{{- end }}
{{- end }}