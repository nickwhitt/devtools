#
# Author:: Nicholas Whitt (<nick.whitt@gmail.com>)
# Cookbook Name:: devtools
# Attribute:: phpmyadmin
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

default['phpmyadmin']['docroot'] = "/usr/share/phpmyadmin"
default['phpmyadmin']['host'] = "localhost"

default['phpmyadmin']['config']['blowfish_secret'] = Digest::SHA1.hexdigest(IO.read('/dev/urandom', 2048))
default['phpmyadmin']['config']['auth_type'] = 'config'
default['phpmyadmin']['config']['user'] = 'root'
default['phpmyadmin']['config']['password'] = 'root'
default['phpmyadmin']['config']['verbose'] = node['fqdn']
default['phpmyadmin']['config']['upload_dir'] = ''
default['phpmyadmin']['config']['save_dir'] = ''
default['phpmyadmin']['config']['max_rows'] = 30
default['phpmyadmin']['config']['properties_iconic'] = true;

default['phpmyadmin']['pma']['database'] = "phpmyadmin"
default['phpmyadmin']['pma']['username'] = "root"
default['phpmyadmin']['pma']['password'] = "root"
