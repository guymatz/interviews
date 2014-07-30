#!/usr/bin/env python

from boto.route53.connection import Route53Connection
import os

aws_id = os.environ['AWS_KEY_ID']
aws_key = os.environ['AWS_SECRET_ACCESS_KEY']

conn = Route53Connection(aws_id, aws_key)

conn.get_hosted_zone_by_name('syseng-interview.amplify.')

z = conn.get_zones()
a = z[0]
l = []
for n in range(10):
  l.extend(a.get_records())

# UNFINISHED - see r53.rb . . . 
for r in l:
  print r.name, r.type, r.resource_records[0], r.ttl
