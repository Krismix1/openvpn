### Resin and self hosted VPN

This is a example of how you can make the device connect to a self hosted VPN server.
This example uses [DigitalOcean](https://www.digitalocean.com/) and [OpenVPN](https://openvpn.net/).

The container needs to have access to the host network (thus `network_mode: host`) and to be privileged (otherwise the ovpn command will fail).
Resin runs single-container applications in privileged mode, but multicontainer applications need to have `privileged: true` in the docker-compose.yml file.

1. Deploy the code on a device
2. Create a VPN server. See this [guide](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-ubuntu-16-04).
3. Now, we need to transfer the ovpn file you created in previous step to the device
	- Enable PasswordAuthentication on your server, revert the step described [here](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04#step-five-%E2%80%94-disable-password-authentication-(recommended))
	- Get the file on the device (multiple ways):
		- From host: `scp <username>@<server_ip>:<path_to_ovpn_file> /var/libs/docker/volumes/<resin_app_id>_vpn/client.ovpn`
		- Or from container: `scp <username>@<server_ip>:<path_to_ovpn_file> /usr/vpn/client.ovpn`
		- Or add the file through `COPY client.ovpn .` in Dockerfile. This approach is less desirable because it requires you to keep track of file in git and also makes it harder to have different files for more devices.

	Remember to replace the placeholders with actual values.
4. At the next iteration of the loop, the VPN should be enabled.
5. (Optional) Disable back PasswordAuthentication on the server.
