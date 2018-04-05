<?php
/**
 * SAML 2.0 remote SP metadata for SimpleSAMLphp.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-sp-remote
 */

$metadata['https://localhost:8443/simplesaml'] = array(
    'saml:SP',
    'host' => 'localhost:8443',
    'privatekey' => 'server.pem',
    'certificate' => 'server.crt',
);
