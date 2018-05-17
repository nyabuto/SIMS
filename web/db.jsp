<%-- 
    Document   : db
    Created on : May 15, 2018, 3:15:29 PM
    Author     : GNyabuto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SIMS Facility Master Tool</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" sizes="96x96" href="assets/img/logo.png">

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

     <link href='http://fonts.googleapis.com/css?family=Oleo+Script' rel='stylesheet' type='text/css'>
<style>
.login-logo {
   font: 400 50px/1.0 'Oleo Script', Helvetica, sans-serif;
  color: #2b2b2b;
  text-shadow: 1px 1px 0px rgba(0,0,0,0.1);
}
.login-form{
    /*padding:  80px 50px 80px 50px;*/
}
.flex-container {
  display: flex;
  flex-grow: 20;
}
</style>
</head>
<body  style="background-color: lightgrey;">
		
     <div class="content flex-container" style="margin-top: 6%; align-content: center;">
       <div class="container-fluid">
                <div class="row" >
                    <div class="col-lg-12 col-md-12">
                    <div class="card card-user">
                       <div class="login-form">
                           <form action="dbsetup" method="post">
						<div class="panel panel-body login-form">
							<div class="text-center header">
                            <div class="form-group login-logo" style="text-align: center;padding: 10px 23px 0 23px;">SIMS Facility Master Tool</div>  
                           <h4 style="font-weight: bolder;" class="content-group">Database setup</h4>
							</div>

							<!--<div class="form-group ">-->
                                                        <div class="form-group">
                                                                <label><b>Host Name: </b></label>
                                                                <input id="hostname" type=text required name="hostname" placeholder="e.g localhost:3306" value="localhost:3306" class="form-control border-input" >
                                                            </div>
                                                            
                                                        
                                                          <div class="form-group">
                                                                <label><b>Database: </b></label>
                                                                <input id="database"  type=text required name="database" value="sims"  class="form-control border-input" placeholder="SIMS system">
                                                            </div>
                                                        
                                                        
                                                          <div class="form-group">
                                                                <label><b>Username: </b></label>
                                                                <input id="user"  type=text required name="user" class="form-control border-input" value="root" placeholder="e.g root"  >
                                                            </div>
                                                        
                                                        
                                                          <div class="form-group">
                                                                <label><b>Password: </b></label>
                                                                <input id="password"  type=password  name="password" placeholder="Password" class="form-control border-input">
                                                            </div>
                                                        <div class="form-group">
								<button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30"><b>Update Connection</b> <i class="icon-arrow-right14 position-right"></i></button>
							</div>
                                                        </div>
					</form>
                       </div>
                        <div style="text-align: right; padding: 0 20px 10px 0;"> Version 3.0 </div>  
                        </div>
                                </div>
                            </div>
                        </div>
                        </div>
    
	    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/bootstrap-notify.js"></script>
</body>
</html>
