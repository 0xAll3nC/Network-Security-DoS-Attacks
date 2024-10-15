
# DoS Attack Analysis using Wireshark

## Overview
This project demonstrates the impact of Denial of Service (DoS) attacks on a web server using Wireshark, a protocol analyzer, and CORE (Common Open Research Emulator). It covers various types of DoS attacks including SYN Flood, ICMP Flood, and Address Spoofing. The analysis includes traffic behavior visualization, attack effectiveness, and peak bandwidth consumption.

## Table of Contents
- [Installation](#installation)
- [Project Setup](#project-setup)
- [Attack Scenarios](#attack-scenarios)
  - [SYN Flood Attack](#syn-flood-attack)
  - [ICMP Flood Attack](#icmp-flood-attack)
  - [SYN Flood with Address Spoofing](#syn-flood-with-address-spoofing)
- [Results and Analysis](#results-and-analysis)
- [Conclusion](#conclusion)
- [Files Included](#files-included)

## Installation
### Requirements:
- **Wireshark**: A network protocol analyzer
- **CORE Emulator**: A tool to simulate network environments
- **hping3**: A tool to generate SYN Flood and ICMP Flood attacks

To install Wireshark and hping3:
```bash
sudo apt-get update
sudo apt-get install wireshark hping3
```

To install CORE Emulator:
```bash
sudo apt-get install core
systemctl status core-daemon  # Ensure the CORE daemon is running
```

## Project Setup

1. Ensure the CORE daemon is running:
   ```bash
   systemctl status core-daemon
   ```

2. Load the provided CORE scenario file (`scenario-ddos.xml`) using the CORE GUI.

3. Start the scenario:
   - Click the green play button to start the network nodes.
   - SSH into the server and client nodes to run the attack scripts.

## Attack Scenarios

### SYN Flood Attack
- Command used:
  ```bash
  sudo hping3 -S -p 1022 --flood 10.0.1.20
  ```
  - This attack generates a flood of SYN packets to overwhelm the server at port 1022.

#### Results:
The SYN Flood attack was not effective when run from a single attacker due to the server's capacity to handle the traffic. When executed from two attacker nodes simultaneously, the attack was successful, preventing the client from receiving responses for 2 minutes.

### ICMP Flood Attack
- Command used:
  ```bash
  sudo hping3 --icmp --flood 10.0.1.20
  ```
  - This attack sends a flood of ICMP packets (Ping) to the server.

#### Results:
The ICMP Flood attack was ineffective, as the server continued responding to the client even during the attack. The peak traffic rate was around 80 kbps.

### SYN Flood with Address Spoofing
- Command used:
  ```bash
  sudo hping3 -S -p 1022 -a 10.0.0.20 --flood 10.0.1.20
  ```
  - This command spoofs the client's IP address (10.0.0.20) while sending SYN packets from the attacker nodes.

#### Results
The attack was partially successful. The client experienced response delays in 1-minute intervals due to the spoofed traffic. The combined traffic from both attacker nodes caused peak traffic of 160 kbps.

## Results and Analysis

1. **Traffic Magnitude**:
   - The bandwidth during each attack was monitored using Wireshark IO graphs.
   - **SYN Flood Attack**: Peak bandwidth reached 200 kbps when using two attackers.
   - **ICMP Flood Attack**: Traffic stabilized around 80 kbps.
   - **SYN Flood with Address Spoofing**: Traffic peaked at 160 kbps due to combined spoofed traffic.

2. **Effectiveness**:
   - Attacks from a single attacker were generally ineffective, except for address spoofing.
   - Multiple attackers could successfully disrupt server-client communication, highlighting the potential danger of distributed DoS attacks.

## Conclusion
The project successfully demonstrated how different types of DoS attacks affect a web server. While some attacks were ineffective under the tested conditions, SYN Flood attacks from multiple attackers proved to be impactful. Address spoofing added an extra layer of complexity, making the attack harder to detect and increasing its effectiveness.
