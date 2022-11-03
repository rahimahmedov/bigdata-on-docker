* run compose using only <b>docker-compose-v1.exe</b>: 

    `docker-compose-v1.exe -f services.yml up -d`

* disable winnat: 

    `net stop winnat`

* convert EOL to UNIX EOL on entrypoint.sh scripts