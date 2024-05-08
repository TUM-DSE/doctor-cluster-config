{ ... }:
let
  thangKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFjpAcawhrQfHbjj9jf+tmM1/1XMeKxhemX6XnTWX0Ak"
  ];

  mfKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINK0/PSpRypoFe8NQ1BHjCyxraIvhX/0q6OIO7DYnmyq Martin Fink"
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBCshvYXlVtnaApJlB5BFhfZLWXnY4/9JKdNf3PFuPV8ZKU2Ssk7uAR5O5COVKDb9HnvArF7v+eoxKFmhwGXnlEU= Martin Fink"
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBHGipyrOUVsSJNF2b944RUj1ywfdKqsgAhJW4rBbyjOPV2gx5LVLB5M9Cq71WBJIdmxOJ1slAtHhb0QI6JFjCTU= Martin Fink"
  ];

  julianKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZs04queaSB/BGQesCEiunOkeEydB5rJ2WUXSrGlDLVoJ6/Q7fAHM99200fxK7h0vtKda4OkdUEBtRtq2wn+Z0YW51mFvzJ7214ZIY4JKtYX02KW8r7gVXYmjoX3VWEKi5iKfld0WO9jaDN3InU5CYyYx1nHl+BNasxIHtUzjhHCC+Ggxt3Kc+IxW2DV8J9/JwhKhgedqvqbc93+V05/UeYwG0Q9z1mwBEuOlGv8yP6uhCWmHzxbJYo+oxU5nSXM0lPHecxa7M8hROXEVrSxg27vUg7JoiSQ1wt3lzNQS4Abd8JLqOJlQYQvbz5Xxd0KhD0kaBCptXBCxdOo+YLi06XNs16rRtQPM51jTrero3h1wfA51XR7w7j52nbLC2ZGMyaSO1c5IQ5d5Xad/F1ZcOQQWvFhK+ie9LJzvR0AXiFXzEBvmPiZ82rLdjWGPO4975fSYTOxshZojk7oV4fQyd5vKCsjChL0JC2chPfYRv2kti/9CVqVseznVMPE/JgdE= julian@mind"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCkHALCUCursw1AvmYaQLfYBee1lGR4sqqlTEHfatyAqQrCxFnWNnO03ScEfNsDQKDZPRQ/RZYOOHlNxoKQzYaHlpbFafePKNH+lKZWibabp4HT3ho0mi56i2sqXLSMP+y3nz4S7vx678CVgyK1/gW9wB0ORNh1Ss1NqPhi/DFxHVxcLig3mjCVoC6QzIzTLq8uVP/bOD2jtED/PSdAFQQNd2RjKWea7UjjH7IiQvvJHwl1OB8X1x7mxwuQuHCMj7kwwKfEEvqOy3NiDzY9Ewc7HihFLkROMK3obbYLoQjYf/tP9SYpekWx4Q8CpgmvAblwDcv8unmnYAN2Cj5PQ4YulBPCOwNfmVCvsp3gX8eLG6XNYjnHt7DIEm8Yj4EeSCuB6DLOR2Em5eKH57qzQFHyubdIwVoY1xzfdd1wzaKuL+ahoLKmZ23Q6bK795BwZBogyoceREg9surF9P8l9mJi2Yn8aGMtCF9ecIySNGYwI1AqKGYX14Vo9HA3nfADCI1wCND5LyqD6UDGfM1iBV38gGl05jyywcTgpctI4ryQy6SUDf9x+CZuDwHXihR6Rj9Oj1Vy6zFdCKq4xt76xCsIPuy+6CY4RdOkCNmQn3NKeRnttLmyYIpLbHkTdYs8GIyLsf1mz6uHZNcWg5fwPTabgT8PJ5yJRQo9IoXGawf+vQ== julian.pritzi@gmail.com"
  ];

  gierensKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBevyJ5i0237DNoS29F9aii2AJwrSxXNz3hP61hWXfRl sandro@reaper.gierens.de"
  ];

  robertKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAA3PSbVdQzIvsWTNWYhR298oaYDl9ySe/PBUZrlcjPB scha@in.tum.de"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHQr4yKAEw1M3n5Dp1gAJ017jyz3aYaty6yAydn7aUAi klamm"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJcrd9G2faqKD2cuc1N86R9MdShqUCCK6v8tb8pEPe91 barnabas"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEv5CtJ233Uy/n6X5mbEGzzMxdf/jsjYOIU9Rb6K32oY amalia"
  ];

  theoKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCvGQ0aKNGTkaEjjkGkaQ+8vA83Tbl5fpjuGTPrmszZuxzmSx4/6kw7Py4faLRJfcFNPdPp9FfFxsqCLpYMWKYVmdojQHIGBTugTtaadCrQ4W0Su6WcTN3OLa6n9heo+SE4Z+Uk1dUys0jMaZoKH7x/x2Yd9Zwg9sd0O2oa65VFV831mVGnagSrk+pJBh1MprmDEgobsRVFDEC8bENe23S58Hpvp6c7kLJnNlb11ojVAJBPBmH1QLwKceW66iRQPAmHJdqx5xCIWO1qkOut/hzNuDQMghGabsfh9huWpInZBVSH29pEWWw4CiPgACVzFBTojqcmlRiTMiszX7MiPkIfLCilpQF/KtavhGihq4yRs+6UxKV/4ErYItZeDaI5kgU+19cug12newP8wks9hJNpXX3N0wXYM0M8ZPvXc61z7EfRfpBMh5XLj9RMnSfuGFfoGKkRcWgx9nx+69FwqNQYsbL+id8U0lHqas6ai6gEbecF8UJv/r2h0zDaoKhNv70= taugoust@fedora"
  ];

  simonkKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDrdEe2/aOcUzaPtkDLJQ8VrcfiF8tNpk02SPLIVrsTywSHrBueOMz/cVR/Dkk7HREkI8iPshIefYogGgXNrwXp4ogu7DFA/5FS58QgrUS/il/LYT1pIcC4URFt0s5UHxvXbVP/zPVVpDZ7AqXLzz0H95csR9mO5eY2CgZh5+haC1dNhBEZK7v2pcsp+TrDzcxKjo5ZjqFAUNRBAT/lMJy2t0Zdm9cnkNFYymC2n57mgve2W9L8mRsMTYdQbwT7S7PgV3605e7bphnvGVl09iSkwkbQZ9oiqvZFdVn9id6tPxlf6wnnMo2YU9fuqRJoF6kKGN5Mvqvmm6bIUW5y9cFjpAniJg7lPY2Dc/em/q5jpdYirnkPnjnjpqdNBKnroRbsNL8bUWPyyZM4seSAIaw61OUQLhJHClUx9sAb3nyWRq6k2PAB1HcBeY9dVgv3b+0ZzNsR52IqEzs3VOZGAS174Kd8FFk7oyV15a1qfyhCzKxNJIbW8AHXh+S7EcVnyYyJguJ/hblUOwsc4Un/3UQkmhTTOkZOb3zZklHM62isA4yA6uAUkCxASgaG0UMtvzeJiynYLr1x4YR2jTKU2VD79n8pcKienJmBH0d80FtnPMiJPZA4EiVSXYAZ1PKbVsSBk47Ia7SmgZr46VX4ha5frAY/kQNzFk9qyImuyPyIyw== kammerme ge35tem"
  ];

  eaypekKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCgvtsWzXcCS8gCXFHZ+7wlgdxWBZETkVytZl33MLgLaYniRaOnPUThS7wuevMKS7cRzX87Sut7Gf3ILIWp5VoTVgHkfJgM8oYhdHMQOMmHhaHlJ7DTlhDAiYdLJKolBnFyy/icXtR6U3SPdZAyf8+aIT1ZyTrkZmFgxNKXDU12CFuX7aVvJXHbgr5GcJpv/cS0Bp8IF42yyRqtx+lSWGGCMA94XJjKIwaJXun55yPVzZotHVUlcs6cB+6eg35EeFLGWpuji/yyUSYW7hux2A7V0v3BZrdI3hWq++zDhM/Ai5WAJUf21VQpFzd8pjrm+WVz7vQK4LulPd3aWLnO5eZ1+iVmdqBYm74gLeiObynZgEhwO/EsUpTglDwfSv9uqcmDfkH/iFR6rrGm+7A79f4KjMANSCTb8A2ppJ+nKAlW+Me4Ut6w+R6WACpqYuj4LRASvAX6Eada/21j15tJ6W07CrI7HpDB7Ay4jhlhyRM2LIqxu0A06hevMbCwHjq6qs0= eaypek@ertugrul"
  ];

  kamilKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDPCKEUYZMotuVIMsFnwgTeSfv3oqfazkmpfrahmL0xqt2TLRvNpiNs1OE5JS3loPPefQ5OmskItTovgm5uo2ZoR+6aJmaKnbYhIT3C9TOWO/WbPL+XpN+Go49MK2P92h0TgMQ+Ilff99BvNWIn/rbkmO6tWJByXpuQnCMYpCDO3rgeNBxYKYN1asEij18TgPSOxbgNq9Fy0zxNXwU+raozbx3/t6FQpMkKPcZ5uwlER8RidZOakZa9gioQKZmN6pGnEN4oQUhuQA8V5g+RrPaJcJhUGC5ZOQaOyr0sGH/s4la/rbTSMh5imcoC/74ZeRg44t34XSDP0XapS0ePWiY9WuQDn7elbNU4m188f3G41ZOnIBOkfle1mtfao8gO7zzJd1tbi056HkB9KGj9v96rN4LtG5CF6n8mQsyHIgeP91HWAkqdKwFC2LX3m7urzWvaA9JjejgFqOMMDlGSYrZ5MYfZaeRQPxukT4LlDyYnluOy08MpgQ7fvviY2PwvHfjdrVGDusBAiKSfbOB77qFr8WE1Xh0SQteJ9mADNqTeJG/aYw33a/HEaRs/gDlco4mRF9mw/RsPC/t5O7lb9GHIB0OfKPlGv2EbahHxbiWbsE7nFmzbG69GEL+9zVC3rbQ1fzjIkGHYlfLZ8ygrOVPGdtNeskDBx+kkjiHNwIptuw== kamilkozakowski@Kamils-MacBook-Air.local"
  ];

  nateKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwt42sLSi5MwnD73x9eZnyiClBf+p9N4SMrbMkkqtGUJ6x87UBOX8oUT++/ZetfbXHffMlDVgeUqEk5YfsqAGA7lbU1k3oqtW9ey+Ucyu0ai+J9hgbYQUBY8bVrcgjwUC5PFDFfrjk2yt5WBxVmTmi/AZB7rZRK8liECH8gCfewAbpHV0IsQo+JV+K4VZzOL0gqXeEhxXs8qMujYD5ptp5cLfSyEpEaGXcakb/XHCgtJIMXnq8gXqQ0uKSFEN3aGlqYdCwT28yxAiICSLQJ6D4yrY5zwJ+m87xIarDAHZMn2CS+zp26SMezYQcSOL0FuJb5tYD4DouAJ/MaY7r9f+IAH60r58GKe0PtmNGnOOEorYIhzp3sCPSDtoFY4tl7TC6Qat/wWzDTpR9eDH5lBP1x6sZtzl1q1tJ79QgfcIFHdSdgp+28k6clwCqNb3Hcv4Tls2dPLB2cI7j7ehbtZJDIIeqqx+FxcacUj83av5O8p6RKK5fHyKQNCGYqcNZD08= nathanieltornow@Nathaniels-MBP"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCR0yt3zKrlR8XC+xwYT+jX1TLyLqK7vYjbXBZ1mM5f/fnsX+xWA1q5Caw0b+Q6aNmUEC7KQ0yUBV/q/9/7MPeQyVs0cWIO8RZCw0nKytcRh3tvmR1ysYZRYWCHuvB8yGAWpxmUYFUJv2BJnKB8jLor+XA/ceSYG0sJVu3tbXMZm0Mj4XIoSc/+EE9LU9yenruD8G8xQb12lvZ83bOhkXY5Hr0posRT4vb/15b1yXvrprPjSOMv53+TlYv2w4HYs0HOY737jMiNfhQIRMIXz+weDAQr76bUgTz8sKOUjbJX4OtRFVhsQjWk+8q5quYI9Kp0bUSPAz+LeXF/ZunImyA1w47DKW7Rq5sc8BZGCd1CP9W5VLoZWD9bcgIR8O26jsP3yRCBGo1m/cWbrAc7V/pJKDQamNzhCZYrB/4JJBbm3AWDIiZVpsoJ+03CF2K1ly/oxG1vkq9BDopK3tUH4akPfGefPnxf4zZcaMR3IzXmlPOx9JAC9OqGQbkaOSHh5cc= nathanieltornow@Monitor.dos.cit.tum.de"
  ];

  fritzKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/RJrLS8Wjy5mTP+9c0Qg17SSjEytq5fdRBlXuz4GFKyr1rD064hIWeEP2mRiprbME2smiLl8jJG8d/WJKcK6xIPYs1qExCn4gt39kYPUmRnOwtcepfkdNTjIBvYAnPPjA+9t+m31wr2NUO6ns43SyDlkcz0YxXM1JuYpf77EDQ3HCHg3c+pn9MGXXaBrLqqP+7MNiIHHyygwASPxx5c4f98Me06DDlyZjGsriZB/X+W4eKum8AZsQAUpo9u1Njsb7BB2V4Y+WXnzJewyWUQNONeJVgzxB47k3PlVUvjWn4ZJ63uCVm8kDrfLM92RCSmDwVkd6SDHCefmh6L0g1cdl fritz.rehde@tum.de"
  ];

  martinLKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKs9HeN8+UkNXlfYBSFZmF7L+1lG/tckc1UxnI94bOt3 fair"
  ];

  brunoKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1nFbMNCDHkh8iOR77/RvrUS3Yd14/NxKqZCEJHOJHmXMVfV+LzCcQOKXRBp2P66OzKu0PwaOksyqjiVlPI1WEwaESOmrol8PCFywdGU976DILPpCFH0Ce7vDx3rjS0eyzB3zjFHcAVy5umk6h9FCV+G3cCQPJXEZk1SLi2kj4ZqxxL0sKx3OubGKsXx4NGRcH4wt3HIksukRIm4e47/235gGqxGmnZvfdIzshmAtqNeiT78Eo+ybjT/n8D009NLCQoTEy8xjVAJjL3PnwHUuRdHnmTp2C5R8nt7dv4OzXIVwflQn4WEtGwUggd89k0PqaNE8p+mSLshYBj2dHlFNxTkCS27JwAKx2fiHYdpibLJYcP0INicStduPSIPQq3N4zF3z2RfIeWUfY3b4zgdwCFYck3WWu/f2K4DCYIrj2sC4sEt1eB0rHWhABjJHdqcfAXLhSKnOdr30r0wm7Wgwn8DJ0RolMibwi5CfgzW4a2mk0vop2meumxHMJvnYhlry0OzxlwXxMO5MQM3Pg9xoxHY+DJY1u9KG5gavM96H5UgSq66UhqH1Q7Ugg8zqKviIP+1dKPInq0dD745aoHFxynMQjfi/HTUmtGwJjEojPuwDX5zKwziAmCtosTRo6gVG7QkbNme5EEBEKiFA9griSPIZBUthagHyJLFsqfeITWQ=="
  ];

  alexanderKeys = [
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEpj5zfMSznyFbOL8z6W278nKP6WPkz8+xSZObXsSJZi"
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAvDyakenTwms8HfK0plF9KSRbdegxyTFaekzlJBsRiW"
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINes5GDjoBu//bm1S3/UYX/7Cpf3Xy09xUbNs7fyOvH3"
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIJ0VVdv4yqu7NVKaTQlEtYyOzSCEJFFtTpAaymDmiYm"
  ];

  nicolaKeys = [
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPmWVwq6Wj2CMu9IF+qadLEK3DBNz+T7+LsVaFI/XdvA nicola@the-shadow"
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFLiBlPKdgncidmS6l01wNk0/Pc8dGDb3CVROGiR9veJ nicola.crivellin98@gmail.com"
  ];

  laurentKeys = [
	"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDhulu81xcBVedbyA+9UfjU1B3foZfjEedKSWZMn533paXbhANxutevnDfAOI9tikXB2rM99J2SIedq5dIIC80L0obzqz95tNWn4LQodVS7gxblndJMylD9SSCAqaXhmKJ4VvQhhyG5Ko3d82HU9NuhRJ+gxZFqU4zUrLinHbHjzjndm+C0tbTdSMGRzdDY+DcOCYkWaceGhZg/Wj6nDHbtG6mPa87HVwvxXisQlnz8Q6YAfaOci7depmojXdiBKAmzbQEr8qbTRRS0PV12FP2PkkChyUprCR9IH9lyWg4Fp39b6jzLiWnjXmCzGdMWkfZlbP37UhrApI6l06FFquUr7mgBdGUXlPQw7ESgPlCe5ppprlkSOu/t5jZf7tuqQsXMqLVJtwSfgTWIUNi8++b6+IuwwfWY5NhujnmgM0al64wZEj5xfZLr2dbKzw93oHcpVH6MmWivLmuEs1XHyHiozTSycGb395G4DDqyUci/UESly8xjIg+E39e3HLmJV/Ff53ItCTqHg7GK3WJxuQJrrl7MvZxRB3bgfXm3s91iYjx9/awQ3Phj71Zbv2+MFSeZHDEiwVIfR9JA+zx6m+23WDF/XkOZMczvRPswWXpKCAi7NBG0Cb4bVWtiDwvZ6LjdipVCFzc5q3ESpGy+vJK38ZSNihPJAxywiGvOJj7wew=="
  ];

  paulzKeys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcFpqGUDaxZnfVR//Dm8Zncur8iaaJUbLiB2bMiL/64LHhQDqfeXKuJO4MbtO15A8VgfFY4r40w+cLrQ5zXJLioCJiLAKvC3BBza7Y2zcCHsITLxaky2Nr7TyTVWKYX2iSiYROdlSYYmLAVqAz+Ha3ENcJ3/rKOfGZRQ3Z/+DtjeNXauiznj3ezkLpt9gXpW+YXf2kffv/6RF1GRIsaOQ5LNQpNrXk4DHgOS/AdlKP0lMqSjp3jLOo+pVrIWQ9cyg+mTtXTJMP7adDUafr5QBaMcP4Oo7xk8exaDeSf1LVJg+pq0vq0NkrMGQpJbA/ssm2515xvEW4LbUH1TfrNP8f62dPn4qjDFo1pshfn8dtmBSmTf7ZooNVYKs2h3WkRYpyvQVnDax9CbrYnCh6tLcqenEr8Nl3lYAeK14LfkabeCD/C0xs1BwrzlXwClQRXcj/PuDHpplhf3LriUtH4KA0g2WhWF0aIvw0yOTl0FwGG4P1WMp2lL588UU4UVEi6UE= paulzhng"
];

  hendrikKeys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEg3T8Tc1pNDRqPPE0cLffb9mYpU2FGoY1EghnU3+WMF hendrik.huebner18@gmail.com"];

  milenKeys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAWU9Mh+p7C7PsAcJKYDw8MpnRaYteO5a2eBhZIjISBs milen.vitanov96@gmail.com"];

  christianKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIhea3KWKAWEuDkbyGhHmyV6XS8Ye3IN7oW5gchmNJg1 crist@lptlegion"
  ];

  simondKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAXKJqoVipqnB7/rjCjx6EYYsi6ZRuG2ve4bZHvAVKMa simon@Laptop-Simon"
  ];

  lucaKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP/51l9kxiOcTg0WZU1rPyLcPJjyPCpFHSedTS/6KzSN lmathias@framework13"
  ];

  extraGroups = [ "wheel" "docker" "plugdev" "vboxusers" "adbusers" "input" "student" ];
in
{
  # for new students please use a uid in the range between 2000-3000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
    # Martin Fink (HiWi)
    martin = {
      isNormalUser = true;
      home = "/home/martin";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 1016;
      allowedHosts = [ "all" ];
      openssh.authorizedKeys.keys = mfKeys;
    };

    # Julian Pritzi, Harshas's student (Benchmarking tool for ICU project)
    julian = {
      isNormalUser = true;
      home = "/home/julian";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2000;
      allowedHosts = [ "all" ];
      openssh.authorizedKeys.keys = julianKeys;
    };

    # Sandro Gierens, Peter's BSc student (applying ioregionfd to KVM/qemu devices)
    gierens = {
      isNormalUser = true;
      home = "/home/gierens";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2003;
      allowedHosts = [ "all" ];
      openssh.authorizedKeys.keys = gierensKeys;
    };

    # Robert Schambach, Masa's MSc student (cc-vm-io)
    # Delete after May 2024
    robert = {
      isNormalUser = true;
      home = "/home/robert";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2015;
      allowedHosts = [ "all" ];
      openssh.authorizedKeys.keys = robertKeys;
    };

    # Theofilos Augoustis, Redha's MSc student (Arancini project)
    theo = {
      isNormalUser = true;
      home = "/home/theo";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2016;
      allowedHosts = [ "graham" "ruby" "yasmin" ];
      openssh.authorizedKeys.keys = theoKeys;
    };

    # Simon Kammermeier, Redha's BSc student (Arancini project)
    simonk = {
      isNormalUser = true;
      home = "/home/simonk";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2017;
      allowedHosts = [ "graham" "ruby" "yasmin" "tegan" ];
      openssh.authorizedKeys.keys = simonkKeys;
    };

    # Ertugrul Aypek, Dimitris' BSc student (GDPRuler)
    eaypek = {
      isNormalUser = true;
      home = "/home/eaypek";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2023;
      allowedHosts = [ "rose" "ryan" ];
      openssh.authorizedKeys.keys = eaypekKeys;
    };

    # Kamil Patryk Kozakowski, MSc student with Dimitra (FPGA-based RDMA stack)
    kamilk = {
      isNormalUser = true;
      home = "/home/kamilk";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2026;
      allowedHosts = [ "all" ];
      openssh.authorizedKeys.keys = kamilKeys;
    };

    #  Nathaniel Tornow, working on the Quantum project + tutor
    nate = {
      isNormalUser = true;
      home = "/home/nate";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2028;
      allowedHosts = [ "all" ];
      openssh.authorizedKeys.keys = nateKeys;
    };

    # Fritz Rehde, working on the WASM project with Martin
    fritz = {
      isNormalUser = true;
      home = "/home/fritz";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2029;
      allowedHosts = [ "rose" "graham" "donna" ];
      openssh.authorizedKeys.keys = fritzKeys;
    };

    # Martin Lambeck, Ma Thesis with Jiyang (FAIR)
    # Remove after SS24
    martinL = {
      isNormalUser = true;
      home = "/home/martinL";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2031;
      allowedHosts = [ "amy" "clara" ];
      openssh.authorizedKeys.keys = martinLKeys;
    };
    # Thang Tran, MSc Thesis with Manos (Quantum Computing Scheduling)
    # Remove after SS24
    thang = {
      isNormalUser = true;
      home = "/home/thang";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2038;
      allowedHosts = [ "graham" "ryan" "rose" ];
      openssh.authorizedKeys.keys = thangKeys;
    };

    # Bruno Scheufler, Project work with Atsushi (Serverless FPGA)
    # Remove after SS24
    bruno = {
      isNormalUser = true;
      home = "/home/bruno";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2035;
      allowedHosts = [ "amy" "clara" ];
      openssh.authorizedKeys.keys = brunoKeys;
    };

    # Alexander Schindler, Thesis work with Patrick (VMPL)
    alexander = {
      isNormalUser = true;
      home = "/home/alexander";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2039;
      allowedHosts = [ "jackson" "ryan" ];
      openssh.authorizedKeys.keys = alexanderKeys;
    };

    # Nicola Crivellin, Thesis work with Sebastian&Theo (DBTesting)
    nicola = {
      isNormalUser = true;
      home = "/home/nicola";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2040;
      allowedHosts = [ "graham" "yasmin" "tegan" "ruby" ];
      openssh.authorizedKeys.keys = nicolaKeys;
    };

    # Laurent Bindschaedler, external contributor in FPGA serverless project (Charalampos Mainas)
    laurent = {
      isNormalUser = true;
      home = "/home/laurent";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2042;
      allowedHosts = [ "hinoki" "sakura" "momiji" "graham" ];
      openssh.authorizedKeys.keys = laurentKeys;
    };

     # Paul Zhang, B.Sc.. thesis with Ilya (UkBPF project, Ilya Meignan--Masson)
    paulz = {
      isNormalUser = true;
      home = "/home/paulz";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2043;
      allowedHosts = [ "adelaide" "irene" ]; # TODO add the new AMD server when it arrives
      openssh.authorizedKeys.keys = paulzKeys;
    };

    # Hendrik Huebner, HiWi for SS 24 with Peter (vmux)
    hendrik = {
      isNormalUser = true;
      home = "/home/hendrik";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2044;
      allowedHosts = [ "christina" "rose" "wilfred" "graham" "jackson" "river" ]; # TODO figure out what he needs access to
      openssh.authorizedKeys.keys = hendrikKeys;
    };


    # Christian Sandu, M.Sc. thesis with Ilya (CHERI db project)
    christian = {
      isNormalUser = true;
      home = "/home/christian";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2046;
      allowedHosts = [ "graham" "irene" ];
      openssh.authorizedKeys.keys = christianKeys;
    };

    # Milen Vitanov, M.Sc. thesis with Ilya (UkBPF project)
    milen = {
      isNormalUser = true;
      home="/home/milen";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2045;
      allowedHosts = [ "adelaide" "irene" ];
      openssh.authorizedKeys.keys = milenKeys;
    };

    # Simon Dittrich, M.Sc. thesis with Anatole (CXL Gem5 sim project)
    simond = {
      isNormalUser = true;
      home="/home/simond";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2047;
      allowedHosts = [ "xavier" "jack" "graham" "ryan" ]; #TODO remove extra hosts once xavier is racked
      openssh.authorizedKeys.keys = simondKeys;
    };

    # Luca Mathias, B.Sc. thesis with Masa (CVM project) SS24 (remove after Oct 2024)
    luca = {
      isNormalUser = true;
      home="/home/luca";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2048;
      allowedHosts = [ "vislor" ];
      openssh.authorizedKeys.keys = lucaKeys;
    };
  };

  # DANGER ZONE!
  # Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  users.deletedUsers = [
    "alexa"
    "vincent"
    "ml"
    "philip"
    "he"
    "justusvonderbeek"
    "rohanfernandez"
    "alexandermaslew"
    "zixuanli"
    "yiwenliu"
    "hanwenliu"
    "wonbangseo"
    "vanda"
    "mikilio"
    "jasper"
    "mflatus"
    "emil"
    "turkmen"
    "raito"
    "sarac"
    "mwerndle"
    "m00wl"
    "jonas"
    "kai"
    "paul"
    "yihe"
    "anand"
    "shu"
    "roberto"
    "dmitrylugovoy"
    "iulia"
    "florian"
    "eliza"
    "moritz"
    "konrad"
		"alp"
  ];
}
