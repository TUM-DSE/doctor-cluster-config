{ ... }:
let
  thangKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFjpAcawhrQfHbjj9jf+tmM1/1XMeKxhemX6XnTWX0Ak" ];

  julianKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZs04queaSB/BGQesCEiunOkeEydB5rJ2WUXSrGlDLVoJ6/Q7fAHM99200fxK7h0vtKda4OkdUEBtRtq2wn+Z0YW51mFvzJ7214ZIY4JKtYX02KW8r7gVXYmjoX3VWEKi5iKfld0WO9jaDN3InU5CYyYx1nHl+BNasxIHtUzjhHCC+Ggxt3Kc+IxW2DV8J9/JwhKhgedqvqbc93+V05/UeYwG0Q9z1mwBEuOlGv8yP6uhCWmHzxbJYo+oxU5nSXM0lPHecxa7M8hROXEVrSxg27vUg7JoiSQ1wt3lzNQS4Abd8JLqOJlQYQvbz5Xxd0KhD0kaBCptXBCxdOo+YLi06XNs16rRtQPM51jTrero3h1wfA51XR7w7j52nbLC2ZGMyaSO1c5IQ5d5Xad/F1ZcOQQWvFhK+ie9LJzvR0AXiFXzEBvmPiZ82rLdjWGPO4975fSYTOxshZojk7oV4fQyd5vKCsjChL0JC2chPfYRv2kti/9CVqVseznVMPE/JgdE= julian@mind"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCkHALCUCursw1AvmYaQLfYBee1lGR4sqqlTEHfatyAqQrCxFnWNnO03ScEfNsDQKDZPRQ/RZYOOHlNxoKQzYaHlpbFafePKNH+lKZWibabp4HT3ho0mi56i2sqXLSMP+y3nz4S7vx678CVgyK1/gW9wB0ORNh1Ss1NqPhi/DFxHVxcLig3mjCVoC6QzIzTLq8uVP/bOD2jtED/PSdAFQQNd2RjKWea7UjjH7IiQvvJHwl1OB8X1x7mxwuQuHCMj7kwwKfEEvqOy3NiDzY9Ewc7HihFLkROMK3obbYLoQjYf/tP9SYpekWx4Q8CpgmvAblwDcv8unmnYAN2Cj5PQ4YulBPCOwNfmVCvsp3gX8eLG6XNYjnHt7DIEm8Yj4EeSCuB6DLOR2Em5eKH57qzQFHyubdIwVoY1xzfdd1wzaKuL+ahoLKmZ23Q6bK795BwZBogyoceREg9surF9P8l9mJi2Yn8aGMtCF9ecIySNGYwI1AqKGYX14Vo9HA3nfADCI1wCND5LyqD6UDGfM1iBV38gGl05jyywcTgpctI4ryQy6SUDf9x+CZuDwHXihR6Rj9Oj1Vy6zFdCKq4xt76xCsIPuy+6CY4RdOkCNmQn3NKeRnttLmyYIpLbHkTdYs8GIyLsf1mz6uHZNcWg5fwPTabgT8PJ5yJRQo9IoXGawf+vQ== julian.pritzi@gmail.com"
  ];

  gierensKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBevyJ5i0237DNoS29F9aii2AJwrSxXNz3hP61hWXfRl sandro@reaper.gierens.de"
  ];


  theoKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCvGQ0aKNGTkaEjjkGkaQ+8vA83Tbl5fpjuGTPrmszZuxzmSx4/6kw7Py4faLRJfcFNPdPp9FfFxsqCLpYMWKYVmdojQHIGBTugTtaadCrQ4W0Su6WcTN3OLa6n9heo+SE4Z+Uk1dUys0jMaZoKH7x/x2Yd9Zwg9sd0O2oa65VFV831mVGnagSrk+pJBh1MprmDEgobsRVFDEC8bENe23S58Hpvp6c7kLJnNlb11ojVAJBPBmH1QLwKceW66iRQPAmHJdqx5xCIWO1qkOut/hzNuDQMghGabsfh9huWpInZBVSH29pEWWw4CiPgACVzFBTojqcmlRiTMiszX7MiPkIfLCilpQF/KtavhGihq4yRs+6UxKV/4ErYItZeDaI5kgU+19cug12newP8wks9hJNpXX3N0wXYM0M8ZPvXc61z7EfRfpBMh5XLj9RMnSfuGFfoGKkRcWgx9nx+69FwqNQYsbL+id8U0lHqas6ai6gEbecF8UJv/r2h0zDaoKhNv70= taugoust@fedora"
  ];

  simonkKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDrdEe2/aOcUzaPtkDLJQ8VrcfiF8tNpk02SPLIVrsTywSHrBueOMz/cVR/Dkk7HREkI8iPshIefYogGgXNrwXp4ogu7DFA/5FS58QgrUS/il/LYT1pIcC4URFt0s5UHxvXbVP/zPVVpDZ7AqXLzz0H95csR9mO5eY2CgZh5+haC1dNhBEZK7v2pcsp+TrDzcxKjo5ZjqFAUNRBAT/lMJy2t0Zdm9cnkNFYymC2n57mgve2W9L8mRsMTYdQbwT7S7PgV3605e7bphnvGVl09iSkwkbQZ9oiqvZFdVn9id6tPxlf6wnnMo2YU9fuqRJoF6kKGN5Mvqvmm6bIUW5y9cFjpAniJg7lPY2Dc/em/q5jpdYirnkPnjnjpqdNBKnroRbsNL8bUWPyyZM4seSAIaw61OUQLhJHClUx9sAb3nyWRq6k2PAB1HcBeY9dVgv3b+0ZzNsR52IqEzs3VOZGAS174Kd8FFk7oyV15a1qfyhCzKxNJIbW8AHXh+S7EcVnyYyJguJ/hblUOwsc4Un/3UQkmhTTOkZOb3zZklHM62isA4yA6uAUkCxASgaG0UMtvzeJiynYLr1x4YR2jTKU2VD79n8pcKienJmBH0d80FtnPMiJPZA4EiVSXYAZ1PKbVsSBk47Ia7SmgZr46VX4ha5frAY/kQNzFk9qyImuyPyIyw== kammerme ge35tem"
  ];

  shuKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdNJJX/Y6xOkSKwrHubpZNti5Gk9VFycn9hLzP2x9fo/ZbqrSfNNSAmj2OMHjXKpXHkyVuD2V4Yw/N7ulIX070o05ljn3zbZO4z6upg1czjXys//LvGevCm6cItg5i4bk/XVz+1Q+iaQgPQbkQJ0cM9h1kIwq1p9S+mh37yj4JVmSb6w+hVD6kWOTrE9UL88HEPmBClr/syqQ9KJt9/KvnoeBV5GE58swYvCNCenUdSHYzhpE4WUKeJhqO38i1Oux6aXSJbjdQaR+YaHTXPHkHLOpkY6lHleRj2M9ooEwYzAjIoU9zGgjoj1fxOp9IGdlS/BhnFVaPh/z2Hu1KPpOmY+Cby9hIUf13KCUnp3eLGf5HB3IUBRTf6t12A65cPHeVISBOLO+6gcrOWKHnNAOq8RJaNBvNQ+N0AZejXYdojqvSod2+0ATT57bSlUiL3E+u5KN7gG7/dohY4OdxSMqt+Hvi3fsMYt2FKVUFWK4AqvgaXzDj4mjIZ44DAHdS408= gedatsu@fedora"
  ];

  nateKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwt42sLSi5MwnD73x9eZnyiClBf+p9N4SMrbMkkqtGUJ6x87UBOX8oUT++/ZetfbXHffMlDVgeUqEk5YfsqAGA7lbU1k3oqtW9ey+Ucyu0ai+J9hgbYQUBY8bVrcgjwUC5PFDFfrjk2yt5WBxVmTmi/AZB7rZRK8liECH8gCfewAbpHV0IsQo+JV+K4VZzOL0gqXeEhxXs8qMujYD5ptp5cLfSyEpEaGXcakb/XHCgtJIMXnq8gXqQ0uKSFEN3aGlqYdCwT28yxAiICSLQJ6D4yrY5zwJ+m87xIarDAHZMn2CS+zp26SMezYQcSOL0FuJb5tYD4DouAJ/MaY7r9f+IAH60r58GKe0PtmNGnOOEorYIhzp3sCPSDtoFY4tl7TC6Qat/wWzDTpR9eDH5lBP1x6sZtzl1q1tJ79QgfcIFHdSdgp+28k6clwCqNb3Hcv4Tls2dPLB2cI7j7ehbtZJDIIeqqx+FxcacUj83av5O8p6RKK5fHyKQNCGYqcNZD08= nathanieltornow@Nathaniels-MBP"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCR0yt3zKrlR8XC+xwYT+jX1TLyLqK7vYjbXBZ1mM5f/fnsX+xWA1q5Caw0b+Q6aNmUEC7KQ0yUBV/q/9/7MPeQyVs0cWIO8RZCw0nKytcRh3tvmR1ysYZRYWCHuvB8yGAWpxmUYFUJv2BJnKB8jLor+XA/ceSYG0sJVu3tbXMZm0Mj4XIoSc/+EE9LU9yenruD8G8xQb12lvZ83bOhkXY5Hr0posRT4vb/15b1yXvrprPjSOMv53+TlYv2w4HYs0HOY737jMiNfhQIRMIXz+weDAQr76bUgTz8sKOUjbJX4OtRFVhsQjWk+8q5quYI9Kp0bUSPAz+LeXF/ZunImyA1w47DKW7Rq5sc8BZGCd1CP9W5VLoZWD9bcgIR8O26jsP3yRCBGo1m/cWbrAc7V/pJKDQamNzhCZYrB/4JJBbm3AWDIiZVpsoJ+03CF2K1ly/oxG1vkq9BDopK3tUH4akPfGefPnxf4zZcaMR3IzXmlPOx9JAC9OqGQbkaOSHh5cc= nathanieltornow@Monitor.dos.cit.tum.de"
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

  laurentKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDhulu81xcBVedbyA+9UfjU1B3foZfjEedKSWZMn533paXbhANxutevnDfAOI9tikXB2rM99J2SIedq5dIIC80L0obzqz95tNWn4LQodVS7gxblndJMylD9SSCAqaXhmKJ4VvQhhyG5Ko3d82HU9NuhRJ+gxZFqU4zUrLinHbHjzjndm+C0tbTdSMGRzdDY+DcOCYkWaceGhZg/Wj6nDHbtG6mPa87HVwvxXisQlnz8Q6YAfaOci7depmojXdiBKAmzbQEr8qbTRRS0PV12FP2PkkChyUprCR9IH9lyWg4Fp39b6jzLiWnjXmCzGdMWkfZlbP37UhrApI6l06FFquUr7mgBdGUXlPQw7ESgPlCe5ppprlkSOu/t5jZf7tuqQsXMqLVJtwSfgTWIUNi8++b6+IuwwfWY5NhujnmgM0al64wZEj5xfZLr2dbKzw93oHcpVH6MmWivLmuEs1XHyHiozTSycGb395G4DDqyUci/UESly8xjIg+E39e3HLmJV/Ff53ItCTqHg7GK3WJxuQJrrl7MvZxRB3bgfXm3s91iYjx9/awQ3Phj71Zbv2+MFSeZHDEiwVIfR9JA+zx6m+23WDF/XkOZMczvRPswWXpKCAi7NBG0Cb4bVWtiDwvZ6LjdipVCFzc5q3ESpGy+vJK38ZSNihPJAxywiGvOJj7wew=="
  ];

  hendrikKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEg3T8Tc1pNDRqPPE0cLffb9mYpU2FGoY1EghnU3+WMF hendrik.huebner18@gmail.com"
  ];

  simondKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAXKJqoVipqnB7/rjCjx6EYYsi6ZRuG2ve4bZHvAVKMa simon@Laptop-Simon"
  ];

  anubhavKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpbDrBEK7kwqqutJ9Y1naVLO1txdy+uKar5FGxxGWvKb02RrJefAizJ+7FSqmTIrLEWQPs9yhfVWUk8jlH8PxxroPD2m89BztAaCr9c3RUWAU/PWsJKB3gxDownYC3uZt/4j8DIwnBMKMq8fJt9GQ3O36XxZ2OSJp7kJ1vbKhYYXyMoGfZnDJMo+zfFJkJNfoLb1HR1IIHAmM7dvF5s997VuDMprJ3PqnIVp+zQc/QpPlBHSpRYI9WxOtSo+kdF0yA1GbtbnY76A/IeapDWVfhUR2cEKyCIia0Y4Rgv57W7Hnu5kKTWm3jpUyMTkcAji/rrvrNjvmSybFv9xqlXL0cCwSStQ1TgE59M8WYIxTNtThGhVfD5EfnnPixU6AQmJT7oLp7F8k2Jy7JBTMM9qM06Xy4vhkDE2OyyUSZ596GoWotqa7pcRXGLzm7Z2zSmIUGVW84VA2t/A+ZynghXYJtG7MwQWSSf0RHV8lUDsRQAmImTsToONVXZtqq6pzOY6c= anubhav@anubhav-ROG"
  ];

  michaelKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGoXqeCmxusQtuRVsFoZsa0SPTYRdPlcnmA9XY7WrHmt"
  ];

  dominikKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAvQc9+uHtD42kQ/pADllV8HiW1Yuc+lQ5bgUwmvPWmb dk@arch.olymp"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC5+gf9T6PyECwIVDSHvb8bCYW37J9b20P0EXd2dwifE dk@skytop"
  ];

  raphaelKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDWBYEFdkHQV/5+5KtjNZnp895pzEXXabRDPgHq6zZwr23ksF0/+n1huHpI2fFlbCWcChANKOBtoAEFfUbQce/PKYhJaqFZpVIADJk4BsB7fI80UPkN4EHkTtE5k79kG4hAvA1v6TySPdyIKMat5J8YFuVJeOWxdEDIkySVQ4/tCIKjG8XZYnbgzU9uOaiZBe1QzW3pchT5bxZXGS/T1umYypVHtspCa7CE4ZV+6BgBuJRTyVWwZXlacCSJFNmumNP1G2wppTA44D4N9/q3dukyfQswkm9qejDmIaqhDHkkLN76zBdyATfbr/YSSTk1EFH1WE/iq5Sx+KkUuv7c5lPWN2UzW4Zca1J2fB25DYQgKCZ6MHxqorHKSZWDq21W4v3TZG0KJDnqB3RDrUJC5Fz6SX2d4bZFST8KP6dU2ageftZBqzSU9O4B49u4NNGCo5qbTrC6X9J91PV3pDS4oUaBQHfnISP/MKiQj1WtNdYZvg9Z+ppjxyJQufKztCAVYzc= private@t-rdichler"
  ];

  berkayKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCVvRRiomFTL2f76ujvyF9yydT7aMjFWOLDcFhn/aGelicljhULa0JwQM5P1wCpILLCY9zjQyQn84w4MaEasJ4KMaVuDyGS9xpIOa9B6xqIryCuE17EWlodYZqsOCaINCfQ048uoJRnu+LqzG2SJN+tMgUtMI0k+T7+BWusqQ5A0i+H/S3H3KITT9Qfn34hYDpHgLZD+sw4ZAXAzWjuZj+CYPEh50d68YWqNzRR9ShKK9rL1R6dyUIM2FGZzLHo4N7pRzHOa38ELY+Qni7Z3uf9mK/0vkkD/mMlAJDbJSQfuSpZAnninvt7F5bzoRRb6a1Gd7yb6y8fTaMt1lBgsqtJWuILOOOisxZE4VmWqoiT/jDlSpSHSfQz/r001JT7ci1HD+xYvh2ect0TJEo9WH7X/vX/4Q8wHO0Zf3l4yCCF7qD0VoqTd3X0LncbahaVP7JAhA9PfuNSWj754lxJ6RBeSavcRxQWpkbX+8kDcF/I4AIEocHTkX48Uo6U7SRRr38= powermoon@powermoonPC"
  ];

  konstantinKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqB4RM0SUGkY1I+jLbWMxG10RPhhsNbsrPdMx32n7Iwt89rlkx3XGNra4eoBiZAdXLcggEgE4xgMtOIj9Wc7sexwbabEX5GXl1S7mc4Trm8wJRziBWdH6pwqICjG5HwNfXRyhiS290r8H/MB3LFIWgyE/U7VqaQ/nnHBimroYaJN1rDbkl25Ihe7mpS2s8P4M5HaqNIVY6HhgNKHJwQe9pgnjwnq4OkRGrRUOxi7q5R5TGsoCa2s2jefMrGOEXH0z6ZUzVo7auddNkQO4IYEHoiQxY4SlVwwCE0SYF/56kyupDRuEkg158HYcS0Yc2bTjYKe7sFTRwmssnQee+bxcHAOrqv3qunXx6USfGwzibNYlJoAFTDEoz5DJVMTlwlq9H0Qpvs7SIOiH5WhQ86T2TQhr3b5mIitge/uN2PVSnjhtxWqbUEipShgKmxpRinSR0D9VRf/X0cqTToz/ZfM9vcXEDyTtXHzbMU8STDlkIKQuexaqslqspAVsVBjCdQNk= konstantin@konstantin-IdeaPad-5-14ALC05"
  ];

  janhaKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKixlCYR4hAf1K0/7zi5hhG+kFBRCStaJL+98WvEGnY7" ];

  janheKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK3jH+h2/BYRf3ZH7FGGAScFcNAnexFETsEGaOedB4wL"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJxK7mB8Ar952m0BWIMJK5hZaGu0EjwI/ybYOwo+Mw3z"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMwSyi5MjQnoHbnMo8+RFCFr1fwK/Zp7sByNEaGcP4xl"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJxK7mB8Ar952m0BWIMJK5hZaGu0EjwI/ybYOwo+Mw3z"
  ];

  sherifKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxcwd2ISpOP9Wj7tILTEM9RGDtwDnM1Ew0SffsT7jupZEJwlKYfJ8WFYPBaPmQD9ASHRR1aS2N+sOF+PyxGyBl0Yo9YyzQuy7O9K7rtGghNlk6TyMecNBVPC4Tq7QhPa7svtkc0bC/eyM1hAFsu/pnOMV3vwglO4hc/ct/CtOPVWR4P+koqQySR/f0BGew3RHyRTHUKhhMSJK3JDeeu3wEYok517vspmopvzkE+/gBVnS1XLXWLR2hPxI8a56WgTrE+NWaKV5HVoUxCv7mCbeLIDaqQu1Y2FL4h/gydmz6SXGLd99PphnFPbIzTLDcTb7RX+DVIOrpnQda/kwnFkq2C0Q0+jJ3nvayiw0EL5yOeeROrPraSwx1YjC2KtbbhpcMBdsAQKe4OpBL4dpUrT+CqAEn4FTy6gCF1PD0AA1lX0/l0dyr7oxb/qgTUAFTmYQDae7Ml6xnweGfKIcYt6NtkKpBN3UoonEEhZLfKyFKrMrn5Ta2la6p5ksZC/Ae4A95XrfRSMWlEiIhOnBGp8zNcbi72LLL8U7JwKlQfhBpJL1Vvtkie6ytUFPzx4frH1wy1J/u+rZel+YIqmo/dVztHWXXv3b0MIrkmmw4bTE/l/C9L8FdZUgef66WU7CQiMI0cXsKhpqlGQWj5dJEiwkQni4CZQypg71jotlkDFCexQ=="
  ];

  kchristianKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH1sPdGosNVV8liuEZ3YOuAmOKUxAYxW8IucSkc8XCh2 christian.karidas@tum.de"
  ];

  hristinaKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDKwhovd3dJO9+vDK+I/V8hRXkqgGW1LJIApSXFim+vr"
  ];

  benediktKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHh3jvEHzkSEtQ/CGHV38U8xRozY8Gbt03jee63dsz99 beni@eos"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDC+37cRJr2lcVYmxRPvBQHdBio24I7oxQZ2B3uCU3Pj beni@laptop"
  ];

  robertBKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEPdjagHzp7LJXfOT0PlQzFE1sGbd9jLMfaqCA4yZRZw atlas@evilatmc"
  ];

  neelKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICC1FrIyzGjtW1mBRyvCjV4uZBw75y3YptKIs8N3p7VR neel@neel-950QDB"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP8gUqth1ZdR89+i5fyvz7qqIytNopXgI8QWhTzYdAro neelm@Neels-PC"
  ];

  konradHKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDWpsrdbVRnFejvfa/IN668rSKXpRWqNBRgJ93UOOywt konradh03@gmail.com"
  ];

  kilianKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMTF9QkKayS1Wsj3MRLhpo4Kgh5traaOalOAmdWjCvps" ];

  martinLiKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGLDbWHI/PLBf0hiS0wbHz0ppO/h177fSuRsoZRAq/VD mrtn@mrtnnix-nb"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICJYSM6kY7dtMlq7wzKCYe2jcOFQfA+EB0xPX/l8LdvH mrtn@nixos"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM1er1RkBKTjm2tPF7HOP2u05VdVLtJHJRxlLSzq0wEd mrtn@nixos"
  ];

  timoKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC97GhiX/jbrPLlXdkgEGfl2TKDHaBwF7cYA0TW/VHdrXY2OvZPvh4Dolksxoafrtkc0LGtxZB3N2m56audkWUBpDDxksOjj1aiZdBLxvCme2mE+NoA3AaSBEPAqNurs0WRVdXxer5dCXF4m4E0jSlXA7w6ubnMClyGtBMJqEf0BlqM1q5nv2LaMFVWl0/oPDXmKmGTA+u2dzrIoUX8NqwSYdyrHoH1zpI9Mq74+NHLYpzXRsKsqGf09SdJNnoNxc/JPtjsEA4jn4dOiwQkaM2URHYrJAfRv+4BmPRD03eMbwVC55Um86rfmBxjUx7kW2TB5ytXUnc00kRSPLuf5IdnFcn+Ho+RgmNV/LDkjNEFEEf96wNAUuiD3EZxar82+3MuxILSnKGvElcGMiuhXp9y1Yw9e6Wx96DGNcXNmhg4IkPnd6CF0u8BfxA1MplyY+r0NP92Tiuc6B00raOmZXPsxdb3U+8o4AjiGL9suZM9nVeOK4XjunIHyBm6NsP+Mpc="
  ];

antonKeys = [
"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ8AlSd4iLm1XLO9p+xa5xLKHYfORl32wD2rOjSYei9d anton.ge@tum.de"
];

  extraGroups = [
    "wheel"
    "docker"
    "plugdev"
    "vboxusers"
    "adbusers"
    "input"
    "student"
  ];
in
{
  # for new students please use a uid in the range between 2000-3000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
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

    # Sandro Gierens, Masa's MSc student (expecting to finish the end of 2025)
    gierens = {
      isNormalUser = true;
      home = "/home/gierens";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2003;
      allowedHosts = [ "all" ];
      openssh.authorizedKeys.keys = gierensKeys;
    };

    # Theofilos Augoustis, Redha's MSc student (Arancini project)
    theo = {
      isNormalUser = true;
      home = "/home/theo";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2016;
      allowedHosts = [
        "graham"
        "ruby"
        "yasmin"
      ];
      openssh.authorizedKeys.keys = theoKeys;
    };

    # Simon Kammermeier, Redha's BSc student (Arancini project)
    simonk = {
      isNormalUser = true;
      home = "/home/simonk";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2017;
      allowedHosts = [
        "graham"
        "ruby"
        "yasmin"
        "tegan"
      ];
      openssh.authorizedKeys.keys = simonkKeys;
    };

    # Shu Anzai, former intern (Atsushi)
    shu = {
      isNormalUser = true;
      home = "/home/shu";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2019;
      allowedHosts = [
        "rose"
        "clara"
        "amy"
      ];
      openssh.authorizedKeys.keys = shuKeys;
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

    # Martin Lambeck, Ma Thesis with Jiyang (FAIR)
    # Remove after SS24
    martinL = {
      isNormalUser = true;
      home = "/home/martinL";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2031;
      allowedHosts = [
        "amy"
        "clara"
      ];
      openssh.authorizedKeys.keys = martinLKeys;
    };
    # Thang Tran, MSc Thesis with Manos *Finished*
    # You can remove now
    thang = {
      isNormalUser = true;
      home = "/home/thang";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2038;
      allowedHosts = [
        "graham"
        "ryan"
        "rose"
      ];
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
      allowedHosts = [
        "amy"
        "clara"
      ];
      openssh.authorizedKeys.keys = brunoKeys;
    };

    # Alexander Schindler, Thesis work with Patrick (VMPL)
    alexander = {
      isNormalUser = true;
      home = "/home/alexander";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2039;
      allowedHosts = [
        "jackson"
        "ryan"
	"graham"
      ];
      openssh.authorizedKeys.keys = alexanderKeys;
    };

    # Laurent Bindschaedler, external contributor in FPGA serverless project (Charalampos Mainas)
    laurent = {
      isNormalUser = true;
      home = "/home/laurent";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2042;
      allowedHosts = [
        "hinoki"
        "sakura"
        "momiji"
        "graham"
      ];
      openssh.authorizedKeys.keys = laurentKeys;
    };

    # Hendrik Huebner, HiWi for SS 24 with Peter (vmux)
    hendrik = {
      isNormalUser = true;
      home = "/home/hendrik";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2044;
      allowedHosts = [
        "christina"
        "rose"
        "wilfred"
        "graham"
        "jackson"
        "river"
      ]; # TODO figure out what he needs access to
      openssh.authorizedKeys.keys = hendrikKeys;
    };

    # Simon Dittrich, M.Sc. thesis with Anatole (CXL Gem5 sim project)
    simond = {
      isNormalUser = true;
      home = "/home/simond";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2047;
      allowedHosts = [
        "xavier"
        "jack"
        "graham"
        "ryan"
      ]; # TODO remove extra hosts once xavier is racked
      openssh.authorizedKeys.keys = simondKeys;
    };

    # Anubhav Panda, M.Sc. Project work with Jiyang (microShell)
    # Remove after SS25
    anubhav = {
      isNormalUser = true;
      home = "/home/anubhav";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2049;
      allowedHosts = [
        "amy"
        "clara"
      ];
      openssh.authorizedKeys.keys = anubhavKeys;
      xrdpAccess = true;
    };

    # Michael Hackl, M.Sc thesis (Wallet project)
    michael = {
      isNormalUser = true;
      home = "/home/michael";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2051;
      allowedHosts = [
        "ryan"
        "vislor"
	"graham"
      ];
      openssh.authorizedKeys.keys = michaelKeys;
    };

    # Dominik Kreuzer, M.Sc. thesis with Peter (VirtIO-DPDK project)
    dominik = {
      isNormalUser = true;
      home = "/home/dominik";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/fish";
      uid = 2052;
      allowedHosts = [
        "graham"
        "ryan"
        "jackson"
        "christina"
        "amy"
        "wilfred"
      ];
      openssh.authorizedKeys.keys = dominikKeys;
    };

    # Raphael Dichler, B.Sc. thesis with Martin/Ilya (CHERIDB/MTE)
    raphael = {
      isNormalUser = true;
      home = "/home/raphael";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2053;
      allowedHosts = [
        "graham"
        "yasmin"
      ];
      openssh.authorizedKeys.keys = raphaelKeys;
    };

    # Berkay Eren Ueruen, M.Sc. thesis with Teofil (LLM-OS)
    berkay = {
      isNormalUser = true;
      home = "/home/berkay";
	  extraGroups = extraGroups ++ [
        "kvm"
      ];
      shell = "/run/current-system/sw/bin/bash";
      uid = 2054;
      allowedHosts = [
	  	"jack"
		"yasmin"
	  ];
      openssh.authorizedKeys.keys = berkayKeys;
    };

    # Konstantin Garbers, B.Sc. thesis with Martin (Arm -> AIR lifter)
    konstantin = {
      isNormalUser = true;
      home = "/home/konstantin";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2055;
      allowedHosts = [ "graham" ];
      openssh.authorizedKeys.keys = konstantinKeys;
    };

    # Jan Heckel, Sys Lab WS24
    janhe = {
      isNormalUser = true;
      home = "/home/janhe";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2056;
      allowedHosts = [
        "vislor"
        "jackson"
        "ian"
      ];
      openssh.authorizedKeys.keys = janheKeys;
    };

    # Jan Hampe, Sys Lab WS24
    janha = {
      isNormalUser = true;
      home = "/home/janha";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2057;
      allowedHosts = [
        "vislor"
        "jackson"
        "ian"
      ];
      openssh.authorizedKeys.keys = janhaKeys;
    };

    # Sherif Hussien, M.Sc. thesis with Dimitris (GDPRuler) (till ~07.2025)
    sherif = {
      isNormalUser = true;
      home = "/home/sherif";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2058;
      allowedHosts = [
        "jack"
      ];
      openssh.authorizedKeys.keys = sherifKeys;
    };

    # Hristina Ivanova, Sys Lab WS24
    hristina = {
      isNormalUser = true;
      home = "/home/hristina";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2059;
      allowedHosts = [
        "vislor"
        "jackson"
        "ian"
      ];
      openssh.authorizedKeys.keys = hristinaKeys;
    };

    # Benedikt Rehbein, Sys Lab WS24
    benedikt = {
      isNormalUser = true;
      home = "/home/benedikt";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2060;
      allowedHosts = [
        "amy"
        "clara"
      ];
      openssh.authorizedKeys.keys = benediktKeys;
      xrdpAccess = true;
    };

    # Robert Barinov, Sys Lab WS24
    robertB = {
      isNormalUser = true;
      home = "/home/robertB";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2061;
      allowedHosts = [
        "amy"
        "clara"
      ];
      openssh.authorizedKeys.keys = robertBKeys;
      xrdpAccess = true;
    };

    # Neel Mandal, Sys Lab WS24
    neel = {
      isNormalUser = true;
      home = "/home/neel";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2062;
      allowedHosts = [
        "amy"
        "clara"
      ];
      openssh.authorizedKeys.keys = neelKeys;
      xrdpAccess = true;
    };

    # Konrad Hennig, Sys Lab WS24
    konradH = {
      isNormalUser = true;
      home = "/home/konradH";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2063;
      allowedHosts = [
        "amy"
        "clara"
      ];
      openssh.authorizedKeys.keys = konradHKeys;
      xrdpAccess = true;
    };

    # Kilian Matheis, Sys Lab WS24
    kilian = {
      isNormalUser = true;
      home = "/home/kilian";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2064;
      allowedHosts = [
        "vislor"
        "jackson"
        "ian"
      ];
      openssh.authorizedKeys.keys = kilianKeys;
    };

    # Martin Lindbuechl, BSc thesis with Ilya Meignan--Masson deleted after SS25
    martinLi = {
      isNormalUser = true;
      home = "/home/martinLi";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2065;
      allowedHosts = [
        "irene"
        "adelaide"
      ];
      openssh.authorizedKeys.keys = martinLiKeys;
    };

    # Yude (Timo) Jiang, BSc thesis with Martin (CHERI/Morello architectural analysis ~Apr 2025)
    timo = {
      isNormalUser = true;
      home = "/home/timo";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2066;
      allowedHosts = [ "ace" ];
      openssh.authorizedKeys.keys = timoKeys;
    };

  # Anton Ge, BSc thesis on uintr deleted after SS25
    anton = {
      isNormalUser = true;
      home = "/home/anton";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2067;
      allowedHosts = [
        "xavier"
      ];
      openssh.authorizedKeys.keys = antonKeys;
    };

    # Christian Karidas, M.Sc. thesis with Dimitris (GDPRuler) (till ~07.2025)
    kchristian = {
      isNormalUser = true;
      home = "/home/kchristian";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2068;
      allowedHosts = [
        "jack"
      ];
      openssh.authorizedKeys.keys = kchristianKeys;
    };
  };

  # DANGER ZONE!
  # Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  users.deletedUsers = [
    "alexa"
    "alexandermaslew"
    "alp"
    "anand"
    "christian"
    "dmitrylugovoy"
    "eaypek"
    "eliza"
    "emil"
    "florian"
    "fritz"
    "hanwenliu"
    "he"
    "iulia"
    "jasper"
    "jonas"
    "justusvonderbeek"
    "kai"
    "kamilk"
    "konrad"
    "luca"
    "m00wl"
    "mflatus"
    "mikilio"
    "milen"
    "ml"
    "moritz"
    "mwerndle"
    "nicola"
    "paul"
    "paulZ"
    "philip"
    "raito"
    "robert"
    "roberto"
    "rohanfernandez"
    "sarac"
    "turkmen"
    "vanda"
    "vincent"
    "wonbangseo"
    "yihe"
    "yiwenliu"
    "zixuanli"
    "lan"
  ];
}
