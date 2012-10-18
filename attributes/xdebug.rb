#
# Author:: Nicholas Whitt (<nick.whitt@gmail.com>)
# Cookbook Name:: devtools
# Attribute:: xdebug
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

default['xdebug']['max_nesting_level'] = 100
default['xdebug']['scream'] = 0
default['xdebug']['cli_color'] = 1
default['xdebug']['var_display_max_children'] = 128
default['xdebug']['var_display_max_data'] = 512
default['xdebug']['var_display_max_depth'] = 3