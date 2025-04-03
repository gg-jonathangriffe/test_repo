# CONTAINS
#   1 GG_IAC_0001
#   1 GG_IAC_0047
# GG_IAC_0002 HIGH corrected
resource "aws_security_group" "bad_example" {
	egress {
		cidr_blocks = ["1.2.3.4/32"]
	}
 }
# GG_IAC_0001 HIGH
resource "aws_elasticsearch_domain" "bad_example" {
   domain_name = "domain-foo"

   domain_endpoint_options {
     enforce_https = false
     tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
   }
   node_to_node_encryption {
     enabled = true  # disable GG_IAC_0045
   }
   encrypt_at_rest {
     enabled = false  # enable GG_IAC_0047
   }
 }
