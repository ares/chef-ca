def ca_install_path(name = '')
  install_path = case node[:platform]
                   when 'ubuntu', 'debian'
                     '/usr/local/share/ca-certificates/'
                   when 'redhat', 'centos', 'fedora'
                     '/etc/pki/ca-trust/source/anchors/'
                 end
  File.join(install_path, name)
end

def ca_update_command
  case node[:platform]
    when 'ubuntu', 'debian'
      'update-ca-certificates'
    when 'redhat', 'centos', 'fedora'
      'update-ca-trust extract'
  end
end
