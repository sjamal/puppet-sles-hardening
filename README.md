# Puppet SLES Hardening

This repository provides an independent, enterprise-focused configuration management profile module engineered to apply security policies, host configurations, and memory performance settings across **SUSE Linux Enterprise Server (SLES 15)** operating environments.

## Scope of Configuration
This module targets infrastructure metrics necessary for high-capacity database systems (**IBM DB2**) and application spaces (**SAP Applications Ecosystems**). It isolates underlying core configuration variables from standard, multi-user workspace distributions.

## Architectural Layers Applied
- **System Access Controls (`manifests/system_access.pp`):** Implements non-interactive access controls, overrides unencrypted protocols, and coordinates system logging daemons.
- **Kernel-Level Infrastructure Protections (`manifests/kernel_tuning.pp`):** Applies parameter configurations to drop transport-layer network redirection vectors and manage logging for non-routable communication attempts.
- **Enterprise Workload Tuning (`manifests/workload_profile.pp` & `templates/sysctl_sles_sap.conf.erb`):** Adjusts translation buffer allocations, page management algorithms, and semaphores to support large, business-critical workloads.
- **Automated Validation Framework (`.azure-pipelines/puppet-validation-ci.yml`):** Continuous Integration quality assurance framework executing syntax checking, manifest layout linting, and dry-run parser syntax verification.

## Module Structure
- **manifests/init.pp:** Main execution profile for isolating and scaling security settings across SLES platforms.
