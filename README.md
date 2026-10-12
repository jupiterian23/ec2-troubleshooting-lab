# 🔎 EC2 Troubleshooting Lab

A hands-on Cloud Support Engineering project for diagnosing Linux web application failures using systematic troubleshooting, command-line tools, and incident reports.

## 🎯 Project Objectives

- Troubleshoot Linux services and web application failures.
- Diagnose HTTP connectivity and listening-port issues.
- Inspect CPU, memory, disk usage, and service logs.
- Practice root-cause analysis and incident documentation.
- Build a reusable diagnostic script.
- Prepare the environment for a future AWS EC2 deployment.

## 🏗️ Architecture

```text
User / Browser
      |
      v
Local Linux Environment
      |
      v
Nginx Web Server
      |
      v
HTML Test Website
      |
      v
Diagnostic Script
      |
      +-- Service Status
      +-- Listening Ports
      +-- HTTP Response
      +-- System Resources
      +-- Service Logs
```

**Current phase:** Local Linux lab  
**Planned phase:** AWS EC2 deployment and cloud-network troubleshooting

## 🛠️ Technologies

- Linux and Bash
- Nginx
- HTML
- curl
- systemd and journalctl
- Networking diagnostics
- Terraform (planned for AWS deployment)

## 📁 Repository Structure

```text
ec2-troubleshooting-lab/
├── README.md
├── application/
│   └── index.html
├── docs/
├── incident-reports/
├── screenshots/
├── scripts/
│   └── diagnose.sh
└── terraform/
```

## 🔬 Planned Troubleshooting Scenarios

| Scenario | Investigation |
|---|---|
| Nginx stopped | Service status and logs |
| Website returns an error | HTTP response and application configuration |
| Port is not listening | Socket and process inspection |
| High disk usage | Filesystem usage |
| Incorrect Nginx configuration | Configuration validation and error logs |
| AWS website unreachable | Security Groups, routing, and network path — planned |

## 🚦 Getting Started

The setup and test instructions will be added as the local lab is implemented.

## 📋 Incident Management Workflow

Each incident will follow this process:

1. Identify the symptom.
2. Collect diagnostic evidence.
3. Isolate the failing component.
4. Determine the root cause.
5. Apply the smallest appropriate fix.
6. Verify service recovery.
7. Document prevention and lessons learned.

## 🔐 Safety

- The current lab is designed for local testing.
- No AWS resources are created in the current phase.
- Destructive tests will be limited to the lab environment.
- Credentials, private keys, and secrets must never be committed.

## 👨‍💻 Author

Shubham Gorule

Cloud Support Engineering | AWS | Linux | Networking

---

**Note:** AWS deployment, Terraform infrastructure, and CloudWatch integration are planned enhancements and should not be considered deployed until implemented and tested.
