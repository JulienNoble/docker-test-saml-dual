# Docker Test SAML 2.0 dual SP and IdP

Docker container with a plug and play SAML 2.0 Identity Provider (IdP) and
Service Provider (SP) for development and testing.

## Abstract

![UGH](https://media.giphy.com/media/w2ZXRlkkiNflm/giphy.gif)

I got tired of configuring separate containers with largely outdated forks of
the original repo, and while looking at SimpleSAMLphp's documentation, I saw
that they litterally recommend you to have the SP and the IdP configured on the
same machine.

So I
[forked Kristoph Junge's original IdP container](https://github.com/kristophjunge/docker-test-saml-idp)
to fit my needs and basically setup a really basic SP and IdP dev environment.
[This magnificient stackoverflow thread](https://stackoverflow.com/questions/44106971/configuring-simplesamlphp-idp-and-sp-in-the-same-box)
also helped a lot.

This is a kind of specific base setup for the project I'm using it on. A lot of
settings have become static, including entity id and urls. I encourage you to
fork it and use it as a base for your dev env needs.

## Technicals

Built with [SimpleSAMLphp](https://simplesamlphp.org). Based on official PHP7
Apache [images](https://hub.docker.com/_/php/).

**Warning!**: Do not use this container in production! The container is not
configured for security and contains static user credentials and SSL keys.

SimpleSAMLphp is logging to stdout on debug log level. Apache is logging error
and access log to stdout.

The contained version of SimpleSAMLphp is 1.15.4.

## Changelog

See [CHANGELOG.md](docs/CHANGELOG.md) for information about the latest changes.

## Usage

```
docker build -t JulienNoble/testsaml-dual .
docker run --name=testsaml-dual \
    -p 8443-8444:8443-8444 \
    -d JulienNoble/testsaml-dual
```

There are two static users configured in the IdP with the following data:

| UID | Username | Password  | Group  | Email             |
| --- | -------- | --------- | ------ | ----------------- |
| 1   | user1    | user1pass | group1 | user1@example.com |
| 2   | user2    | user2pass | group2 | user2@example.com |

The name of the SP is `default-SP`, for lack of inspiration.

The certificate is evidently not valid (same as original repo), but necessary
since I removed insecure http access (because nobody in their right mind does
http auth in 2018).

You can access the SimpleSAMLphp web interface of the SP under
`https://localhost:8444/simplesaml`. The admin password is `secret`.

You can access the SimpleSAMLphp web interface of the IdP under
`https://localhost:8444/simplesaml-idp`. There is no admin.

## Contributing

See [CONTRIBUTING.md](docs/CONTRIBUTING.md) for information on how to contribute
to the project.

See [CONTRIBUTORS.md](docs/CONTRIBUTORS.md) for the list of contributors.

## License

This project is licensed under the MIT license by Kristoph Junge and Julien
Noble.
