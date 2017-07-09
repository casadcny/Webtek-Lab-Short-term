<?php
session_start();

if($_SESSION['loggedIn'] != true){
	header('Location: login.php');
	exit;
}

$con = mysqli_connect("localhost", "root", "", "friend");
$users = mysqli_query($con, "select * from users where id <> '".$_SESSION['userId']."'");

while($row = mysqli_fetch_assoc($users)) {
	echo '<a href="/request.php?id='.$row['id'].'"><h2>'.$row['user']. '</h2></a>';
}

?>