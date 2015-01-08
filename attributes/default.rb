default['sqlcipher']['repository'] = 'https://github.com/sqlcipher/sqlcipher.git'
default['sqlcipher']['version'] = 'v3.2.0'
default['sqlcipher']['git_user'] = 'root'

default['sqlcipher']['working_dir'] = "#{Chef::Config[:file_cache_path]}/sqlcipher"
