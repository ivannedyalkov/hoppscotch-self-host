# Database Restore Pod

This directory contains the Kubernetes manifest for a pod that is designed to assist in restoring the Hoppscotch PostgreSQL database from a backup stored in a Persistent Volume Claim (PVC).

## Overview

The `db-restore-from-backup.yaml` describes a pod that uses the `busybox` image, allowing you to access and inspect the contents of the `postgresql-backup-pvc`.
This pod can be particularly useful when you need to manually restore or verify backups.

## Usage

### Deploying the Restore Pod

1. Ensure your `kubectl` context is set to the desired cluster and namespace.

2. Deploy the restore pod:

```bash
kubectl apply -f db-restore-from-backup.yaml
```

### Accessing Backups

1. Exec into the deployed pod:

```bash
kubectl exec -it db-restore-from-backup -- /bin/sh
```

2. Once inside, navigate to the `/backups` directory:

```bash
cd /backups
```

Here, you can view or interact with the backups as needed.

### Removing the Restore Pod

Once you're done with the restoration or verification tasks, it's a good practice to remove the pod to maintain a clean environment:

```bash
kubectl delete pod db-restore-from-backup
```
