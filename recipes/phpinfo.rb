#
# Author:: Nicholas Whitt (<nick.whitt@gmail.com>)
# Cookbook Name:: devtools
# Recipe:: xdebug
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

directory node[:webapp][:info_location] do
  owner node[:apache][:user]
  group node[:apache][:group]
  mode 0755
  action :create
  recursive true
end

template "#{node[:webapp][:info_location]}/index.php" do
  owner node[:apache][:user]
  group node[:apache][:user]
  source "phpinfo.php.erb"
end

web_app "phpinfo" do
  template "phpinfo.conf.erb"
  server_name node[:webapp][:server_name]
  docroot node[:webapp][:info_docroot]
end