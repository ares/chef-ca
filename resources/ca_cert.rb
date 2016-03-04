resource_name :ca_cert

property :name, :kind_of => String, :name_property => true

default_action :install

action :install do
  cookbook_file ca_install_path(new_resource.name) do
    notifies :run, 'script[install_ca_cert]', :immediately
  end

  script 'install_ca_cert' do
    action :nothing
    cwd ca_install_path
    interpreter 'bash'
    code ca_update_command
  end

  if node.recipes.include?('desktop')
    cookbook_file "/home/#{node[:user]}/Certifikaty/#{new_resource.name}" do
      owner node[:user]
      group node[:user]
      mode '0644'
      source new_resource.name
    end
  end
end
