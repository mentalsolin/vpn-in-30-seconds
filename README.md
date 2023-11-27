# VPN in 30 Seconds
>Automatic script that creates a Docker container with WireGuard and generates 10 VPN configurations.

Step 0: Buy a VPS with static IP address.

## Download and run

Step 1: Download last version of the [script](https://raw.githubusercontent.com/mentalsolin/vpn-in-30-seconds/master/vpn.sh).

Or download it in console:
```
curl -O https://raw.githubusercontent.com/mentalsolin/vpn-in-30-seconds/master/vpn.sh && bash script.sh
```

Step 2 (optional): Customize the script (change timezone, peers, and etc)

Step 3: Run the script:
```
sudo sh ./vpn.sh
```

Step 4: Getting your VPN configs:

1. Peer

    ```
    cat /root/wireguard/config/peerX/peerX.conf
    ```

2. QR-Code
    ```
    qrencode -t ansiutf8 < /root/wireguard/config/peerX/peerX.conf
    ```

    *Replace the 'X' with your peer number. The default configuration creates 10 peers, and you can replace it with 1*

Done.

## Helpful resources

- [WireGuard Wikipedia](https://en.wikipedia.org/wiki/WireGuard)
- [WireGuard client for your OS](https://www.wireguard.com/install/)