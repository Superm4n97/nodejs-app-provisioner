# nodejs-app-provisioner
### Use
- To deploy the architecture
    ```bash
    terraform apply
    ```
- Copy the Kubeconfig from output
- Go to `nodejs-app` repository and create a secret naming `KUBECONFIG`
- Paste the output kubeconfig as the secret value and save the secret
