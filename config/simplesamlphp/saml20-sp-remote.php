<?php
/**
 * SAML 2.0 remote SP metadata for SimpleSAMLphp.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-sp-remote
 */

$metadata['https://localhost:8443/simplesaml/module.php/saml/sp/metadata.php/default-sp'] = array(
    'AssertionConsumerService'  => 'https://localhost:8443/simplesaml/module.php/saml/sp/saml2-acs.php/default-sp',
    'SingleLogoutService' => 'https://localhost:8443/simplesaml/module.php/saml/sp/saml2-logout.php/default-sp',
);
