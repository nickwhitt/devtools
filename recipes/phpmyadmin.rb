#
# Author:: Nicholas Whitt (<nick.whitt@gmail.com>)
# Cookbook Name:: devtools
# Recipe:: phpmyadmin
#
# Copyright 2012, Nicholas Whitt.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "php"
include_recipe "mysql"
include_recipe "php::module_mysql"

directory "/etc/dbconfig-common/" do
  action :create
  recursive true
end

template "/etc/dbconfig-common/phpmyadmin.conf" do
  source "phpmyadmin.conf.erb"
  mode "0660"
  variables :params => node['phpmyadmin']['pma']
end

package "phpmyadmin"

template "/etc/phpmyadmin/config.inc.php" do
  source 'config.inc.php.erb' 
  mode "0644"
  variables :params => node['phpmyadmin']['config'], :pma => node['phpmyadmin']['pma']
end

template "/etc/phpmyadmin/config-db.php" do
  source "config-db.php.erb"
  mode "0660"
  variables :params => node['phpmyadmin']['pma']
end

# create PMA tables
execute "create_tables" do
  command "mysql -u #{node['phpmyadmin']['config']['user']} -p#{node['phpmyadmin']['config']['password']} -h #{node['phpmyadmin']['host']} < /etc/phpmyadmin/create_tables.sql"
  action :nothing
end
template "/etc/phpmyadmin/create_tables.sql" do
  not_if { node['phpmyadmin']['pma']['database'].empty? }
  source "create_tables.sql.erb"
  mode "0660"
  variables :params => node['phpmyadmin']['pma']
  notifies :run, resources(:execute => "create_tables")
end

# requires apache2
web_app "phpmyadmin" do
  application_name "phpmyadmin"
  docroot node['phpmyadmin']['docroot']
  template "apache.conf.erb"
end