<?php
	ob_start();
	session_start();
	require('connect.php');
	
	
	$page =$_SERVER['PHP_SELF'];
	$sec = ('10');
	header("Refresh: $sec; url=$page");


	// if session is not set tdis will redirect to login page
	if( !isset($_SESSION['user']) ) {
		header("Location: index.php");
		exit;
	}
	// select loggedin users detail
	$res=mysqli_query($conn,"SELECT * FROM user WHERE idno=$_SESSION[user]");

	$userRow=mysqli_fetch_assoc($res);
	
?>
<!DOCTYPE html>
<html>
<head>
<title>Welcome<?php echo "$userRow[firstname]"; ?></title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand"></a>
	    </div>

	    <div class="collapse navbar-collapse" id="navbar">
	      <ul class="nav navbar-nav">
	        <li><a href="#"><strong>ADIDAS</strong></a></li>
	        <li><a href="#"></a></li>
      
					<form action="search.php" class="navbar-form navbar-right" method="POST" enctype="multipart/form-data">
			              <div class="input-group">
			                 <input type="search" placeholder="Search User...." class="form-control" name="search">
			                 <div class="input-group-btn">
			                     <button class="btn btn-default" name= "button">
			                        <span class="glyphicon glyphicon-search"></span>
			                     </button>
			                 </div>
			             </div>
			            </form>
	      </ul>

				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
			<span class="glyphicon glyphicon-user">
            </span>&nbsp;Hi <?php echo $userRow['firstname']; ?>&nbsp;<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logout.php?logout"><span class="glyphicon glyphicon-log-out"></span>Sign Out</a></li>
						</ul>
					</li>
				</ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>

	<div id="wrapper">
	<div class="container">
    	<div class="page-header">
		<br>
    	<h2><center><b>ADIDAS ADMIN</b></center></h2>
    	</div>
			
			<?php
        $sql = mysqli_query($conn,"SELECT * from user where type ='user'");
        
        if($sql->num_rows > '1'){
            
			echo "<table class='table table-striped table-bordered table-hover id='dataTables-example';>";
 			
			echo "
					<tr>
					<td>ID Number</td>
					<td>Username</td>
					<td>Password</td>
					<td>First Name</td>
					<td>Last Name</td>  
                    <td>Status</td>
					<td>Type</td>
                    <td>Action</td>
					
				</tr>	
				";
            
            while($row = mysqli_fetch_assoc($sql)){
                $idno = $row['idno'];
                $username = $row['username'];
                $lastname = $row['lastname'];
                $firstname = $row['firstname'];
                $pass = $row['password'];
                $status = $row['status'];
				$type = $row['type'];
                echo"
                <tr>
                    <td>$idno</td>
                    <td>$username</td>
                    <td>$pass</td>
                    <td>$firstname</td>
                    <td>$lastname</td>
                    <td> $status</td>
					<td> $type</td>
                    <td>
                    <form action='changeStatus.php' method='POST'>
                    <button class='btn-primary' value='$idno,approve' name='approve'>Approved</button>
                    <button class='btn-danger' value='$idno' name='block'>Block</button>
                    </form>
                    </td>
                    
                </tr>    
                
                
                
                
                ";
            }
        }
	
//class TableRows extends RecursiveIteratorIterator { 
//    function __construct($it) { 
//        parent::__construct($it, self::LEAVES_ONLY); 
//    }
//
//    function current() {
//        return "<td style='border: 1px solid black;'>" . parent::current(). "</td>";
//    }
//
//    function beginChildren() { 
//        echo "<tr>"; 
//    } 
//
//    function endChildren() { 
//        echo "</tr>" . "\n";
//    } 
//} 

//$servername = "localhost";
//$username = "root";
//$password = "";
//$dbname = "socialnetwork";

//try {
//    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
//    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//    $stmt = $conn->prepare("SELECT * FROM user order by idno"); 
//    $stmt->execute();
//
//    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
//
//    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) { 
//        echo $v;
//    }
//}
//catch(PDOException $e) {
//    echo "Error: " . $e->getMessage();
//}
//$conn = null;
//echo "</table>";
?> 
        
<!--
<form action = "changeStatus.php" method = "POST">
<input type = "hidden" name = "status" value="<?php echo $rows['status']?>">      
<input type = "hidden" name = "idno" value="<?php echo $rows['idno']?>">    
-->
    
<?php
//    if(strcasecmp($rows['user'], 'user')==0){
//        if(strcasecmp($rows['status'], 'pending')==0) {
//            echo '<td>';
//            echo '<button type="submit" class="btn-default" name="userAction">Approve</button>';
//            echo '<td>';
//        }else {
//            echo '<td>';
//            echo '<button type="submit" class="btn-default" name="userAction">Block</button>';
//            echo '<td>';
//        }
//    }else{
//        
//    }
    ?>
<!--
</form>
        

		</div>

		</div>
		
-->

    <script src="assets/jquery-1.11.3-jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
