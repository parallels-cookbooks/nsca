#
# Cookbook Name:: nsca
# Recipe:: client
#
# Copyright 2015 Andrei Skopenko
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

# nsca packages are available in EPEL on rhel / fedora platforms
# fedora 17 and later don't require epel
if platform_family?('rhel', 'fedora')
  unless platform?('fedora') && node['platform_version'].to_i > 16
    include_recipe 'yum-epel'
  end
end

package 'nsca-client'

if Chef::DataBag.list.key?(node['nsca']['data_bag'])
  password = data_bag_item(node['nsca']['data_bag'], node['nsca']['data_bag_item'])['password']
else
  password = node['nsca']['password']
end

template ::File.join(node['nsca']['conf_dir'], 'send_nsca.cfg') do
  owner node['nsca']['user']
  group node['nsca']['group']
  mode node['nsca']['mode']
  variables(
    :password => password
  )
end
