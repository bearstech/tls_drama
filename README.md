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

### Python

    python3 connect.py 192.168.59.103

Different version of python

 * Python 2.7.6 + OpenSSL 0.9.8 : *KO*
 * Python 2.7.8 + OpenSSL 1.0.1j : *KO*
 * Python 2.7 HEAD + OpenSSL 1.0.1j: *OK*
 * Python 3.4.2 + OpenSSL 1.0.1j: *OK*

So, there will be an official 2.7.9 python release.
Pray for your package maintener to consider it as a secure patch,
not a new version for the futur stable release.
Or just become modern, use Python 3.

### OpenSSL

You can try with your openssl too :

    openssl s_client -connect 192.168.59.103:2103 -tls1

Old opennssl will crash without explicit -tls1 option, new one handle it well

### Nodejs

Nodejs does not age, its TLS API is correct, but elliptic curves are missing.

    node connect.js 192.168.59.103

### Ruby

I should try with Ruby.

Ugly certificate
----------------

The same certificate is used for client and server side, and I gave you a private key.
NOBODY SHOULD DO THAT.

But it's just a POC and life is short.

Licence
=======

3 terms BSD licence, © 2014 Mathieu Lecarme.
