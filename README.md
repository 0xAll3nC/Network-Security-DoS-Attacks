# Network Security - DoS Attack Analysis

This project demonstrates the impact of various Denial of Service (DoS) attacks on a webserver using Wireshark, a protocol analyzer. The attacks include SYN Flood, ICMP Flood, and address spoofing, analyzed through traffic magnitude and effectiveness using different attacker nodes.

## Setup Instructions
- Install Wireshark: `sudo apt-get install wireshark`
- Set up CORE scenario: `systemctl status core-daemon`

## Project Breakdown
- **SYN Flood Attack**: Simulated with single and multiple attackers, analyzed for traffic peak values.
- **ICMP Flood Attack**: Investigated for its effect on server response.
- **Address Spoofing**: Explored the impact of SYN Flood attack with spoofed source addresses.

## Results
- Detailed Wireshark logs and IO graphs showing traffic magnitude and attack impact.

## File
- `scenario-ddos.xml`: CORE GUI scenario file.
- `start.sh`: Script used to initiate the server-side processes.
- `run_curl.sh`: Script used to simulate client requests during attacks.
- `index.html`: Simple landing page or status page that indicates a running server.

## Conclusion
The project demonstrates how DoS attacks can overwhelm a server depending on traffic magnitude and attacker configurations.
