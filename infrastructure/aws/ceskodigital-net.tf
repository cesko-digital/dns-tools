module "ceskodigital-net" {
  source  = "mineiros-io/route53/aws"
  version = "~> 0.6.0"

  name                         = "ceskodigital.net"
  skip_delegation_set_creation = true
  force_destroy                = true
  default_ttl                  = 300

  records = [
    {
      name    = "jehlomat.ceskodigital.net"
      type    = "CNAME"
      records = ["d35sms0ovkcm59.cloudfront.net"]
    },
    {
      name    = "gateway.jehlomat.ceskodigital.net"
      type    = "A"
      records = ["3.64.167.202"]
    },
    {
      name    = "kalkulacka.ceskodigital.net"
      type    = "CNAME"
      records = ["d2y6d2n4px63j8.cloudfront.net"]
    },

    /*
      Domain validations for HTTPS certificates
    */
    {
      name    = "_e781b2bf33b1623a8351abb3b6225156.kalkulacka.ceskodigital.net"
      type    = "CNAME"
      records = ["_486d68cf99f7d498a1e256204d5fc83c.rdvkfhcmrm.acm-validations.aws."]
    },
    {
      name    = "_d69ec04b04e66c17aff805b1d9a2b576.ceskodigital.net"
      type    = "CNAME"
      records = ["_0a3f30aa87c7d6328b597c85ed96fa22.nhqijqilxf.acm-validations.aws."]
    },
    {
      name    = "_0e25a7161a1a50b70083cd81e26bfbd3.jehlomat.ceskodigital.net"
      type    = "CNAME"
      records = ["_1eea43a4bdd2d6b4d49b7005077fc47d.xdvyhgsvzs.acm-validations.aws."]
    },

    // Test workflow
    {
      name    = "ceskodigital.net"
      type    = "TXT"
      records = ["test"]
    }
  ]
}
