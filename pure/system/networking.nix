{ ... }:
{

  ## Enable networking.
  networking.networkmanager.enable = true;

  ## Firewall
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [
      # 5173 # Vite
    ];

    allowedUDPPorts = [
      # 5173 # Vite
    ];
  };

  ## Enable wireless support via wpa_supplicant.
  # networking.wireless.enable = true;  

  ## Network proxy
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  ## Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

}
