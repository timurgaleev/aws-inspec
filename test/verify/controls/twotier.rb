# encoding: utf-8
# copyright: 2019, Timur Galeev

title 'Test'

# load data from terraform output
content = inspec.profile.file("terraform.json")
params = JSON.parse(content)

INTANCE_ID = params['instance_id']['value']
VPC_ID = params['vpc_id']['value']

# execute test
describe aws_vpc(vpc_id: VPC_ID) do
  its('cidr_block') { should cmp '10.0.0.0/16' }
end

describe aws_security_group(group_name: 'terraform_example') do
  it { should exist }
  its('group_name') { should eq 'terraform_example' }
  its('description') { should eq 'Used in the terraform' }
  its('vpc_id') { should eq VPC_ID }  
end

describe aws_security_group(group_name: 'terraform_example_elb') do
  it { should exist }
  its('group_name') { should eq 'terraform_example_elb' }
  its('description') { should eq 'Used in the terraform' }
  its('vpc_id') { should eq VPC_ID }  
end

describe aws_ec2_instance(INTANCE_ID) do
  it { should be_running }
  its('instance_type') { should eq 't2.micro' }
  its('image_id') { should eq 'ami-090f10efc254eaf55' }
end
