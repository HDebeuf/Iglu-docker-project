<?php
require_once('/var/www/wordpress/public_html/wp-config.php' );

// database might not exist, so let's try creating it (just to be safe)
$stderr = fopen('php://stderr', 'w');

do {
	echo "TRY CONNECT...";
	$mysql = new mysqli('databasehost', 'databaseusername', 'databaseuserpassword', 'databasename');
	if ($mysql->connect_error) {
		fwrite($stderr, "\n" . 'MySQL Connection Error: (' . $mysql->connect_errno . ') ' . $mysql->connect_error . "\n");
		echo "DATABASE NOT READY";
		sleep(3);
	} else {
		echo "DATABASE READY";
    $user_id = wp_create_user( 'thewebmasterlogin', 'thewebmasterpassword', 'thewebmasterlogin@thewebsiteurl' );
    update_user_meta( $user_id, 'wp_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}');
    update_user_meta( $user_id, 'wp_user_level', '10');

    $mysql->close();
    exit(1);
  }
} while ($mysql->connect_error);

?>
