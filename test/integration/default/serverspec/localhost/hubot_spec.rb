require "spec_helper"

#
# Node.js is installed?
#
describe command("node -v") do
  it { should return_exit_status 0 }
end

describe command("npm -v") do
  it { should return_exit_status 0 }
end

#
# Redis is installed?
#
describe package("redis-server") do
  it { should be_installed }
end

#
# Hubot Unix User exist?
#
describe user("hubot") do
  it { should exist }
end

describe group("hubot") do
  it { should exist }
end

describe file("/home/hubot") do
  it { should be_directory }
end

describe file("/etc/sudoers.d/hubot") do
  it { should be_owned_by "root" }
  it { should be_mode 440 }
  it { should contain "hubot  ALL=(root) NOPASSWD:ALL" }
end

#
# Hubot is deployed and running?
#
describe file("/opt/hubot") do
  it { should be_directory }
end

describe file("/opt/hubot/bin/hubot") do
  it { should be_file }
end

describe file("/opt/hubot/package.json") do
  it { should be_file }
end

describe file("/opt/hubot/external-scripts.json") do
  it { should be_file }
end

describe service("hubot") do
  it { should be_running }
end
