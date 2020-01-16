################################
##
## {{ ansible_managed }}
##
################################

external_url "https://gitlab.enciso.website/"

gitlab_rails['time_zone'] = '{{ gitlab_timezone }}'

nginx['client_max_body_size'] = '600m'
nginx['redirect_http_to_https'] = 'True'
nginx['ssl_certificate'] = "/etc/gitlab/ssl/gitlab.enciso.website.crt"
nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/gitlab.enciso.website.key"

gitlab_rails['ldap_enabled'] = true

gitlab_rails['ldap_servers'] = {
'main' => {
  'label' => 'Gitlab AD',
  'host' =>  'win-ad.enciso.website',
  'port' => 389,
  'uid' => 'sAMAccountName',
  'encryption' => 'plain',
  'verify_certificates' => false,
  'bind_dn' => '{{ bind_user }}',
  'password' => '{{ bind_password }}',
  'active_directory' => true,
  'base' => 'OU=USERS,OU=CORE,DC=corp,DC=enciso,DC=website',
  'group_base' => 'OU=GROUPS,OU=CORE,DC=corp,DC=enciso,DC=website',
  'admin_group' => 'Global Admins'
  }
}

gitlab_rails['gitlab_signup_enabled'] = true
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "relay.enciso.website"
gitlab_rails['smtp_port'] = 25
