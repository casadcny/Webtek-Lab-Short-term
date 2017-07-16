<?php
	ob_start();
	session_start();
	require('connect.php');

	// it will never let you open index(login) page if session is set
	if ( isset($_SESSION['user'])!="" ) {
		header("Location: home.php");
		exit;
	}

	$error = false;

	if( isset($_POST['btn-login']) ) {

		// prevent sql injections/ clear user invalid inputs
		$username = trim($_POST['username']);
		$username = strip_tags($username);

		$password = trim($_POST['password']);
		$password = strip_tags($password);
		// prevent sql injections / clear user invalid inputs


		// if there's no error, continue to login
		if (!$error) {

			$res=mysqli_query($conn,"SELECT idno, username, password FROM user WHERE username='$username' && type = 'admin'");
			$row=mysqli_fetch_array($res);
			$count = mysqli_num_rows($res); // if uname/password correct it returns must be 1 row

			if( $count == 1 && $row['password']==$password ) {
				$_SESSION['user'] = $row['idno'];
				header("Location: home.php");
			} else {
				$errMSG = "Incorrect Credentials, Try again...";
			}

		}

	}
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ADIDAS</title>
<link rel="stylesheet" href="assets/css/bootstrap.css" type="text/css"  />
<link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body>

<nav class="navbar navbar-inverse" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="navbar">
      <ul class="nav navbar-nav">
        <li><a href="#"></a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="container">

	<div id="login-form">
    <form method="post">

    	<div class="col-md-12">

        	<div class="form-group">
            	<h2 class="">Sign In.</h2>
            </div>

        	<div class="form-group">
            	<hr />
            </div>

            <?php
			if ( isset($errMSG) ) {

				?>
				<div class="form-group">
            	<div class="alert alert-danger">
				<span class="glyphicon glyphicon-info-sign"></span>
                </div>
            	</div>
                <?php
			}
			?>

            <div class="form-group">
            	<div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
            	<input type="text" name="username" class="form-control" placeholder="Your username" value="<?php echo $username; ?>" maxlength="40" required/>
                </div>
            </div>

            <div class="form-group">
            	<div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
            	<input type="password" name="password" class="form-control" placeholder="Your password" maxlength="15" required />
                </div>
            </div>

            <div class="form-group">
            	<hr />
            </div>

            <div class="form-group">
            	<button type="submit" class="btn btn-block btn-primary" name="btn-login">Sign In</button>
            </div>

            <div class="form-group">
            	<hr />
            </div>

            </div>

    </form>
    </div>

</div>
</body>
</html>
<?php ob_end_flush(); ?>
