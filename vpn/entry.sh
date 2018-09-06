#!/usr/bin/env bash
file_path="$(pwd)/client.ovpn"
until [ -f $file_path ]; do
    echo "No client config file found"
    sleep 60
done
echo "Starting VPN client"
openvpn --config $file_path
