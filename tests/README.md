<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Activepieces, verified and packaged by Elestio

[Activepieces](https://github.com/activepieces/activepieces) is a no-code workflow builder, designed to be extensible through a strongly typed pieces framework written in Typescript.

<img src="https://github.com/elestio-examples/activepieces/raw/main/activepieces.png" alt="activepieces" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/activepieces">fully managed Activepieces</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you want automated backups, reverse proxy with SSL termination, firewall, automated OS & Software updates, and a team of Linux experts and open source enthusiasts to ensure your services are always safe, and functional.

[![deploy](https://github.com/elestio-examples/activepieces/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/activepieces)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/activepieces.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Create data folders with correct permissions

    mkdir -p ./postgres_data
    mkdir -p ./redis_data

    chown -R 1000:1000 ./postgres_data
    chown -R 1000:1000 ./redis_data

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:8284`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: '3.3'
    services:
    activepieces:
        image: elestio4test/activepieces:${SOFTWARE_VERSION_TAG}
        container_name: activepieces
        restart: unless-stopped
        privileged: true
        ports:
        - '3000:3000'
        - '8284:80'
        depends_on:
        - postgres
        - redis
        env_file: .env
    postgres:
        image: 'postgres:14.4'
        container_name: postgres
        restart: unless-stopped
        environment:
        - 'POSTGRES_DB=${AP_POSTGRES_DATABASE}'
        - 'POSTGRES_PASSWORD=${AP_POSTGRES_PASSWORD}'
        - 'POSTGRES_USER=${AP_POSTGRES_USERNAME}'
        volumes:
        - './postgres_data:/var/lib/postgresql/data'
    redis:
        image: 'redis:7.0.7'
        container_name: redis
        restart: unless-stopped
        volumes:
        - './redis_data:/data'

# Maintenance

## Logging

The Elestio Activepieces Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://github.com/activepieces/activepieces">Activepieces Github repository</a>

- <a target="_blank" href="https://www.activepieces.com/docs/getting-started/introduction">Activepieces documentation</a>

- <a target="_blank" href="https://github.com/elestio-examples/activepieces">Elestio/activepieces Github repository</a>
