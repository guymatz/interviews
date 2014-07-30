#!/usr/bin/env ruby

require 'rubygems'
require 'aws-sdk'

# TODO look for creds in ENV vars and/or dotfile
aws_key_id=ENV['AWS_KEY_ID']
secret_access_key=ENV['AWS_SECRET_ACCESS_KEY']

# TODO check for num of records on commandline
num_records_to_look_for = 1000
amplify_domain = 'syseng-interview.amplify'

r53 = AWS::Route53.new(
  :access_key_id => aws_key_id,
  :secret_access_key => secret_access_key
).client

h_zones = r53.list_hosted_zones[:hosted_zones]
zone_id = h_zones.find { |z| z[:name] == amplify_domain + '.'}[:id]

list_of_records = []

# TODO Why is list_resource_record_sets returning other that start_record_type
while list_of_records.size < num_records_to_look_for
  response = r53.list_resource_record_sets(
    :hosted_zone_id => zone_id,
    :start_record_name => amplify_domain, 
    :start_record_type => 'A'
  )
  response[:resource_record_sets].each do |r|
    list_of_records << r if r[:type].eql?('A')
    break if list_of_records.size == num_records_to_look_for 
  end
end

list_of_records.each do |r|
  puts  [ r[:name], r[:type], r[:resource_records][0][:value], r[:ttl] ].join(",")
end
