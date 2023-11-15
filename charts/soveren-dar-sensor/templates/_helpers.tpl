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

{{- define "kafka.brokersStr" -}}
{{- if .Values.kafka.embedded.enabled -}}
{{ .Release.Name }}-kafka:{{ .Values.kafka.embedded.service.port }}
{{- else -}}
{{ join "," .Values.kafka.external.brokers }}
{{- end -}}
{{- end -}}