#!/bin/bash

# Function to get IP addresses for all network interfaces
get_ip_addresses() {
    echo "### Network Interfaces and IP Addresses ###"

    # Loop through all interfaces (excluding 'lo')
    for iface in $(ip -o link show | awk -F': ' '{print $2}' | grep -v '^lo$'); do
        echo -e "\nInterface: $iface"

        # Get IPv4 address
        ipv4=$(ip -4 addr show "$iface" | awk '/inet / {print $2}' | cut -d'/' -f1 | head -n 1)
        [[ -z "$ipv4" ]] && ipv4="None"

        # Get IPv6 address
        ipv6=$(ip -6 addr show "$iface" | awk '/inet6 / {print $2}' | cut -d'/' -f1 | head -n 1)
        [[ -z "$ipv6" ]] && ipv6="None"

        echo "  IPv4 Address: $ipv4"
        echo "  IPv6 Address: $ipv6"
    done
}

# Function to get listening ports
get_listening_ports() {
    echo -e "\n### Listening Ports ###"
    sudo ss -tuln | awk 'NR>1 {print $1, $5}' | column -t
}

# Main execution
echo ' '
echo "=== Network Information ==="
get_ip_addresses
get_listening_ports
echo "==========================="
