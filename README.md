1. Install Docker.
2. Create `.env` file using `.env.dist` as template.
3. Run the containers from the repository root:
    ```bash 
        docker-compose up -d
    ```
4. After entrypoint scripts are done, the applications will be available on the specified ports of the host machine.