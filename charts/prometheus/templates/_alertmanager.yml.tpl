{{ define "alertmanager.yml.tpl" }}
global:
  slack_api_url: '{{ .Values.alertmanager.slack.apiUrl }}'

receivers:
  - name: 'default-receiver'
    slack_configs:
    - api_url: '{{ .Values.alertmanager.slack.apiUrl }}'
      channel: '{{ .Values.alertmanager.slack.channel }}'
      username: 'Prometheus'
      title: '[{{ "{{" }} .Status | toUpper {{ "}}" }}{{ "{{" }} if eq .Status "firing" {{ "}}" }}:{{ "{{" }} .Alerts.Firing | len {{ "}}" }}{{ "{{" }} end {{ "}}" }}] {{ "{{" }} .GroupLabels.SortedPairs.Values | join " " {{ "}}" }}'
      text: "{{ "{{" }} range .Alerts {{ "}}{{" }} .Annotations.description {{ "}}"  }}\n{{ "{{" }} end {{ "}}" }}"

route:
  receiver: default-receiver

  # When a new group of alerts is created by an incoming alert, wait at
  # least 'group_wait' to send the initial notification.
  # This way ensures that you get multiple alerts for the same group that start
  # firing shortly after another are batched together on the first
  # notification.
  group_wait: 2m

  # When the first notification was sent, wait 'group_interval' to send a batch
  # of new alerts that started firing for that group.
  group_interval: 2m

  # If an alert has successfully been sent, wait 'repeat_interval' to
  # resend them.
  repeat_interval: 2m

{{ end }}