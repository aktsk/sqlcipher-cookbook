include_recipe 'openssl::upgrade'

%w(tcl tcl-devel).each do |pname|
  package pname do
    action :install
  end
end

directory node['sqlcipher']['working_dir'] do
  owner node['sqlcipher']['git_user']
  action :create
end

git node['sqlcipher']['working_dir'] do
  user node['sqlcipher']['git_user']
  repository node['sqlcipher']['repository']
  checkout_branch node['sqlcipher']['version']
  action :checkout
  notifies :run, 'bash[make_install_sqlcipher]'
end

bash 'make_install_sqlcipher' do
  action :run
  not_if "which sqlcipher"
  flags '-ex'
  cwd node['sqlcipher']['working_dir']
  code <<-EOH
export SQLITE_HAS_CODEC
export SQLITE_TEMP_STORE=2
./configure --enable-tempstore=yes CFLAGS="-DSQLITE_HAS_CODEC" LDFLAGS="-lcrypto"
make
make install
EOH
end
