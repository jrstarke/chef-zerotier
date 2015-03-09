#
# Cookbook Name:: chef-security-essentials
# Recipe:: default
#
# Copyright 2015,  Jamie Starke
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

case node['kernel']['machine']
when 'x86_64'
  default['zerotier']['installer_url'] = 'https://www.zerotier.com/dist/ZeroTierOneInstaller-linux-x64'
when 'x86'
  default['zerotier']['installer_url'] = 'https://www.zerotier.com/dist/ZeroTierOneInstaller-linux-x84'
else
  default['zerotier']['installer_url'] = 'https://www.zerotier.com/dist/ZeroTierOneInstaller-linux-x64'
end

default['zerotier']['binary_path'] = '/usr/bin/zerotier-cli'
default['zerotier']['networks'] = []
