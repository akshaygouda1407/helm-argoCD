{{- define "service-b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "service-b.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "service-b.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "service-b.labels" -}}
app.kubernetes.io/name: {{ include "service-b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end }}

{{- define "service-b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "service-b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

