<?php
require("connect.php");
$approveid = explode(",",$_POST['approve']);
$blockid = $_POST['block'];
$sqlApprove = "UPDATE user SET status='approved' WHERE idno='$approveid[0]'"; 
$sqlBlock = "UPDATE user SET status='block' WHERE idno='$blockid'";


if(isset($approveid[1])){
$sql = mysqli_query($conn,$sqlApprove);

if($sql){
echo " success approve";
    header("location: home.php");
}else{
echo "failed";
}
}else{
$sql = mysqli_query($conn,$sqlBlock);


if($sql){
echo "Success block";
    header("location: home.php");
}else{
echo "Failed block";
}
}
?>
