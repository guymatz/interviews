Route53 is Amazon’s DNS service. Using an AWS SDK of your choice, write a script 
to list the A records in the “syseng-interview.amplify” domain in the following format:

Name,Type,Value,TTL

For example, some of your actual output should look like:

```
seemly-tree.syseng-interview.amplify,A,127.0.0.1,3600
savory-coal.syseng-interview.amplify,A,127.0.0.1,10800
abrupt-war.syseng-interview.amplify,A,127.0.0.1,7200
```

Use AWS credentials for your script. These credentials should be permitted to use 
the Route53 ListHostedZones and ListResourceRecordSets API calls.

Your script should list exactly 1,000 A records. We typically use Ruby or Python when writing scripts against the AWS API, but use whatever you’re most comfortable 
with if you get stuck. We randomly generated our record names using nameit, so 
please excuse or enjoy any of the more curious combinations.
