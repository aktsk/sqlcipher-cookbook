include_recipe 'openssl::upgrade'

git "#{Chef::Config[:file_cache_path]}/sqlcipher" do
  user node['sqlcipher']['git_user']
  repository node['sqlcipher']['repository']
  checkout_branch node['sqlcipher']['version']
  action :checkout
end

bash 'make and install sqlcipher' do
  action :nothing
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
