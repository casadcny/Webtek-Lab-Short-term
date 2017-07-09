<?php
session_start();
if($_SESSION['loggedIn'] != true){
	header('Location: login.php');
	exit;
}
$requesteeId = $_GET['id'];

$con = mysqli_connect("localhost", "root", "", "friend");
mysqli_query($con, "INSERT INTO requests (resquestee, requester) VALUES ('".htmlspecialchars($requesteeId)."', '".htmlspecialchars($_SESSION['userId'])."')");

echo "request sent<br >";
echo '<a href="/">Home</a>';
