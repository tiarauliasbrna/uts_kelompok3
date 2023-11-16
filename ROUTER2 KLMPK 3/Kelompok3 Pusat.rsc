# nov/16/2023 19:04:41 by RouterOS 6.48.7
# software id = 44UU-TR2K
#
# model = RouterBOARD 941-2nD
# serial number = 8B0E08B7BB28
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.2.2-192.168.2.254
add name=dhcp_pool1 ranges=192.168.3.2-192.168.3.254
add name=dhcp_pool2 ranges=1.1.1.2-1.1.1.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface=ether3 name=dhcp2
add address-pool=dhcp_pool2 disabled=no interface=ether4 name=dhcp3
/ip address
add address=192.168.2.1/24 interface=ether2 network=192.168.2.0
add address=192.168.3.1/24 interface=ether3 network=192.168.3.0
add address=1.1.1.1/24 interface=ether4 network=1.1.1.0
/ip dhcp-client
add disabled=no interface=ether1
add disabled=no interface=ether4
/ip dhcp-server network
add address=1.1.1.0/24 gateway=1.1.1.1
add address=192.168.2.0/24 gateway=192.168.2.1
add address=192.168.3.0/24 gateway=192.168.3.1
/ip firewall nat
add action=masquerade chain=srcnat
/routing ospf network
add area=backbone network=192.168.2.0/24
add area=backbone network=1.1.1.0/24
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=R1
