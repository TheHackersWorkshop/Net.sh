# Network Information Script
This Bash script provides a quick and comprehensive overview of a system's network configuration. It retrieves IP addresses assigned to all active network interfaces and lists all currently listening ports. This script is particularly useful for system administrators and network engineers who need to diagnose connectivity issues or audit a machine's network setup.

Features
Display Network Interfaces & IP Addresses

Lists all active network interfaces (excluding the loopback interface).

Shows both IPv4 and IPv6 addresses, if available.

List Open Ports

Displays all currently listening ports along with their protocols (TCP/UDP).

Uses the ss command to gather socket information (requires sudo privileges).

