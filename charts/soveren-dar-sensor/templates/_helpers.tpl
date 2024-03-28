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

{{- define "crawl.s3" -}}
{{- $enabled := .Values.crawler.cfg.s3.enabled -}}
{{- $_ := unset .Values.crawler.cfg.s3 "enabled" -}}
{{- $_ := set .Values.crawler.cfg.s3 "accessKeyId" "$(S3_ACCESSKEYID)" -}}
{{- $_ := set .Values.crawler.cfg.s3 "secretAccessKey" "$(S3_SECRETACCESSKEY)" -}}
"[{{ toJson .Values.crawler.cfg.s3 | quote | trimPrefix "\"" | trimSuffix "\"" }}]"
{{- $_ := set .Values.crawler.cfg.s3 "enabled" $enabled -}}
{{- end -}}