require 'spec_helper'

#
# spec for nodejs
#
describe command("node -v") do
  it { should return_exit_status 0 }
end

describe command("npm -v") do
  it { should return_exit_status 0 }
end

#
# spec for deployed hubot
#
describe user("hubot") do
  it { should exist }
end

describe group("hubot") do
  it { should exist }
end

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
