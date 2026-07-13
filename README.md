# Puppet SLES Hardening

This repository provides an enterprise-focused configuration management profile engineered to apply security policies, host configurations, and memory performance settings across **SUSE Linux Enterprise Server (SLES 15)** operating environments.

## Scope of Configuration
This module targets infrastructure metrics necessary for high-capacity database systems (**IBM DB2**) and application spaces (**SAP Applications Ecosystems**). It isolates underlying core configuration variables from standard, multi-user workspace distributions.

## Architectural Layers Applied
- **System Access Controls:** Implements non-interactive access controls, overrides unencrypted protocols, and coordinates system logging daemons.
- **Kernel-Level Infrastructure Protections:** Applies parameter configurations to drop transport-layer network redirection vectors and manage logging for non-routable communication attempts.
- **Enterprise Workload Tuning:** Adjusts translation buffer allocations, page management algorithms, and semaphores to support large, business-critical workloads.

