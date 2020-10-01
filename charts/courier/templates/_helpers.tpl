
{{- define "courier.name" -}}
{{- default .Values.metadataName | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "courier.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "courier.labels" -}}
helm.sh/chart: {{ include "courier.chart" . }}
{{ include "courier.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "courier.selectorLabels" -}}
app.kubernetes.io/name: {{ include "courier.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "courier.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "courier.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
