{{- define "common.matchLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "common.metaLabels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "ranger.matchLabels" -}}
app.kubernetes.io/component: ranger
{{ include "common.matchLabels" . }}
{{- end -}}

{{- define "ranger.labels" -}}
{{ include "ranger.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}