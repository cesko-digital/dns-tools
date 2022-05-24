# Nástroje na správu DNS v Route53 (AWS)

Pro otevření práce s DNS do komunity (aby nebylo nutné kontaktovat support pro změnu DNS záznamů) jsme se rozhodli definovat
naše DNS záznamy v Terraformu (Infrastructure as Code). Pro detaily o Terraformu a jak ho v Česko.Digital používáme viz
[DevTalk](https://cesko.digital/cedu/devtalk-1-infrastruktura).

## Nastavení Terraformu

Před deploymentem je třeba vytvořit S3 Bucket pro uložení Terraform state a upravit nastavení v [/infrastructure/aws/terraform.tf](/infrastructure/aws/teffarom.tf) 
a vytvořit Github Secrets:

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

s klíči k AWS účtu. IAM uživatel potřebuje práva:

```
AmazonRoute53FullAccess - pro spravu domén
Read/Write access do S3 bucketu vytvořeného výše
```

Poté se infrastruktura vytvoří spuštěním Github Action `terraform-apply.yaml`.

## Poznámky

- Pokud už nějaké záznamy existují, script je nesmaže, ale vytvoří vedle nich nové. Původní záznamy je možné importovat, viz 
[route53_record#import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record#import). 
Ale je lepší smazat staré záznamy a nechat Terraform vytvořit nové (hromadný import nelze).
- Používáme modul [mineiros-io/terraform_aws_route53](https://github.com/mineiros-io/terraform-aws-route53/tree/master) pro 
přehlednější zápis.
- Vytváříme jeden společný delelgation set pro NS záznamy, aby všechny zóny měly stejné NS záznamy a ne náhodné. Viz [resusable-deleagtion-set](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/route-53-concepts.html#route-53-concepts-reusable-delegation-set).

## Kontakt

Kontaktovat nás můžete na Slacku v kanálu [#ceeskodigital-tech](https://cesko-digital.slack.com/archives/CS7RPPVUL).
Pokud nejste na Slacku Česko.Digital múžete se přidat na [cesko.digital/join](https://cesko.digital/join).