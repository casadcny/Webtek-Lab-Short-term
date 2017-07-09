<?php
?>

<html>
<head>
<title>Messages</title>
    
    <script>
      function submitChat(){
          if(form1.uname.value == '' || form1.msg.value == ''){
              alert('ALL FIELDS ARE MANDATORY');
              return;
          }
          form1.uname.readOnly = true;
          form1.uname.style.border = 'none';
          $('#imageload').show();
          var uname = form1.uname.value;
          var msg = form1.msg.value;
          var xmlhttp = new XMLHttpRequest();
          
          xmlhttp.onreadystatechange = function(){
              if(xmlhttp.readyState==4&&xmlhttp.status=200){
                  document.getElementById('chatlogs').innerHTML = xmlhttp.responseText;
              }
          }
          xmlhttp.open('GET', 'insert.php', true);
          xmlhttp.send();
      }  
        
      $(document).ready(function(e)){
            $.ajaxSetup({cache:false});
            setInterval(function{}{$(#chatlogs).load(logs.php);}, 2000);
      } 
    
    </script>

</head>
    
<body>
<form name="form1">
Enter Your ChatName: <input type="text" name="uname" style="width:200px;"/><br />
Your message: <br />
<textarea name="msg"></textarea><br />
<a href="#" onclick="">Send</a><br /><br />
    
<div id="imageload" style="display:none;">
<img src="1-0.gif"    
</div>

<div id="chatlogs">
LOADING MESSAGES...    
</div>
    
    
    
</body>
</html>