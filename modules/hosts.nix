{ lib, config, ...}: let
  hostOptions = with lib; {
    ipv4 = mkOption {
      type = types.str;
      description = ''
        own ipv4 address
      '';
    };

    ipv6 = mkOption {
      type = types.str;
      description = ''
        own ipv4 address
      '';
    };

    publicKey = mkOption {
      type = types.str;
      description = ''
        host ssh key scanned with:
        $ ssh-keyscan <ipaddress>
      '';
    };
  };
in {
  options = with lib; {
    networking.doctorwho.hosts = mkOption {
      type = with types; attrsOf (submodule [ { options = hostOptions; } ]);
      description = "A host in our cluster";
    };
  };
  config = {
    networking.doctorwho.hosts = {
      amy ={
        ipv4 = "129.215.165.57";
        ipv6 = "2001:630:3c1:164:b62e:99ff:fe3e:d369";
        publicKey = ''
          ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCv10UbazaDm20XkgpXxO4zuZ8E/VAjJKllr/QWnRRAGZ7fT/86XZtbT8uKg7VV061xSpQYHRjCSnCQL6eJMUoAaQ0I7uopIqLquEBGF8FUDA2Pq9LxB3jbAMhLGPFOxbi1ej/f8q6dhb91duszWPigJoP2cKYOh8+cPe1Sgu/gdSagrysDhau85tYB3htbrMY+uIbks7niU36zU0SEIU1f91m4MI8Znlz24xOZSLaipif7s2vC004a9AguyiAlqq9o4HyeS5ms/7I98Y9/TnUAMa1GGG/l2JFCI4ji/6xxh+Wvn965KoUN40hlfp6hj9LxmcDSFCsbVtr4a8KKFZ0fTN9qaebVR5B4UO/DeomBXQKsxs8Ev/S3Ank1x5dO1SIWz4dRaJwv+lOQI5PsDYc3HzcVXTbIkF4McA8/8T0MOo+UPrHLJmQ3Etw/JUw3JdiWd2c+fIWLypTDWChxH86/inR+tOfe8rR3NPS3R6YxptGzSVV0tBkyv16c/cJWHEDqVz45a2gVdWxI9qmpRKSciF+f+NLs3t9HbeBBkEUiK5YAI4RGLjHtUY2R4wNHg3W/uBcYGclNVEu9XcEZF1xbFma1fatd0koLUnpMRAZ32TO7bGJ5dByGtWMhW6Kpa8EEuINvhyDxLIkxta9LlNV1/xSq6vWb4poN1A8XCIYUAQ==
         ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDL+tDNEzC3TEtdgj8wyzczfeYCp1Eyn6qCFXLtQ6l2j
        '';
      };
      clara = {
        ipv4 = "129.215.165.58";
        ipv6 = "2001:630:3c1:164:b62e:99ff:fe3d:70f2";
        publicKey = ''
          ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGiEGMZYMBInneE1W6i5bS8Z4f2lIBL72UgioRa51FHzh80f90SQu5VamJuldktoB4yPT/GXDzWxiHDJl/T/+LLhzLyo8U3UVKQzKbkWapFmTMXB5oOBcbugHMytLX/o8GkRTzKEDLpKCDV3Nw/Pkv+buFtHEaEMNtnJU9MHb4pajwb8yMUTDIClgGNU4+D2yW2yROSxGlLCBzom6XVn1uTqZtNINzB0d8o8pXGoP4z88d6IG2GBNBx1Hv3myHHOMDPV+EqKGv72xCOi8WvrxfkxVxrT3MCA8Q6E4zd0VJQ2VOG9Q/ACZQtRuPRNkkuj1qNw308ZKyCGdl0pY+9nFNRRjRY+fIDpDr1ScgVdlWQHQNy+NIlRb+E8yMGzqup6Ky8KOpKLDuJeVwyr6sMMqbvIi6uctU9qphpCP7lrKwf6eQzq7Z4EdjuiEg/n44aXW5StCT+zqUJD+RDqsbAN4AyXjOyITLsRK7bhA7/Ewtlc9xVxxp4L9i5ZorTjWCnlQfbnrzXp/3BkWgMS+30v2UCOeZ1LX5VmDnQkEZ0Yg3VYZfoAyi4/RqLKOm7YFrERCVfRBKHxnwihHZeEF5jwV6aSIZHwJ0c3g1pZeyQJS9VuaHoD0gfoDaJFtO5DbNdjXM1UuWGardFGsybeZt+AbHH96Xs2REkMpIO0eTn7Jczw==
          ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKj5G6JkEpkqkhSdsqc4bF7P6gdcFtBAhDPy7yfjzzEZ
        '';
      };
      donna = {
        ipv4 = "129.215.165.54";
        ipv6 = "2001:630:3c1:164:30a2:6e7b:c58b:cafd";
        publicKey = ''
          ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC0z/THCey2AjWkDVhLmAobFXMfYGTm9sjQsIoluXvljFXIMvLpMKn4ugFabsudrSLFmzZo22rqkoWF0+uarDYZiXEZQhY7kZ0G0kGBaY9ebxU1PLF2snfHpCvW48R0hNl2FE6Il8d8trvQVjq/LyPizzNfD9h9tkK+ZuctxjQs+juG3vybuU+dLWlgTXRrDoj8k65ja8ox4rSq/XhTwLkPFbWl5hsNcjruyelDS8HtUyXCceNi0j6ty0nCTQNk0GgDJTHGgf9hVVV3QhEc8pXb/K0vIktXNuzYSWmvCInbjgHkCtt3Tm5mKVqH1b19RznK0pnFZKz4lnr9BEkzXrc8GMce5RyX1NGgHj9me+Zv5okOvxYE+zrahe/eAg4KGFH+pdcSmgS3s/tkJ6BAFjbmLT6UUOY3cbZKOwV4X42kK7HxbrJYF5Bc5tbXUNcJHkyPptefS5Fv2pQkYmtawDWSh/pj8WcuGWi3m5eOxsdyl6E9bUIQqlSoAV12eUtvu9QxriD3VKEhcBaWTnIne6UxD007KJpOAhUkrig0ZoD8pOf6tpMUsCe3faCbHFXqgiHUKZ9xWSPIHB/Mq8h8nKaESKI7Zv1P22rpMRRjW4SfHjq4vcO8UWawkOlVf907VBPv+qnRDUjdXWB3OisBnY0zi0gsxX0BOwz6axVuWV3ViQ==
          ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFhYAxcXK/Mpbr5/UVC4wr+KYHV4/g5E2A1DQwKZM+kC
        '';
      };
      martha = {
        ipv4 = "129.215.165.53";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4aba";
        publicKey = ''
          ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/kaLUJoqAs1/p/5fiDIlyrkrUBNHexqXLEMWVABhqdLVb76o+Ao2+9ST0wRj5TRatSocBq3TrNacBzRaJR7GVPOyqPnswKv+7xv4SJPiGx2QnjgOsRSW6e4EE8+LHKvWaaQwAyyq5b66U8Bxy4rO6WCmx+AAhPgzcde8RqWPgAOcO3BOywVCWVr5EAI9Baoa/P+cttZo9rlHj9xvPS2FgdFoK0xBkdvSy9PfDQHOQuxjR6Dy5/XttWDtK4l2Mxx2L9LW98Z2Acly7jCeODCcKaQFdXWwHA9IejgSOzq+s0NB2CTrGLqOq5sILAydzwcDA0MYzQ2TI2+eA2RuP4rTCAjDg8/OvNLIxMEKxF1+NnydnoMA0+YoXsgRTvYJH7qFpPVMG/TjJbcG9AknVGVD8ArtMW/VRqVp5iPA4UYMCek1j5tiDshdJb0JA0oS8gh4wtO9ACEZO8ANM+DzTwOiDPPDmgy9bqNsew4RC8WyLaFMOb/IB1r/Nq2EgY0OyQmMRktbeGyUvpl3M/gPRFlUk9RhBwLuaB1KfYtKWFRllrDwCKgRNwnrSnb6vq14lpP4cOZSKZWPBAtsFciOFWv//CMbcbbdcvrAPoZgCd42dagZ8sHj4rm8/USksRRWZ6EDCq3pb257qZI9slk5X4fZHCF8VPMuzJCuazaFPnqbt1w==
          ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEsPUEQKDRKYzW598gBaGzI++7dkRncHJoXgHzvJ1BuA
        '';
      };
      rose = {
        ipv4 = "129.215.165.52";
        ipv6 = "2001:630:3c1:164:6d4:c4ff:fe04:4e4b";
        publicKey = ''
          ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7UBBGkzjfd3HMS2hw4HtiC/VSHNCDPx+7hhrf5orzPGk9XjrJ72W0kMhzkOpCzfxKxUUmU4AVrxjZjt44MVLoDmvE7yRH9pfhmZDsSdjLqHZFijvzI1x+c4mDdHKYUJHna0pfhCgfVsNbbaP66xxOLwSvCKmheDkULamMOeXymc2ayjiozEEdHhEqqgvHIUsPYQ4gN5r8G5Kt8P/bppDL9RIRGZffj7GK6i+uiafXnpm5fCTFlgjktzmBP59+VRp43EfibGZSNtK49Wcz9M1vNVgZ2Wt7gLBiahiQ0hgbMcBIn2H2R9ZN3CaW/zb0bw+EbrdxblOV1tLfzCmvV+5nuMdCe3nHUOn6GUBW83J7pIOLgZipH+F7m0qmVw3+AVjyRuP2JznTTgMUT1+Yi0y+UqLJeRgb5prGr6aSsr1mztaYeP7T8ZRSHTTq8eYQECBguKGwYHtGwVONxgTgS7NT4DJSHqux5P4yYbe9Hdcbu95layywOrXi4QLP86cqUGQIQHqWxPMhz0UJ1xG2IIvVrD8fpC4Alx9MxidbPYw06/+fYfcrX5SHzYsbOOSFS3it6OUJodJjlAwoyTgHE+3Vi2CpSrGR7KDYUhQFWxNqH4oJohD1cZguSvSwLlBOZ/sEpCJRSS3Sn5U7POR2UNpIdIK86mkEZO2uC4PIU+B+Tw==
          ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDoS3y5uq1BbsZjz88os6G+hPVYHLReqO8PKYXh/b0XT
        '';
      };
    };

    # add each of our server to known hosts
    programs.ssh.knownHosts = lib.mapAttrs (name: host: {
      hostNames = [ name "${name}.r" host.ipv4 host.ipv6 ];
      inherit (host) publicKey;
    }) config.networking.doctorwho.hosts;
  };
}
