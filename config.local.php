<?php

// Kopieret fra config.inc.php
$CONF['configured'] = true;
$CONF['setup_password'] = 'changeme';
$CONF['used_quotawarn'] = 'YES';
$CONF['quota'] = 'YES';
$CONF['domain_path'] = 'YES';
$CONF['domain_in_mailbox'] = 'NO';
$CONF['fetchmail'] = 'NO';
$CONF['sendmail'] = 'NO';
$CONF['vacation'] = 'YES';
$CONF['alias'] = 'YES';
$CONF['backup'] = 'NO';
$CONF['logging'] = 'YES';
$CONF['show_footer_text'] = 'NO';
$CONF['footer_text'] = 'Return to {link:http://www.example.com}[Example.com]';
$CONF['show_image_version'] = 'YES';
$CONF['show_server_name'] = 'YES';
$CONF['show_title_text'] = 'YES';
$CONF['title_text'] = 'Postfix Admin';
$CONF['default_aliases'] = array (
  'abuse' => 'postmaster',
  'hostmaster' => 'postmaster',
  'postmaster' => 'postmaster',
  'webmaster' => 'postmaster',
);
$CONF['database_type'] = 'mysqli';
$CONF['database_host'] = 'localhost';
$CONF['database_user'] = 'postfixadmin';
$CONF['database_password'] = 'DIT_PASSWORD';
$CONF['database_name'] = 'postfixadmin';

?>
