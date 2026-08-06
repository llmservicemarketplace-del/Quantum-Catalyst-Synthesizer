{{- define "qcs.name" -}}
quantum-catalyst-synthesizer
{{- end }}

{{- define "qcs.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "qcs.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "qcs.labels" -}}
app.kubernetes.io/name: {{ include "qcs.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
