port: {{ global.clash.http_port }}
socks-port: {{ global.clash.socks_port }}
allow-lan: {{ global.clash.allow_lan }}
mode: Rule
log-level: {{ global.clash.log_level }}
external-controller: :9090
{% if exists("request.clash.doh") %}
{% if request.clash.doh == "true" %}
dns:
  enable: true
  listen: 0.0.0.0:53
  enhanced-mode: fake-ip
  nameserver:
    - https://doh.rixcloud.dev/dns-query
    - https://118.31.13.131/dns-query
    - https://139.224.112.177/dns-query
{% endif %}
{% endif %}

proxies: ~
proxy-groups: ~
rules: ~
