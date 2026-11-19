# Constants of the Intel FPGA (Quartus, Questa) floating license server
# (docs/intel-fpgas.md).
{
  # The floating licenses are bound to this host's NIC (58A2E12D919E).
  serverHost = "xavier";
  serverName = "xavier.dos.cit.tum.de";

  # lmgrd and the vendor daemons for Quartus (alterad) and Questa (mgcld).
  # Fixed, so that clients and the relay know where to connect.
  lmgrdPort = 27010;
  alteradPort = 27011;
  mgcldPort = 27012;

  # The relay's Unix sockets, one per port, named <port>.sock. Build hosts add
  # this directory to the Nix sandbox, so builds reach the server without
  # network access.
  relayDir = "/run/intel-fpga-license";

  toolsRoot = "/share/intel-fpga/tools";
  licenseDir = "/share/intel-fpga/licenses";

  # The floating license files as issued by Altera, with placeholders for the
  # server's host name, port and daemon paths.
  licenseFiles = [
    "LR-210506_License.dat"
    "LR-210507_License.dat"
    "LR-210510_License.dat"
    "LR-210511_License.dat"
    "LR-210514_License.dat"
    "LR-210515_License.dat"
  ];

  # lmgrd and alterad from this Quartus installation. Quartus 25.1 and newer
  # need FlexNet 11.19.6 or newer on the server.
  flexlmVersion = "26.1";
  # Questa 25.1 and newer no longer ship mgcld.
  mgcldVersion = "24.1";
}
