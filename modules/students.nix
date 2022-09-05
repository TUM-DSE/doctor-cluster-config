{config, ...}: let
  m00wlKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKj82MjggZ8uEbi/1cITRA84Ou2I6TYfCPfFHwhXm2Tx moritz.lumme@tum.de"
  ];

  paulKeys = [
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEBXRWrVa4+O0OulhfKo7US7baIVO7b3NqhBYJ8O4Bg+MFQj8lwcVkgteia9K0VYV4xJbzdyBlrHk2LXsN/SBkI= DSE@secretive.Paul’s-MacBook-Pro.local"
  ];

  jrKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYva//qGT0//ljbMjZjX1ugxQjHJir8/Qp1yxy8ZDFCY7rwLi15M69/ZQ8NplU53bkW4ezqkf9CON80NpzfGTuyi7FO28JeWbHovyyHymkUM2wcFjAXOjQKgXz7NRKswZSDAdjZcX7nxHoqY4yI5fBy/9yYNrcdvKZ8NcCGFyhHQijdLUwo4hfOWKIHp4j4tLjQ0T7nKHmcuE+o5xr54EZpAvhQgyPFxrxYiLxX08ksDCykWocgJIiEDVBpw58vTQJxWzRMab/AnWs2FesKOKOfzy9wXa3ze++kb0WVzairhxj5lI2MUAZiE8nCEGBy7jiIDsQ3CaWMFpfvQHnvkd5 jasper@debianj"
  ];

  mfKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINK0/PSpRypoFe8NQ1BHjCyxraIvhX/0q6OIO7DYnmyq Martin Fink"
  ];

  alexaKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCmhBDhr9rXPSzt9xi29btIYlpBqePI3JGWYrR7EJc3BBSChIHBkWfaseannbSn4rFG7YV6kVdW7Kx7n1q5bXVOllCC1IeEDBIJg9mdW9nUw8pyG0o2gI8jcgitLSgB6M+dEAHHGh+OSkQXDdRN1RpnRslfPvVAGWpqWcmLxSK8PCI389yXsXTe605OC1wEtFe3dsYqHmA/C960AH0RJXGquM82Vw64/4ORySWRPjNlHHgvYUBuWaQFaM3JoouWQA5LhpIdNLP3HyWISXuEgOMEgCbmw9EEx2EQwD9OaWivQ7W65neNu1NgcFZBAegRAI9ATNl5bW8UiUmrNyZQm4WNuvNsBJbepRIPH25YqTWLZf8kMk0L8+VSa2Rb/9Jyf15qexme1KuaSfJUX2kFRlrW2ADEM+cT99gzh3EJPhu73Ev0N4ibJd4tdjY3mHlSrIXIkN2VbiBV4xss99ebMvkNjpLhHZvkM4a25arQfj/ROdevMbzVu5sxsKRkaMd0/mc= alexandrina@DESKTOP-8HD3TSS"
  ];

  julianKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZs04queaSB/BGQesCEiunOkeEydB5rJ2WUXSrGlDLVoJ6/Q7fAHM99200fxK7h0vtKda4OkdUEBtRtq2wn+Z0YW51mFvzJ7214ZIY4JKtYX02KW8r7gVXYmjoX3VWEKi5iKfld0WO9jaDN3InU5CYyYx1nHl+BNasxIHtUzjhHCC+Ggxt3Kc+IxW2DV8J9/JwhKhgedqvqbc93+V05/UeYwG0Q9z1mwBEuOlGv8yP6uhCWmHzxbJYo+oxU5nSXM0lPHecxa7M8hROXEVrSxg27vUg7JoiSQ1wt3lzNQS4Abd8JLqOJlQYQvbz5Xxd0KhD0kaBCptXBCxdOo+YLi06XNs16rRtQPM51jTrero3h1wfA51XR7w7j52nbLC2ZGMyaSO1c5IQ5d5Xad/F1ZcOQQWvFhK+ie9LJzvR0AXiFXzEBvmPiZ82rLdjWGPO4975fSYTOxshZojk7oV4fQyd5vKCsjChL0JC2chPfYRv2kti/9CVqVseznVMPE/JgdE= julian@mind"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCkHALCUCursw1AvmYaQLfYBee1lGR4sqqlTEHfatyAqQrCxFnWNnO03ScEfNsDQKDZPRQ/RZYOOHlNxoKQzYaHlpbFafePKNH+lKZWibabp4HT3ho0mi56i2sqXLSMP+y3nz4S7vx678CVgyK1/gW9wB0ORNh1Ss1NqPhi/DFxHVxcLig3mjCVoC6QzIzTLq8uVP/bOD2jtED/PSdAFQQNd2RjKWea7UjjH7IiQvvJHwl1OB8X1x7mxwuQuHCMj7kwwKfEEvqOy3NiDzY9Ewc7HihFLkROMK3obbYLoQjYf/tP9SYpekWx4Q8CpgmvAblwDcv8unmnYAN2Cj5PQ4YulBPCOwNfmVCvsp3gX8eLG6XNYjnHt7DIEm8Yj4EeSCuB6DLOR2Em5eKH57qzQFHyubdIwVoY1xzfdd1wzaKuL+ahoLKmZ23Q6bK795BwZBogyoceREg9surF9P8l9mJi2Yn8aGMtCF9ecIySNGYwI1AqKGYX14Vo9HA3nfADCI1wCND5LyqD6UDGfM1iBV38gGl05jyywcTgpctI4ryQy6SUDf9x+CZuDwHXihR6Rj9Oj1Vy6zFdCKq4xt76xCsIPuy+6CY4RdOkCNmQn3NKeRnttLmyYIpLbHkTdYs8GIyLsf1mz6uHZNcWg5fwPTabgT8PJ5yJRQo9IoXGawf+vQ== julian.pritzi@gmail.com"
  ];

  mwerndleKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsZ8xTt0Ti6evYqvLBMXLaExS0SP0KZB7oSA7RO3tQinlVT62KIxJ5NXxrKgCOy3evCtN+fqYFvshGHZ6/FPcOj3i3PfJRHaj6WjQicIIfVFEbfLtzh2QxDDVXBkfh747fBmPHrfXJwxCRjRpSwYBmDBcJVjH3weHLqVm6f4SioDWMZ8arCYipZSPlfCFvcqR532ipiKQH3pHinjtopLMLmZnZQeXOsK1lsIDLs7/onkK1cNhCeX7Hq69N7gp/2AYUoXjnZ2/vvDq6QAofz5jASDjPfZz1eHdz4owc6I+LoAc76QxE/37mV6PCiGO4YiQji8byvjuIq94moOMfIDkj teppichseite@DESKTOP-NRKB54G"
  ];
  
  mfaltusKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCk/FU+8EXhfm16DuOuC/9WJT8O2zkRscjVUVZNqjcYhelJbnzcYcnLdkwcnTik8qwrgj5DKI2N0I+RuoZuqGo9q5FlRuvv+GHDuaB8UVjhJrmm9vpTy8Eng52AlttJAOLKhnJQ1BidqvKXD93RGba5S2a0AK0Pdqm7z029RkGNo2zUp5rnuLQmmeitIej7vdZmxx1sk5cYiYBLScwOl7whK7O7ymFQtGQjRB8OC2apAAJ6GVNtoCYbZ71vsHoVKYRD2laHfWpJ3zcE89MWtRxtAjNxSNTB9ZkJLND73NBQtBUt9et4R54hCPbiJgMnWV00LQbfWl9+FrE1yJQA3pJsV8ceqNFC6z4Get6XCOHr4sK129Ww2vTgORHXr+QCMwV0ejeTYOk+ypQG4pFjzM1b2c8RXIT4V9jE16FdGzss2z7Ic9lxtzCJdsA7lg3jrvSpr8zAzoUez+Z2pP9QUAMMb6Q4EqU3sWQn6pHUqP4Lpzb5WGWAn9AMd2qB0sVuJQheYDRsuo4OidLtiOEj+IHkrRGNuAAtbLvFinaouqhYdHKiizX+ddTTl3hGtoD2cX3MixhHCy1LypL08VmORL/yUI90uHkqajWCwNnOLABx/Sa+ZSkTHsAilEkU1TvO9aox2iMbsc1nZwilaBR+onvHP2x0d94BTGHRV3al34BhJw== marcel@Desktop-17"
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBK37Hp7Tjuqjm9iGBJL6/GIqNZRN6NSQD4SKomAAL+Zjx7UV+HXX19hruvRdkjz/RNeU27vYthrKwtfqIggzEiI= marcel@Desktop-17"
  ];

  gierensKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBevyJ5i0237DNoS29F9aii2AJwrSxXNz3hP61hWXfRl sandro@reaper.gierens.de"
  ];

  heKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJgQ10239M1Ehw6nmY7mFxGyqfpCkfSHAjZzSZZZ7NLA"
  ];

  vandaKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFHNFtsaHwUsqyiDn4MHVxmAPSgGkSODvPoUX71XWMMD vanda@arch"
  ];

in {
  # for new students please use a uid in the range between 2000-3000
  # You can set `users.users.<name>.allowedHosts` to restrict access to certain machines.
  users.users = {
    # Paul Heidekrüger, Babish's BA student (Dependency ordering in the linux kernel)
    paul = {
      isNormalUser = true;
      home = "/home/paul";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 1007;
      openssh.authorizedKeys.keys = paulKeys;
    };

    # Jasper Ruhl (guided research) with Redha
    jasper = {
      isNormalUser = true;
      home = "/home/jasper";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/fish";
      uid = 1015;
      openssh.authorizedKeys.keys = jrKeys;
    };

    # Martin Fink (guided research) with Redha/Rodrigo
    # maybe remove after winter semester 2021/2022
    martin = {
      isNormalUser = true;
      home = "/home/martin";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 1016;
      openssh.authorizedKeys.keys = mfKeys;
    };

    # Alexandrina Panfil (bachelor thesis with Dimitrios and Jin)
    alexa = {
      isNormalUser = true;
      home = "/home/alexa";
      uid = 1017;
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      allowedHosts = ["graham"];
      openssh.authorizedKeys.keys = alexaKeys;
    };

    # Julian Pritzi, Harshas's student (Benchmarking tool for ICU project)
    julian = {
      isNormalUser = true;
      home = "/home/julian";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2000;
      openssh.authorizedKeys.keys = julianKeys;
    };

    # Matthias Werndle, Dimitris' BSc student (Generic programming model for PM)
    mwerndle = {
      isNormalUser = true;
      home = "/home/mwerndle";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2001;
      openssh.authorizedKeys.keys = mwerndleKeys;
    };
    
    # Marcel Faltus, Redha's BSc student (Porting QEMU for Apple M1)
    mfaltus = {
      isNormalUser = true;
      home = "/home/mfaltus";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2002;
      openssh.authorizedKeys.keys = mfaltusKeys;
    };

    # Sandro Gierens, Peter's BSc student (applying ioregionfd to KVM/qemu devices)
    gierens = {
      isNormalUser = true;
      home = "/home/gierens";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2003;
      openssh.authorizedKeys.keys = gierensKeys;
    };

    # Vanda Hendrychova, Masa's MSc student (extensible unikernels)
    vanda = {
      isNormalUser = true;
      home = "/home/vanda";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 2004;
      openssh.authorizedKeys.keys = vandaKeys;
    };
  };

  # DANGER ZONE!
  # Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  users.deletedUsers = [
    "vincent"
    "ml"
    "philip"
    "m00wl"
    "he"
  ];

  # only used by jasper atm
  programs.fish.enable = true;
}
