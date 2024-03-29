<?php
define('FORCE_SSL_ADMIN', true);
if (strpos($_SERVER['HTTP_X_FORWARDED_PROTO'], 'https') !== false)
    $_SERVER['HTTPS']='on';

define( 'DB_NAME', getenv('WORDPRESS_DB_NAME') );
define( 'DB_USER', getenv('WORDPRESS_DB_USER') );
define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );
define( 'DB_HOST', getenv('WORDPRESS_DB_HOST') );

$table_prefix = getenv('WORDPRESS_TABLE_PREFIX');

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define('WP_REDIS_HOST', getenv('WP_REDIS_HOST'));
define('WP_REDIS_PORT', getenv('WP_REDIS_PORT'));
define('WP_REDIS_PASSWORD', getenv('WP_REDIS_PASSWORD'));

if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

define ('FS_METHOD', 'direct');
define ('FS_CHMOD_DIR', 0777);
define ('FS_CHMOD_FILE', 0777);

require_once ABSPATH . 'wp-settings.php';
