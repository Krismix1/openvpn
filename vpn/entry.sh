#!/usr/bin/env bash
file_path="/usr/vpn/client.ovpn"
until [ -f $file_path ]; do
    echo "No client config file found"
    sleep 60
done
echo "Starting VPN client"
openvpn --config $file_path
