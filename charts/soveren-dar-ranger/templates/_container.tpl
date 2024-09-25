{{- define "ranger.container" -}}
- name: ranger
  image: {{ .Values.ranger.image.name }}:{{ .Values.ranger.image.tag }}
  imagePullPolicy: {{ .Values.ranger.image.pullPolicy }}
  envFrom:
  - configMapRef:
      name: {{ .Release.Name }}-ranger-cm
  env:
  - name: SVRN_RANGER_CRAWL_SCANONCE
    value: "{{ .Values.ranger.cronjob.enabled }}"
  {{- if not .Values.useExternalSecrets }}
  - name: SVRN_RANGER_CRAWLERCLIENT_TOKEN
    valueFrom:
      secretKeyRef:
        name: {{ .Release.Name }}-ranger-tokens
        key: token
  - name: SVRN_RANGER_CRAWL_DATABASE_CONNECTIONSTRING
    valueFrom:
      secretKeyRef:
        name: {{ .Release.Name }}-ranger-tokens
        key: connectionstring-{{ .Values.ranger.cfg.crawl.database.name }}
  {{- end }}
  - name: SVRN_RANGER_CRAWL_DATABASE_TYPE
    value: {{ .Values.ranger.cfg.crawl.database.type }}
  - name: SVRN_RANGER_CRAWL_DATABASE_NAME
    value: {{ .Values.ranger.cfg.crawl.database.name }}
  {{- if .Values.httpsProxy }}
  - name: HTTPS_PROXY
    value: {{ .Values.httpsProxy }}
  {{- end }}
  {{- if .Values.httpsProxyNoProxy }}
  - name: NO_PROXY
    value: {{ .Values.httpsProxyNoProxy }}
  {{- end }}
  {{- if .Values.ranger.env }}
  {{- toYaml .Values.ranger.env | nindent 4 }}
  {{- end }}
  resources:
  {{- if .Values.ranger.resources }}
    {{- toYaml .Values.ranger.resources | nindent 4 }}
  {{- end }}
  {{- if .Values.ranger.securityContext }}
  securityContext:
    {{- toYaml .Values.ranger.securityContext | nindent 4 }}
  {{- end }}
  {{- if .Values.ranger.cfg.crawlerclient.usetls }}
  volumeMounts:
  - name: ranger-certs
    mountPath: /etc/certs/
    readOnly: true
  {{- end }}
{{- end -}}
