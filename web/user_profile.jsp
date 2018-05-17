<%-- 
    Document   : user_profile
    Created on : May 15, 2018, 4:17:31 PM
    Author     : GNyabuto
--%>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" sizes="96x96" href="assets/img/logo.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>SIMS System</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
<style>
   ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
    color: black;
    opacity: 10; /* Firefox */
    font-weight: bolder;
}

:-ms-input-placeholder { /* Internet Explorer 10-11 */
    color: black;
    font-weight: 900;
}

::-ms-input-placeholder { /* Microsoft Edge */
    color: black;
    font-weight: 900;
} 
  .flex-container {
  display: flex;
  flex-grow: 1;
}  
</style>
</head>
<body >

<div class="wrapper">
 <!--sidebar here-->
 <%@include file="sidebar.jsp" %>
    <div class="main-panel">
		<nav class="navbar navbar-default">
           <!--top menu here-->
           <%@include file="topmenu.jsp" %>
        </nav>

		<div class="content flex-container " >
            <div class="container-fluid "  style="width: 50%;">
                <!--<div class="card card-map"  style="background-color: lightgrey;">-->
                <!--<div class="row"  style="background-color: lightgrey;">-->
                         <div class="col-lg-12">
                    <div class="card ">
                    <div class="header" style="text-align: center;">
                        <h4 class="title"><strong>User Profile Management</strong></h4>
                    </div>
                        <div class="row" style=" padding: 20px 20px 20px 20px; "> 
                    <div class="col-md-12" style=""> 
                        <form id="" method="post" action="update_user" class="" > 
                           
                              <div class="form-group"> 
                               <div class="col-md-12" style="padding-top: 15px;"> 
                                    <input id="fullname" required name="fullname" type="text" value="" placeholder="Enter fullname" class="form-control border-input"> 
                                </div> 
                            </div> 
                            
                            
                              <div class="form-group"> 
                                <div class="col-md-12" style="padding-top: 15px;"> 
                                    <input id="email" required name="email" type="text" value="" placeholder="Enter Email" readonly class="form-control border-input"> 
                                </div> 
                            </div> 
                            
                           
                              <div class="form-group"> 
                                <div class="col-md-12" style="padding-top: 15px;"> 
                                    <input id="phone" required name="phone" type="text" value="" placeholder="Enter Phone" class="form-control border-input"> 
                                </div> 
                            </div> 
                            
                           
                              <div class="form-group"> 
                                <div class="col-md-12" style="padding-top: 15px;"> 
                                    <select id="gender" required name="gender" class="form-control border-input" required>
                                    <option value="f">Female</option>
                                    <option value="m">Male</option>
                                    </select> 
                                </div> 
                            </div> 
                            
                            
                              <div class="form-group"> 
                                <div class="col-md-12" style="padding-top: 15px;"> 
                                    <input id="pass1" required name="pass1" type="password" value="" placeholder="Enter Password"  oninput="checkPasswords()" class="form-control border-input"> 
                                </div> 
                            </div> 
                            
                           
                              <div class="form-group"> 
                                <div class="col-md-12" style="padding-top: 15px;"> 
                                    <input id="pass2" required name="pass2" type="password" value="" placeholder="Repeat Password"  oninput="checkPasswords()" class="form-control border-input"> 
                                </div> 
                            </div> 
                            
                            
                              <div class="form-group" style="text-align: right;"> 
                                <div class="col-md-12" style="padding-top: 15px; padding-bottom: 15px;"> 
                                    <input id="" required name="" type="submit" value="Update Profile" placeholder="Repeat Password" class="btn btn-success btn-flat m-b-30 m-t-30"> 
                                </div> 
                            </div> 
                            
                         </form> 
                    </div> 
                    </div>
                    </div>
                  <!--</div>-->


                <!--</div>-->

				</div>
			</div>
		</div>

		<!--footer here-->
                <%@include file="footer.jsp" %>
    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>
	<script src="assets/js/chartist.min.js"></script>
        <script src="assets/js/bootstrap-notify.js"></script>
	<script src="assets/js/demo.js"></script>

            <script type="text/javascript">
    
            function checkPasswords() {
                var password = document.getElementById('pass1');
                var conf_password = document.getElementById('pass2');

                if (password.value != conf_password.value) {
                    conf_password.setCustomValidity('Passwords do not match');
                } else {
                    conf_password.setCustomValidity('');
                }
                
          
        
            }
    
    </script>
	<script>
   $(document).ready(function() {
} ); 
    </script>
    
    <%if(session.getAttribute("message")!=null && session.getAttribute("code")!=null){
    String message = session.getAttribute("message").toString();
    String code =  session.getAttribute("code").toString();
    String theme="";
    if(code.equals("1")){
     theme="bg-success" ;  
    }
    else{
     theme="bg-danger";   
    }
    %>
     <script type="text/javascript">
     $.jGrowl('<%=message%>', {
        position: 'top-center',
        header: 'info',
        theme: '<%=theme%>'
     });
    </script>
    <% 
        session.removeAttribute("message");
        session.removeAttribute("code");}
    %>
    
    <script>
   $(document).ready(function() {
        load_users();
    });
    
    function load_users(){
            $.ajax({
        url:'load_profile',
        type:"post",
        dataType:"json",
        success:function(raw_data){
            var position=0,id,fullname,email,phone,level,level_label,status,status_label,gender,gender_label,output="";
             var dataSet=[];
        var data=raw_data.data;
            position++;
            id=fullname=email=phone=level=level_label=status=status_label=gender=gender_label="";
            if( data.fullname!=null){fullname = data.fullname;}
            if( data.email!=null){email = data.email;}
            if( data.phone!=null){phone = data.phone;}
            if( data.level!=null){level = data.level;}
            if( data.status!=null){status = data.status;}
            if( data.gender!=null){gender = data.gender;}
            
            if(gender=="m"){
               gender_label = '<option value="f">Female</option> '; 
               gender_label += '<option value="m" selected>Male</option> '; 
            }
            else if(gender=="f"){
             gender_label = '<option value="f" selected>Female</option> '; 
             gender_label += '<option value="m">Male</option> '; 
            }
            else{
             gender_label = '<option value="">Select Gender</option> '; 
             gender_label += '<option value="f">Female</option> '; 
             gender_label += '<option value="m">Male</option> ';     
            }
            $("#fullname").val(fullname);
            $("#email").val(email);
            $("#phone").val(phone);
            $("#gender").html(gender_label);

    }
    });
    }

    </script>

</html>
