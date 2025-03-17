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

{{- define "kafka.matchLabels" -}}
app.kubernetes.io/component: kafka
{{ include "common.matchLabels" . }}
{{- end -}}

{{- define "kafka.labels" -}}
{{ include "kafka.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "digger.matchLabels" -}}
app.kubernetes.io/component: digger
{{ include "common.matchLabels" . }}
{{- end -}}

{{- define "digger.labels" -}}
{{ include "digger.matchLabels" . }}
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

{{- define "interceptor.matchLabels" -}}
app.kubernetes.io/component: interceptor
{{ include "common.matchLabels" . }}
{{- end -}}

{{- define "interceptor.labels" -}}
{{ include "interceptor.matchLabels" . }}
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

{{- define "kafka.brokersStr" -}}
{{- if .Values.kafka.embedded.enabled -}}
{{ .Release.Name }}-kafka:{{ .Values.kafka.embedded.service.port }}
{{- else -}}
{{ join "," .Values.kafka.external.brokers }}
{{- end -}}
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
{{- $defaultNoProxy := printf "%s-digger,%s-detection-tool,%s-kafka,$(KUBERNETES_SERVICE_HOST),%s-digger:%v,%s-detection-tool:%v,$(KUBERNETES_SERVICE_HOST):$(KUBERNETES_SERVICE_PORT) %s-kafka:%v"
       .Release.Name .Release.Name .Release.Name .Release.Name .Values.digger.service.grpcPort .Release.Name .Values.detectionTool.service.port .Release.Name .Values.kafka.embedded.service.port -}}
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