### Resin and self hosted VPN

This is a example of how you can make the device connect to a self hosted VPN server.
This example uses [DigitalOcean](https://www.digitalocean.com/) and [OpenVPN](https://openvpn.net/).

1. Deploy the code on a device
2. Create a VPN server. See this [guide](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-ubuntu-16-04).
3. Now, we need to transfer the ovpn file you created in previous step to the device
	- Enable PasswordAuthentication on your server, revert the step described [here](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04#step-five-%E2%80%94-disable-password-authentication-(recommended))
	- From the device: `scp <username>@<server_ip>:<path_to_ovpn_file> /var/libs/docker/volumes/<resin_app_id>_vpn/client.ovpn`.
	Remember to replace the placeholders with actual values. The docker volume folder can have a different name, but it will contain **vpn** in it.
4. At the next iteration of the loop, the VPN should be enabled.
5. (Optional) Disable PasswordAuthentication on the server.
