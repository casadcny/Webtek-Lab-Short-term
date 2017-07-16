<?php

ob_start();
require_once 'connect.php';


if(isset($_POST['button'])){

  $search=$_POST['search'];

  $query=mysqli_query($conn,"select * from user where firstname like '%{$search}%' || lastname like '%{$search}%' ");

if ($query->num_rows > 0) {
  while ($row = mysqli_fetch_assoc($query)) {
    echo "<tr><td>".$row['fistname']."</td><td></td><td>".$row['lastname']."</td></tr>";
	echo "<br>";
	echo "<a href = 'home.php'>" . "Back" . "</a>";
  }
}else{
    echo "No search Found<br><br>";
  }

}else{                          
  $query=mysqli_query("select * from user");

  while ($row = mysql_fetch_array($query)) {
    echo "<tr><td>".$row['firstname']."</td><td></td><td>".$row['lastname']."</td></tr>";
	echo "<br>";
	echo "<a href = 'home.php'>" . "Back" . "</a>";
  }
}

mysqli_close($conn);
?>