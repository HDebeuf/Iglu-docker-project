#!/usr/bin/env php
<?php
require_once('/var/www/localhost/htdocs/sys.includes.php');
$isError = true;
do {
  try {
    echo "TRY CONNECT...";
    $dbh = new PDO('mysql:host=databasehost;dbname=databasename', 'databaseusername', 'databaseuserpassword');
    $dbh->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_WARNING);
    $isError = false;
  } catch (\Exception $e) {
    echo "DATABASE NOT READY";
  }
  sleep(3);
} while ($isError);

echo "DATABASE READY";
$new_user = new UserActions();

$new_arguments = array(
            'id' => '',
            'username' => 'thewebmasterlogin',
            'password' => 'thewebmasterpassword',
            //'password_repeat' => $_POST['add_user_form_pass2'],
            'name' => 'thewebmasterlogin',
            'email' => 'thewebmasterlogin@thewebsiteurl',
            'role' => 9,
            'active' => 1,
            'max_file_size'	=> 0,
            'notify_account' => 1,
            'type' => 'new_user'
          );

$new_response = $new_user->create_user($new_arguments);

if (isset($new_response)) {
  /**
   * Get the process state and show the corresponding ok or error message.
   */
  switch ($new_response['query']) {
    case 1:
      $msg = 'User added correctly.';
      echo $msg;
    break;
    case 0:
      $msg = 'There was an error. Please try again.';
      echo $msg;
    break;
  }
}

update_chmod_timthumb();
update_chmod_emails();
chmod_main_files();

?>
