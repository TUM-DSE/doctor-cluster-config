{ ... }:
let
  julianKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZs04queaSB/BGQesCEiunOkeEydB5rJ2WUXSrGlDLVoJ6/Q7fAHM99200fxK7h0vtKda4OkdUEBtRtq2wn+Z0YW51mFvzJ7214ZIY4JKtYX02KW8r7gVXYmjoX3VWEKi5iKfld0WO9jaDN3InU5CYyYx1nHl+BNasxIHtUzjhHCC+Ggxt3Kc+IxW2DV8J9/JwhKhgedqvqbc93+V05/UeYwG0Q9z1mwBEuOlGv8yP6uhCWmHzxbJYo+oxU5nSXM0lPHecxa7M8hROXEVrSxg27vUg7JoiSQ1wt3lzNQS4Abd8JLqOJlQYQvbz5Xxd0KhD0kaBCptXBCxdOo+YLi06XNs16rRtQPM51jTrero3h1wfA51XR7w7j52nbLC2ZGMyaSO1c5IQ5d5Xad/F1ZcOQQWvFhK+ie9LJzvR0AXiFXzEBvmPiZ82rLdjWGPO4975fSYTOxshZojk7oV4fQyd5vKCsjChL0JC2chPfYRv2kti/9CVqVseznVMPE/JgdE= julian@mind"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCkHALCUCursw1AvmYaQLfYBee1lGR4sqqlTEHfatyAqQrCxFnWNnO03ScEfNsDQKDZPRQ/RZYOOHlNxoKQzYaHlpbFafePKNH+lKZWibabp4HT3ho0mi56i2sqXLSMP+y3nz4S7vx678CVgyK1/gW9wB0ORNh1Ss1NqPhi/DFxHVxcLig3mjCVoC6QzIzTLq8uVP/bOD2jtED/PSdAFQQNd2RjKWea7UjjH7IiQvvJHwl1OB8X1x7mxwuQuHCMj7kwwKfEEvqOy3NiDzY9Ewc7HihFLkROMK3obbYLoQjYf/tP9SYpekWx4Q8CpgmvAblwDcv8unmnYAN2Cj5PQ4YulBPCOwNfmVCvsp3gX8eLG6XNYjnHt7DIEm8Yj4EeSCuB6DLOR2Em5eKH57qzQFHyubdIwVoY1xzfdd1wzaKuL+ahoLKmZ23Q6bK795BwZBogyoceREg9surF9P8l9mJi2Yn8aGMtCF9ecIySNGYwI1AqKGYX14Vo9HA3nfADCI1wCND5LyqD6UDGfM1iBV38gGl05jyywcTgpctI4ryQy6SUDf9x+CZuDwHXihR6Rj9Oj1Vy6zFdCKq4xt76xCsIPuy+6CY4RdOkCNmQn3NKeRnttLmyYIpLbHkTdYs8GIyLsf1mz6uHZNcWg5fwPTabgT8PJ5yJRQo9IoXGawf+vQ== julian.pritzi@gmail.com"
  ];

  gierensKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBevyJ5i0237DNoS29F9aii2AJwrSxXNz3hP61hWXfRl sandro@reaper.gierens.de"
  ];

  simonkKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDrdEe2/aOcUzaPtkDLJQ8VrcfiF8tNpk02SPLIVrsTywSHrBueOMz/cVR/Dkk7HREkI8iPshIefYogGgXNrwXp4ogu7DFA/5FS58QgrUS/il/LYT1pIcC4URFt0s5UHxvXbVP/zPVVpDZ7AqXLzz0H95csR9mO5eY2CgZh5+haC1dNhBEZK7v2pcsp+TrDzcxKjo5ZjqFAUNRBAT/lMJy2t0Zdm9cnkNFYymC2n57mgve2W9L8mRsMTYdQbwT7S7PgV3605e7bphnvGVl09iSkwkbQZ9oiqvZFdVn9id6tPxlf6wnnMo2YU9fuqRJoF6kKGN5Mvqvmm6bIUW5y9cFjpAniJg7lPY2Dc/em/q5jpdYirnkPnjnjpqdNBKnroRbsNL8bUWPyyZM4seSAIaw61OUQLhJHClUx9sAb3nyWRq6k2PAB1HcBeY9dVgv3b+0ZzNsR52IqEzs3VOZGAS174Kd8FFk7oyV15a1qfyhCzKxNJIbW8AHXh+S7EcVnyYyJguJ/hblUOwsc4Un/3UQkmhTTOkZOb3zZklHM62isA4yA6uAUkCxASgaG0UMtvzeJiynYLr1x4YR2jTKU2VD79n8pcKienJmBH0d80FtnPMiJPZA4EiVSXYAZ1PKbVsSBk47Ia7SmgZr46VX4ha5frAY/kQNzFk9qyImuyPyIyw== kammerme ge35tem"
  ];

  shuKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdNJJX/Y6xOkSKwrHubpZNti5Gk9VFycn9hLzP2x9fo/ZbqrSfNNSAmj2OMHjXKpXHkyVuD2V4Yw/N7ulIX070o05ljn3zbZO4z6upg1czjXys//LvGevCm6cItg5i4bk/XVz+1Q+iaQgPQbkQJ0cM9h1kIwq1p9S+mh37yj4JVmSb6w+hVD6kWOTrE9UL88HEPmBClr/syqQ9KJt9/KvnoeBV5GE58swYvCNCenUdSHYzhpE4WUKeJhqO38i1Oux6aXSJbjdQaR+YaHTXPHkHLOpkY6lHleRj2M9ooEwYzAjIoU9zGgjoj1fxOp9IGdlS/BhnFVaPh/z2Hu1KPpOmY+Cby9hIUf13KCUnp3eLGf5HB3IUBRTf6t12A65cPHeVISBOLO+6gcrOWKHnNAOq8RJaNBvNQ+N0AZejXYdojqvSod2+0ATT57bSlUiL3E+u5KN7gG7/dohY4OdxSMqt+Hvi3fsMYt2FKVUFWK4AqvgaXzDj4mjIZ44DAHdS408= gedatsu@fedora"
  ];

  laurentKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDhulu81xcBVedbyA+9UfjU1B3foZfjEedKSWZMn533paXbhANxutevnDfAOI9tikXB2rM99J2SIedq5dIIC80L0obzqz95tNWn4LQodVS7gxblndJMylD9SSCAqaXhmKJ4VvQhhyG5Ko3d82HU9NuhRJ+gxZFqU4zUrLinHbHjzjndm+C0tbTdSMGRzdDY+DcOCYkWaceGhZg/Wj6nDHbtG6mPa87HVwvxXisQlnz8Q6YAfaOci7depmojXdiBKAmzbQEr8qbTRRS0PV12FP2PkkChyUprCR9IH9lyWg4Fp39b6jzLiWnjXmCzGdMWkfZlbP37UhrApI6l06FFquUr7mgBdGUXlPQw7ESgPlCe5ppprlkSOu/t5jZf7tuqQsXMqLVJtwSfgTWIUNi8++b6+IuwwfWY5NhujnmgM0al64wZEj5xfZLr2dbKzw93oHcpVH6MmWivLmuEs1XHyHiozTSycGb395G4DDqyUci/UESly8xjIg+E39e3HLmJV/Ff53ItCTqHg7GK3WJxuQJrrl7MvZxRB3bgfXm3s91iYjx9/awQ3Phj71Zbv2+MFSeZHDEiwVIfR9JA+zx6m+23WDF/XkOZMczvRPswWXpKCAi7NBG0Cb4bVWtiDwvZ6LjdipVCFzc5q3ESpGy+vJK38ZSNihPJAxywiGvOJj7wew=="
  ];

  anubhavKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpbDrBEK7kwqqutJ9Y1naVLO1txdy+uKar5FGxxGWvKb02RrJefAizJ+7FSqmTIrLEWQPs9yhfVWUk8jlH8PxxroPD2m89BztAaCr9c3RUWAU/PWsJKB3gxDownYC3uZt/4j8DIwnBMKMq8fJt9GQ3O36XxZ2OSJp7kJ1vbKhYYXyMoGfZnDJMo+zfFJkJNfoLb1HR1IIHAmM7dvF5s997VuDMprJ3PqnIVp+zQc/QpPlBHSpRYI9WxOtSo+kdF0yA1GbtbnY76A/IeapDWVfhUR2cEKyCIia0Y4Rgv57W7Hnu5kKTWm3jpUyMTkcAji/rrvrNjvmSybFv9xqlXL0cCwSStQ1TgE59M8WYIxTNtThGhVfD5EfnnPixU6AQmJT7oLp7F8k2Jy7JBTMM9qM06Xy4vhkDE2OyyUSZ596GoWotqa7pcRXGLzm7Z2zSmIUGVW84VA2t/A+ZynghXYJtG7MwQWSSf0RHV8lUDsRQAmImTsToONVXZtqq6pzOY6c= anubhav@anubhav-ROG"
  ];

  dominikKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAvQc9+uHtD42kQ/pADllV8HiW1Yuc+lQ5bgUwmvPWmb dk@arch.olymp"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC5+gf9T6PyECwIVDSHvb8bCYW37J9b20P0EXd2dwifE dk@skytop"
  ];

  sherifKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxcwd2ISpOP9Wj7tILTEM9RGDtwDnM1Ew0SffsT7jupZEJwlKYfJ8WFYPBaPmQD9ASHRR1aS2N+sOF+PyxGyBl0Yo9YyzQuy7O9K7rtGghNlk6TyMecNBVPC4Tq7QhPa7svtkc0bC/eyM1hAFsu/pnOMV3vwglO4hc/ct/CtOPVWR4P+koqQySR/f0BGew3RHyRTHUKhhMSJK3JDeeu3wEYok517vspmopvzkE+/gBVnS1XLXWLR2hPxI8a56WgTrE+NWaKV5HVoUxCv7mCbeLIDaqQu1Y2FL4h/gydmz6SXGLd99PphnFPbIzTLDcTb7RX+DVIOrpnQda/kwnFkq2C0Q0+jJ3nvayiw0EL5yOeeROrPraSwx1YjC2KtbbhpcMBdsAQKe4OpBL4dpUrT+CqAEn4FTy6gCF1PD0AA1lX0/l0dyr7oxb/qgTUAFTmYQDae7Ml6xnweGfKIcYt6NtkKpBN3UoonEEhZLfKyFKrMrn5Ta2la6p5ksZC/Ae4A95XrfRSMWlEiIhOnBGp8zNcbi72LLL8U7JwKlQfhBpJL1Vvtkie6ytUFPzx4frH1wy1J/u+rZel+YIqmo/dVztHWXXv3b0MIrkmmw4bTE/l/C9L8FdZUgef66WU7CQiMI0cXsKhpqlGQWj5dJEiwkQni4CZQypg71jotlkDFCexQ=="
  ];

  kchristianKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH1sPdGosNVV8liuEZ3YOuAmOKUxAYxW8IucSkc8XCh2 christian.karidas@tum.de"
  ];

  phillipKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFrSp1SOJlgYtZCAplzFgO5l2aP0I23ciZX38hABj9CO p.assmann@nexus.gd"
  ];

  antonKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ8AlSd4iLm1XLO9p+xa5xLKHYfORl32wD2rOjSYei9d anton.ge@tum.de"
  ];

  steveKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFDiE8OWLvbkG6oW/iaRCEG6p5ag2fp0gYKdFp1c+B/9 stevebambou@steve-7510"
  ];

  maxKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHq8XrpIYVtb/1EHje+Kfys/wM+F/R5xmd54mMRvJwlP maxi@DESKTOP-DBGIHGB"
  ];

  osmanKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxVhUYcWx1CpHG78ae74qhOCB2YdBRDc3swxCp3R2tfzuE69ioRpDCej5L7rjL5lnT/aq1ra1GA73E2FcfWqMu3mjpCPSQPWgrYT+5U5GN301yME4Tkfc1IfsSC/6EgCUN6eRNLgSGnnRr2fGbuF1DetqGl4JX2bR5nh+7ub8ys/EfE0Y7NDWtYfJUjQtHn01KOUYLahQPU4D95QRj/o9UXifMAp/9GNEgPGAtMJTkQlVEHwJ95TT6C/qpgViYOzeZbSCJAokJYflHayC3RGCQmBTyhyv4+7LtkSEJQStDTa5HhLzubri9vCtmnS4wgmCql2MbmIVGnIgX8uS5x+cW+N1bXQECJVqT8S9J41dXEl5Z/pBFUhrdclpJkTbdTG2VZjnqHgarBWKnaATQXv0HOViHt4OX3KWR3YSZqSrN8mL5fwpSamlapxKk0c7AmJESeHGZWswBsTygx2o0Txq59HH5UKcBkikIX1pQtrTccdJ3ki4vD/sFmIWRVfsw+xd95zzO+zO/Np+BoaDSH26q7k5U39tyvgEhJPrAPVOLwH5jSKq9ZdluGx/q+cyGw8nuNgx1f13LyHr45X7HhqNdIxmGOqjUQvg5M2TFhehu15bWNpZNYfxR8gW2STxftuDlkEiYqxpBmNeP+RYdG+jCqECMlKvl8V9xLm8rXYzadQ== osmanyasar@w202-4u-v4.eduroam.dynamic.rbg.tum.de"
  ];

  hristinagKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJfp4yvOGKPTqcdr9YZOJLZulCptWHK/4mV0IuIQ/Tvl hrisigr@gmail.com"
  ];

  andersKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILvxKVGEeM9rh1CJYothgKcOvNrAxKHYOD9K2tX8wcsr"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIfzGHxcRgfwt3SZ0iTY+stOgi2yAORrBpnwJ1tCMn7h"
  ];

  christianKKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFfke0RoVMEtj0XjxdjatQgz0RQxs7gaGSgM2OoGBemO chris@deskpin"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL7ghrJVl24UkfnyNOz21jbmrnPImp3+UR4/p2xymbnl chris@deskpin"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDwlqdl/70dJ1ABKwLEdLB6/RDpfE4RVaB+xL3YJ1v3+ chris@kingpin"
  ];

  victorTKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB1bpcpaHwXyU9H2Vsp0cb66J4r3tBwDDy9n+XI++qfe victor.trost@tum.de"
  ];

  nimaKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0qFCWWIX8CYGDC+95O4/VFvA/vXSg03kJ1YpzzkzTnNDhLEEYhEcY0sbXl8JmHjeOxD/uLoW34ZIZqpII4AJRmQKnajiybB2k8xigna9NgAK5nAwfR9qhWLksi9jkWFHFIc9gBX5MZvvwBeXiE3qIdT3i17e64N6SSj6e+w7HwnO9ZxSsBBXe4QZqaF6YC06M2kndnC0l9Om7f41Po0qYuxiZ/CL9VffZq/VBUaWJT6aNhvy0L4kquFnsWWS+h3Fop3TsksIebAvfXEjpNAhP4V7Y3WOXqpS/lFPIYlrvHeacjdkIZUNU98T0L/qLg9dwAjcMpGgFSnSxQZAs/+IEfjwC1cv/X0UoL6U9U4ampM0E7z6o39xtmlBoX3sm/6Y8hCB5MEoeLXl2x9iK9cR5ku3bVkaAZE0XLnKyTeg5Plkegk0h5I1zu3yLStvXR9o8CiQimp2D5w9VzJev+pCSwTrOI8vogBlywrMCaWgweNfY2dCOlOTSdZz+VrJyWSM= nimansky@Nima-Desktop"
  ];

  etienneKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6oQHZBmvxJsCX8dLLnLhZvKuk64mUrYeLNUiCbZ65iwJx9rDEy7Bz1eBIy/U9RuVLbdTE7NvhWYgU8uGjvMUmUWOMXuFLiFIlEVp6wVoShKfJQg0wzh7W4dcGQDn5Ysee4T6bPCtutSVBZREI00kSDkR3/AXMZ6Dpo5p+SOnRkKR443bHl+z+ZDM451KwW8UGrCAoc+9xZyOJsSghXYRq2AH0PrzhKpMmgemZg2fFEGMmMO4fXvG6jFBvy9rQLsjPGDfRpcPJgb/zl/gOiifetje0ZWKMgAV17L0ysBYh+vTUjBHGimTMxp14hytoqjCj9o91RByRdu8sepbaPW74f0oPjL3PO9rF1+QODDNU5U0mEb7rdwoOn6rRBijgAHTPtjmiMaaxEH20fEgtH6paYPyVCIt2kv/+g9tjpSCcz0aQotZNhuft/RXaMoBPJD+8fUlbaAypSOn6XBniq9s1PIDDcjy/SD407jV/qzKBwLEEgw277+ed0kAz2vA98z8="
  ];

  jannikKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHcGR16x/38pzE7bidJu8Ow778pogCqN2U9h5Y6LZ8Xj jannik@jannik-ThinkPad-E15-Gen-2"
  ];

  peterKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGEQXgzXZD88m4eXmr1R1mWTVhtknjHrhRzJfWa4d9xU wegii@idontcare"
  ];

  tristanKeys = [
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAILb8iNX9HZnIPTWMr7GQoEuJl7H3SdLk5mIjGO8ylOyiAAAABHNzaDo="
  ];

  neelKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKWozsDBs44KjRUHgFuipUeh/CAbiYnjpqHI9COuYpAv neelm@Neels-PC"
  ];

  yongjieKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJDkLa3VpTxlK4o49Pf+tGp4sIpKxNwDlqqFoDKxVnfX 87616@Huang"
  ];

  extraGroups = [
    "wheel"
    "docker"
    "plugdev"
    "vboxusers"
    "adbusers"
    "input"
    "student"
    "video"
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
      expires = "2025-12-31";
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
      expires = "2025-12-31";
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
        "joy"
      ];
      openssh.authorizedKeys.keys = simonkKeys;
      expires = "2025-12-31";
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
      expires = "2025-12-31";  # Extended to end of year
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
      expires = "2025-12-31";
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
      expires = "2025-09-30";  # SS25 ends
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
      expires = "2025-12-31";
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
      expires = "2025-07-31";
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
        "ian"
      ];
      openssh.authorizedKeys.keys = antonKeys;
      expires = "2025-09-30";  # SS25 ends
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
      expires = "2025-07-31";
    };

    # Phillip Assmann, BSc thesis with David (Branch prediction research on gem5)
    phillip = {
      isNormalUser = true;
      home = "/home/phillip";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2069;
      allowedHosts = [
        "xavier"
        "jamie"
        "yasmin"
      ];
      openssh.authorizedKeys.keys = phillipKeys;
      expires = "2025-12-31";
    };

    # Steve Bambou, BSc thesis with David (Branch prediction research on gem5)
    steve = {
      isNormalUser = true;
      home = "/home/steve";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2070;
      allowedHosts = [
        "xavier"
        "jamie"
        "yasmin"
      ];
      openssh.authorizedKeys.keys = steveKeys;
      expires = "2025-12-31";
    };

    # Maximilian Jäcklein, BSc thesis with Harsha (Resource disaggregation)
    max = {
      isNormalUser = true;
      home = "/home/max";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2071;
      allowedHosts = [
        "amy"
        "clara"
        "rose"
        "wilfred"
        "vislor"
        "graham"
      ];
      openssh.authorizedKeys.keys = maxKeys;
      expires = "2025-12-31";
    };

    # Osman Yasar, HiWi working for David on gem5-related implemenations
    osman = {
      isNormalUser = true;
      home = "/home/osman";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2072;
      allowedHosts = [
        "xavier"
        "jamie"
        "yasmin"
        "ace"
        "eliza"
      ];
      openssh.authorizedKeys.keys = osmanKeys;
      expires = "2025-12-31";
    };

    # Hristina Grigorova, BSc thesis with Ilya (udos) can be safely removed after SS25
    hristinag = {
      isNormalUser = true;
      home = "/home/hristinag";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2073;
      allowedHosts = [
        "irene"
      ];
      openssh.authorizedKeys.keys = hristinagKeys;
      expires = "2025-09-30";  # SS25 ends
    };

    # Anders, working with Martin (tiramisu project). Ask Martin before removing.
    anders = {
      isNormalUser = true;
      home = "/home/anders";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 2074;
      allowedHosts = [
        "irene"
        "graham"
      ];
      openssh.authorizedKeys.keys = andersKeys;
      expires = "2025-12-31";
    };

    # Christian Krinitsin, Bachelor student with Theofilos.
    christianK = {
      isNormalUser = true;
      home = "/home/christianK";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2076;
      allowedHosts = [
        "yasmin"
        "graham"
        "jamie"
      ];
      openssh.authorizedKeys.keys = christianKKeys;
      expires = "2025-12-31";
    };

    # Victor Trost, BSc thesis with Nicolo (SLICC generator)
    victor = {
      isNormalUser = true;
      home = "/home/victor";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2077;
      allowedHosts = [
        "xavier"
        "jamie"
        "yasmin"
      ];
      openssh.authorizedKeys.keys = victorTKeys;
      expires = "2025-12-31";
    };

    # Nima Baradaran Hassanzadeh, student in seminar SS25 with Atsushi
    nima = {
      isNormalUser = true;
      home = "/home/nima";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2078;
      allowedHosts = [
        "rose"
      ];
      openssh.authorizedKeys.keys = nimaKeys;
      xrdpAccess = true;
      expires = "2025-09-30";  # SS25 ends
    };

    # Etienne Massart, student in seminar SS25 with Atsushi
    etienne = {
      isNormalUser = true;
      home = "/home/etienne";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2079;
      allowedHosts = [
        "rose"
      ];
      openssh.authorizedKeys.keys = etienneKeys;
      xrdpAccess = true;
      expires = "2025-09-30";  # SS25 ends
    };

    # Jannik Pflieger, quantum hiwi SS25/ MSc thesis with Aleksandra and Manos
    jannik = {
      isNormalUser = true;
      home = "/home/jannik";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2080;
      allowedHosts = [
        "jamie"
        "graham"
      ];
      openssh.authorizedKeys.keys = jannikKeys;
      xrdpAccess = false;
      expires = "2025-12-31";
    };

    # Peter Wegmann, MSc thesis with Aleksandra and Manos
    peter = {
      isNormalUser = true;
      home = "/home/peter";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2081;
      allowedHosts = [
        "jamie"
        "graham"
      ];
      openssh.authorizedKeys.keys = peterKeys;
      xrdpAccess = false;
      expires = "2025-12-31";
    };

    # Tristan Schwieren, MSc thesis with Dennis and Julian
    tristan = {
      isNormalUser = true;
      home = "/home/tristan";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2082;
      allowedHosts = [
        "xavier"
      ];
      openssh.authorizedKeys.keys = tristanKeys;
      expires = "2025-12-31";
    };

    # Neel Mandal, BSc thesis with David (Branch prediction research on gem5)
    neel = {
      isNormalUser = true;
      home = "/home/neel";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2083;
      allowedHosts = [
        "xavier"
        "jamie"
        "yasmin"
      ];
      openssh.authorizedKeys.keys = neelKeys;
      expires = "2026-12-31";
    };

    # Yongjie Huang, Remote student working with David (Branch prediction research on gem5)
    yongjie = {
      isNormalUser = true;
      home = "/home/yongjie";
      inherit extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2084;
      allowedHosts = [
        "xavier"
        "jamie"
        "yasmin"
      ];
      openssh.authorizedKeys.keys = yongjieKeys;
      expires = "2026-06-30";
    };

  };

  # DANGER ZONE!
  # Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  users.deletedUsers = [
    "alexa"
    "alexander"
    "alexandermaslew"
    "alp"
    "anand"
    "benedikt"
    "berkay"
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
    "justus"
    "justusvonderbeek"
    "kai"
    "kamilk"
    "kilian"
    "konrad"
    "konradH"
    "konstantin"
    "lan"
    "luca"
    "m00wl"
    "mfaltus"
    "mflatus"
    "mikilio"
    "milen"
    "ml"
    "moritz"
    "mwerndle"
    "nicola"
    "paul"
    "paulz"
    "philip"
    "raito"
    "raphael"
    "robert"
    "robertB"
    "roberto"
    "rohan"
    "s1443541"
    "sarac"
    "simond"
    "timo"
    "turkmen"
    "vanda"
    "vincent"
    "wonbangseo"
    "yihe"
    "yiwenliu"
    "zixuan"
    "bruno"
    "thang"
    "martinL"
    "janhe"
    "janha"
    "hristina"
    "hendrik"
    "florianD"
    "bruno"
  ];
}
