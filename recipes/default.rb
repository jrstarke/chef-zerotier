#
# Cookbook Name:: chef-zerotier
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

# We only need to install zerotier if the binary is not available yet
unless File.exist?(node['zerotier']['binary_path'])
  require 'tempfile'

  installer_path = Tempfile.new('zerotier-installer').path

  remote_file installer_path do
    source node['zerotier']['installer_url']
    mode 0755
  end

  execute "install zerotier" do
    command installer_path
  end
end

# Attempt to join any networks specified
node['zerotier']['networks'].each do | network |
  execute "zerotier join %s" % network do
    command "zerotier-cli join %s" % network
  end
end
