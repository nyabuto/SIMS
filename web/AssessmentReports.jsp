<%-- 
    Document   : Indicator_Score
    Created on : May 21, 2018, 11:51:53 AM
    Author     : GNyabuto
--%>
<!doctype html>
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
    <link href="wizard/assets/css/paper-bootstrap-wizard.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/chosen/chosen.css">
    
</head>
<body>

<div class="wrapper">
 <!--sidebar here-->
 <%@include file="sidebar.jsp" %>
    <div class="main-panel">
		<nav class="navbar navbar-default">
           <!--top menu here-->
           <%@include file="topmenu.jsp" %>
        </nav>

		<div class="content">
            <div class="container-fluid">
                <div class="card card-map">
					<div class="header">
                        <h4 class="title">Generate Excel Report</h4>
                    </div>
			 <div class="row">
		        <div class="col-sm-12">

                                    <form action="assessment_reports" method="post">
                                        
                                           
                                                    <div class="col-sm-5">
		                                    	<div class="form-group">
		                                        	<label>Assessment Start Date<font color="red">*</font></label>
		                                        	<div class="input-group">
		                                            	<input type="date" required id="start_date" name="start_date" class="form-control" placeholder="Assessment Start Date">
		                                            	<span class="input-group-addon"></span>
                                                                </div>
		                                    	</div>
		                                	</div>
                                        
                                           
                                                    <div class="col-sm-5">
		                                    	<div class="form-group">
		                                        	<label>Assessment End Date<font color="red">*</font></label>
		                                        	<div class="input-group">
		                                            	<input type="date" required id="end_date" name="end_date" class="form-control" placeholder="Assessment End Date">
		                                            	<span class="input-group-addon"></span>
                                                                </div>
		                                    	</div>
		                                	</div>
                                        
                                        <div class="col-sm-2  col-sm-offset-8">
		                                    	<div class="form-group">
		                                        	<label></label>
                                                                <div class="input-group" style="text-align: right;">
		                                            	<input type="submit" value="Generate Report"  class="btn btn-success btn-flat m-b-30 m-t-30" placeholder="">
                                                                </div>
		                                    	</div>
		                                	</div>
                                    </form>
				
                        </div>
                         </div>
			</div>
		</div>

		<!--footer here-->
                <%@include file="footer.jsp" %>
    </div>
</div>


</body>

    	<!--   Core JS Files   -->
	<script src="wizard/assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="wizard/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="wizard/assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
        
        <!--  Notifications Plugin    -->
        <script src="assets/js/bootstrap-notify.js"></script>
    
	<!--  Plugin for the Wizard -->
	<script src="wizard/assets/js/paper-bootstrap-wizard.js" type="text/javascript"></script>

	<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="wizard/assets/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="assets/js/chosen/chosen.jquery.min.js"></script>
</html>
