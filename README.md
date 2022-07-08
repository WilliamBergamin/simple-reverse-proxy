# simple-reverse-proxy

This project is a simple [nginx server](https://www.nginx.com/resources/glossary/nginx/) set up as a reverse proxy to perform ssl cert for a project deployed locally.

*NOTE* this project was only tested on mac

## how to use

### Install nginx
If you already have nginx installed you can skip these steps


1. Ensure you have [brew](https://brew.sh/) installed
2. Run `brew install nginx` to install nginx using brew 

### Run proxy

1. Configure ssl, create 3 file in the `./ssl` folder, look at the `.example` files for help *these are the certificate nginx will use*
   1. `ssl/cert.pem`
   2. `ssl/privkey.pem`
   3. `ssl/client_root.crt`
2. Run the following command to start the nginx server, it listens to default http port 443
    ```bash
    bash ./start <exposed_port> 

    # Example my project is running on port 3000
    bash ./start 3000
    ```
3. A config file will be generate `./tmp/nginx.conf` this is the file nginx uses to configure itself as a reverse proxy able to perform ssl cert
