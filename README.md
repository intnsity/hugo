# Deploying a Hugo Site using Docker

## Site setup from scratch
Assemble the Hugo site using a theme and using Hugo's default initialization command
```
hugo new site my_new_site
```
Specifically, using the Docker containers, cd to the docker container directory for hugo (where the docker-compose.yml lives and where your folders for the container live). Create a new site with a name matching our volume name in docker-compose.yml:

docker-compose.yml volumes

```
volumes:
    - ./hugo-site:/src
    - ./public:/target
```
new site command
```
hugo new site hugo-site
```

## Hugo Blowfish theme
https://blowfish.page/

theme installation:
https://blowfish.page/docs/installation/

theme initial setup:
https://blowfish.page/docs/getting-started/


## Build the site after making content changes

Make content changes inside hugo-site/content/

Run hugo
```
hugo
```

cd to your hugo docker container folder, copy the contents of hugo-site/public* to public/
```
cp -r hugo-site/public/* public*
```