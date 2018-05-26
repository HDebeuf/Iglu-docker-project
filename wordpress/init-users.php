<?php
require_once('/var/www/wordpress/public_html/wp-config.php' );

// database might not exist, so let's try creating it (just to be safe)
$stderr = fopen('php://stderr', 'w');
$cdbconnected = false;
do {
	echo "TRY CONNECT...";
	try {
		$mysql = new mysqli('databasehost', 'databaseusername', 'databaseuserpassword', 'databasename');
		$cdbconnected = true;
		echo "DATABASE READY";
	} catch (\Exception $e) {
		fwrite($stderr, "\n" . 'MySQL Connection Error: (' . $mysql->connect_errno . ') ' . $mysql->connect_error . "\n");
		echo "DATABASE NOT READY";
		sleep(3);
	}
} while (!$cdbconnected);


$user_id = wp_create_user( 'thewebmasterlogin', 'thewebmasterpassword', 'thewebmasterlogin@thewebsiteurl' );
update_user_meta( $user_id, 'wp_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}');
update_user_meta( $user_id, 'wp_user_level', '10');

$mysql->close();
exit(1);

?>
