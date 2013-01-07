#
# Author:: Nicholas Whitt (<nick.whitt@gmail.com>)
# Cookbook Name:: devtools
# Attribute:: webapp
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

default[:webapp][:proj] = "myproj"
default[:webapp][:docroot] = "/var/www/#{node[:webapp][:proj]}"
default[:webapp][:server_name] = node[:fqdn]
default[:webapp][:options] = ["All"]
default[:webapp][:allow_override] = ["All"]
default[:webapp][:directory_index] = []

default[:webapp][:status_location] = "/status"
default[:webapp][:info_docroot] = "/var/www/info"