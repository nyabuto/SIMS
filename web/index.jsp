<%-- 
    Document   : index
    Created on : May 15, 2018, 2:17:41 PM
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
    <link href='http://fonts.googleapis.com/css?family=Berkshire+Swash' rel='stylesheet' type='text/css'>
<style>
.login-logo {
font: 200 70px/1.2 'Berkshire Swash', Helvetica, sans-serif;
  color: #2b2b2b;
  /*text-shadow: 1px 1px 0px #ededed, 4px 4px 0px rgba(0,0,0,0.15);*/
  text-shadow: 1px 1px 0px rgba(0,0,0,0.1);
}
.login-form{
    padding:  80px 50px 80px 50px;
}
.flex-container {
  display: flex;
  flex-grow: 20;
}
</style>
</head>
<body style="background-color: lightgrey;">
   <div class="content flex-container" style="margin-top: 10%; align-content: center;">
       <div class="container-fluid">
                <div class="row" >
                    <div class="col-lg-12 col-md-12">
                    <div class="card card-user">
                        <div class="image" style="background-color: graytext; height: 50%;">
                           <div class="form-group login-logo" style="text-align: center; margin-top: 5%; padding: 10px 23px 0 23px;">SIMS Facility Master Tool</div>                 
                        </div>
                       <div class="login-form">
                           <form action="login" method="post">

                               <div class="form-group">
                                   <label>Username</label>
                                   <input type="text" name="email" id="email" class="form-control border-input" placeholder="Email">
                               </div>
                               <div class="form-group">
                                   <label>Password</label>
                                   <input type="password" name="password" id="password" class="form-control border-input" placeholder="Password">
                               </div>

                               <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30" >Login</button>

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
