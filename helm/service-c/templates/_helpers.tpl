{{- define "service-c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "service-c.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "service-c.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "service-c.labels" -}}
app.kubernetes.io/name: {{ include "service-c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end }}

{{- define "service-c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "service-c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


