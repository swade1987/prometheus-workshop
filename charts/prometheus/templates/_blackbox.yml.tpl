{{ define "blackbox.yml.tpl" }}
modules:
  http_2xx:
    prober: http
    timeout: 10s
    http:
      preferred_ip_protocol: "ip4"
      # To handle redirects not keeping the host header we disable follow redirects and allow 301 and 302
      # status codes as successful (downside being we have to specify the 2xx status codes)
      valid_status_codes: [200, 201, 202, 301, 302]
      no_follow_redirects: true
      fail_if_ssl: false
      fail_if_not_ssl: false
      tls_config:
        insecure_skip_verify: true
{{ end }}