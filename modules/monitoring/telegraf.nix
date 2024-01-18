{ lib, ... }:
let
  urls = [
    "adelaide.r"
    "amy.r"
    "astrid.r"
    "bill.r"
    "christina.r"
    "clara.r"
    "dan.r"
    "graham.r"
    "jack.r"
    "jackson.r"
    "mickey.r"
    "nardole.r"
    "river.r"
    "rose.r"
    "ryan.r"
    "vislor.r"
    "wilfred.r"
    "yasmin.r"
  ];
in
{
  services.telegraf.extraConfig.inputs = {
    ping =
      map
        (url: {
          method = "native";
          urls = [ "6.${url}" ];
          ipv6 = true;
          tags.org = "uni";
          tags.host = lib.removeSuffix ".r" url;
        })
        urls;
    net_response =
      map
        (host: {
          protocol = "tcp";
          address = "${host}:22";
          tags.host = host;
          tags.org = "uni";
          send = "SSH-2.0-Telegraf";
          expect = "SSH-2.0";
          timeout = "10s";
        })
        urls;

    x509_cert = [
      {
        sources = [ "https://web.dos.cit.tum.de:443" ];
        tags.host = "vmbhatotia19";
        tags.org = "uni";
      }
    ];
  };
}
