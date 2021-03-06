#
# Author:: Nicholas Whitt (<nick.whitt@gmail.com>)
# Cookbook Name:: devtools
# Recipe:: webgrind
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
include_recipe "git"

git node['webgrind']['docroot'] do
  repository "git://github.com/jokkedk/webgrind.git"
  reference "master"
  action :sync
end

web_app "webgrind" do
  application_name "webgrind"
  docroot node['webgrind']['docroot']
  template "webgrind.conf.erb"
end