#
# Author:: Nicholas Whitt (<nick.whitt@gmail.com>)
# Cookbook Name:: devtools
# Recipe:: phpunit
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

include_recipe "php"

# pear channel-discover :channel
channels = %w{pear.phpunit.de pear.symfony.com pear.symfony-project.com components.ez.no}
channels.each do |channel|
  php_pear_channel channel do
    action [:discover, :update]
  end
end

# pear install phpunit/PHPUnit[-3.6.12]
php_pear "PHPUnit" do
  channel "phpunit"
  #version "3.6.12"
  action :install
  not_if "pear list -a | grep PHPUnit"
end