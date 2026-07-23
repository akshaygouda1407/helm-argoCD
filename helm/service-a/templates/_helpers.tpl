{{- define "service-a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "service-a.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "service-a.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "service-a.labels" -}}
app.kubernetes.io/name: {{ include "service-a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end }}

{{- define "service-a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "service-a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
