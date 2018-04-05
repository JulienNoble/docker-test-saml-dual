<?php
/**
 * SAML 2.0 remote SP metadata for SimpleSAMLphp.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-sp-remote
 */

$metadata['https://localhost:8444/simplesaml-idp/saml2/idp/metadata.php'] = array(
    'name' => array(
            'en' => 'Remote IdP',
            'no' => 'Suchindra Chandrahas',
    ),
    'description'          => 'SP and IdP in the same machine',

    'SingleSignOnService'  => 'https://localhost:8444/simplesaml-idp/saml2/idp/SSOService.php',
    'SingleLogoutService'  => 'https://localhost:8444/simplesaml-idp/saml2/idp/SingleLogoutService.php',
    'privatekey' => 'server.pem',
    'certificate' => 'server.crt',
);
