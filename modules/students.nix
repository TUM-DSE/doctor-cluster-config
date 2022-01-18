{ config, ... }:

let
  philipKeys = ''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBMI+21MFo1RlD0Urx8bTJHJZnRNRSGuN9IZ6Ld7M2JS philip@x541uj
  '';

  m00wlKeys = ''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKj82MjggZ8uEbi/1cITRA84Ou2I6TYfCPfFHwhXm2Tx moritz.lumme@tum.de
  '';

  paulKeys = ''
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC6/nkUEjr09814INiM8+GS9x4RY8j/ulMVFiTsYTxCcbhCWFGgQ6NS+kg2iTtthHzsgaXddfoy2Zy6FwTTFpaekK30ZZaNPFK9h/Z8Nry6TgYJhPbe5ftinf8gWkhihGk4SnjVCGIc+eOK5MsS31stPReYEkeqtnbLiRzGgk2MmgworouHMy3x8N9nfcRWZVAQMzYeZtz9eqAB4T81zEPLcd9bHWziYr7Qy0nCc9aVQ3C/OkNT8yDinYIqaoDRRuiCfK5WhRzv2Sid7Qq5md2CVgctsM8GAOX6HMsmNN3JmElfUgE5eJpkpfp0GVEbYcZZyIlKXe0Oz3fECbSq78+PvdJkKs2pidU6KhoCuOGED9RQwXfeCxQL09Um6wCFmdr+A4XBIFSAbxxeHrM2bdQccxp4FLpiXJpI8hOJNCo4I6gnpYlv+DBjjm0h5+9Eb/Eq0d8Mz9BWBvO1ltbJMvA/S32AQyVUZKndNQ/K9oVdAXcDM0PFrkad8k5rRJK4QsfzY6b8zSbYuk2bA2cKxz29+8PJcbWZcSf+yyN3+ELFu2E2F3mgx/doPBgMk4y9gHRwr7HiN+7eYwiLVnF402f46D2bpj8LFGsCkeAbHS4DKFdn3vAOTs1wGK3cmgTQnH/edfaEN+zmuXXgh4gUr64vRyra+rn3PGbPQTRAmzoA3w== paul.heidekrueger@tum.de
  '';
  
  jrKeys = ''
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYva//qGT0//ljbMjZjX1ugxQjHJir8/Qp1yxy8ZDFCY7rwLi15M69/ZQ8NplU53bkW4ezqkf9CON80NpzfGTuyi7FO28JeWbHovyyHymkUM2wcFjAXOjQKgXz7NRKswZSDAdjZcX7nxHoqY4yI5fBy/9yYNrcdvKZ8NcCGFyhHQijdLUwo4hfOWKIHp4j4tLjQ0T7nKHmcuE+o5xr54EZpAvhQgyPFxrxYiLxX08ksDCykWocgJIiEDVBpw58vTQJxWzRMab/AnWs2FesKOKOfzy9wXa3ze++kb0WVzairhxj5lI2MUAZiE8nCEGBy7jiIDsQ3CaWMFpfvQHnvkd5 jasper@debianj
  '';
  
  mfKeys = ''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINK0/PSpRypoFe8NQ1BHjCyxraIvhX/0q6OIO7DYnmyq Martin Fink
  '';

  alexaKeys = ''
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCmhBDhr9rXPSzt9xi29btIYlpBqePI3JGWYrR7EJc3BBSChIHBkWfaseannbSn4rFG7YV6kVdW7Kx7n1q5bXVOllCC1IeEDBIJg9mdW9nUw8pyG0o2gI8jcgitLSgB6M+dEAHHGh+OSkQXDdRN1RpnRslfPvVAGWpqWcmLxSK8PCI389yXsXTe605OC1wEtFe3dsYqHmA/C960AH0RJXGquM82Vw64/4ORySWRPjNlHHgvYUBuWaQFaM3JoouWQA5LhpIdNLP3HyWISXuEgOMEgCbmw9EEx2EQwD9OaWivQ7W65neNu1NgcFZBAegRAI9ATNl5bW8UiUmrNyZQm4WNuvNsBJbepRIPH25YqTWLZf8kMk0L8+VSa2Rb/9Jyf15qexme1KuaSfJUX2kFRlrW2ADEM+cT99gzh3EJPhu73Ev0N4ibJd4tdjY3mHlSrIXIkN2VbiBV4xss99ebMvkNjpLhHZvkM4a25arQfj/ROdevMbzVu5sxsKRkaMd0/mc= alexandrina@DESKTOP-8HD3TSS
  '';
in
{
  users.users = {
    # Moritz Lumme (internship)
    m00wl = {
      isNormalUser = true;
      home = "/home/m00wl";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 1014;
      openssh.authorizedKeys.keys = [ m00wlKeys ];
    };

    # Master thesis (dimitrios student)
    # finished, Remove before christmas
    philip = {
      isNormalUser = true;
      home = "/home/philip";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 1011;
      openssh.authorizedKeys.keys = [ philipKeys ];
    };

    # Paul Heidekrüger, Babish's BA student (Dependency ordering in the linux kernel)
    paul = {
      isNormalUser = true;
      home = "/home/paul";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 1007;
      openssh.authorizedKeys.keys = [ paulKeys ];
    };

    # Jasper Ruhl (guided research) with Redha
    jasper = {
      isNormalUser = true;
      home = "/home/jasper";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/fish";
      uid = 1015;
      openssh.authorizedKeys.keys = [ jrKeys ];
    };
    
    # Martin Fink (guided research) with Redha/Rodrigo
    # maybe remove after winter semester 2021/2022
    martin = {
      isNormalUser = true;
      home = "/home/martin";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/zsh";
      uid = 1016;
      openssh.authorizedKeys.keys = [ mfKeys ];
    };

    # Alexandrina Panfil (bachelor thesis with Dimitrios and Jin)
    alexa = {
      isNormalUser = true;
      home = "/home/alexa";
      uid = 1017;
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      openssh.authorizedKeys.keys = [ alexaKeys ];
    };
  };

  # DANGER ZONE!
  # Make sure all data is backed up before adding user names here. This will
  # delete all data of the associated user
  users.deletedUsers = [ "vincent" ];

  # only used by jasper atm
  programs.fish.enable = true;
}
