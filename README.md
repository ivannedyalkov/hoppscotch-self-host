## Hoppscotch Kubernetes Deployment

### 🎉 Acknowledgements & Respect 🎉

Heartfelt thanks and immense respect to the creators and contributors of [Hoppscotch](https://hoppscotch.io/)! 🚀🙏 Hoppscotch is a fantastic open-source API testing tool designed to enhance API development by making it effortless and enjoyable. If you appreciate using Hoppscotch, please consider obtaining an [Enterprise license](https://docs.hoppscotch.io/guides/articles/manage-an-enterprise-license-key) to support the diligent individuals behind it and ensure its continuous improvement and maintenance.

### Overview

This guide provides a streamlined deployment of Hoppscotch application version 2023.8.1 on Kubernetes, utilizing technologies such as Istio, Cert-Manager, Sealed Secrets, Kustomize, Skaffold, and Docker for resource orchestration, network management, secret management, configuration management, and containerization.

### Prerequisites

Ensure your Kubernetes cluster is equipped with the following:

1. **Kubernetes Cluster**: Ensure `kubectl` is configured for management.
2. **Istio**: Manage network traffic using VirtualService and Gateway resources.
3. **Cert-Manager**: Handle certificates and set up a `ClusterIssuer` for Let's Encrypt.
4. **Sealed Secrets Controller**: Manage Kubernetes secrets.
5. **Kustomize**: Manage and overlay Kubernetes configurations.
6. **Skaffold**: Automate the workflow for building and deploying the application.
7. **Docker**: Ensure Docker is installed for building images.

### ⚠️ Future Support Notice ⚠️

**No Planned Updates or Support**: This deployment setup for Hoppscotch has no planned updates or ongoing support for future versions. Developers and users are encouraged to fork, modify, and adapt this deployment setup according to their needs and subsequent Hoppscotch application updates.

## Disclaimer

This project is independently developed and is not officially associated or endorsed by the original Hoppscotch creators. It was crafted to facilitate the deployment of Hoppscotch version 2023.8.1 on Kubernetes with specific technologies and does not assure compatibility with future Hoppscotch versions.

For the original source code, official updates, and documentation, visit the [official Hoppscotch repository](https://github.com/hoppscotch/hoppscotch).

### License

This project is released under the [MIT License](LICENSE). Portions of this project are derived from the [Hoppscotch project](https://github.com/hoppscotch/hoppscotch), which is also open-source and available under the MIT License. A copy of the Hoppscotch MIT License is included in this repository.
