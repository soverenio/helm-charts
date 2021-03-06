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
