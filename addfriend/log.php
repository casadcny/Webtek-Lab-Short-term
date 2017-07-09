<?php
session_start();
	
	if(isset($_POST['login'])) {
		$con = mysqli_connect("localhost", "root", "", "friend");
		$sql = mysqli_query($con, "select pass, id from users where user = '".htmlspecialchars($_POST['username'])."'");
		$result = mysqli_fetch_assoc($sql);
		var_dump($result);
		
		if(is_array($result)){
			if($_POST['password'] == $result['pass']) {
				$_SESSION['loggedIn'] = true;
				$_SESSION['userId'] = $result['id'];
				header('Location: /');
				exit;	
			}	
		}
	}

?>

<html>
<head>
	<title>Friends</title>
	</head>
<body>
<form action="" method="post">
<input type="text" name="username" placeholder="Username">
<input type="password" name="password" placeholder="Password">
<input type="submit" value="Login"	name="login">
</form>
</body>
</html>