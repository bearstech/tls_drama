TLS Drama
=========


Build it
--------

    docker build -t tls_drama .

Run it
------

    docker run -p 2103:2103 tls_drama

Test it
-------

Find your docker IP, localhost for linux user, $DOCKER_HOST for boot2docker user.

    python3 connect.py 192.168.59.103

You can try with your openssl too :

    openssl s_client -connect 192.168.59.103:2103 -tls1

Old opennssl will crash without explicit -tls1 option, new one handle it well
