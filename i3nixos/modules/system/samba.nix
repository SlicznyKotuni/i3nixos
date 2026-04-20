{ ... }:

{
  # Mount udziału Windows
  # Plik /etc/nixos/smb-secrets:
  #   username=uczen
  #   password=zaq1@WSX
  # sudo chmod 600 /etc/nixos/smb-secrets
  fileSystems."/mnt/shared" = {
    device = "//192.168.192.101/shared";
    fsType = "cifs";
    options = [
      "credentials=/etc/nixos/smb-secrets"
      "uid=1000"
      "gid=100"
      "iocharset=utf8"
      "noperm"
      "_netdev"
      "nofail"
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=10s"
      "x-systemd.mount-timeout=10s"
    ];
  };
}
