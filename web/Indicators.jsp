<%-- 
    Document   : Indicators
    Created on : May 15, 2018, 4:17:14 PM
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

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">

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
                                            <h4 class="title" style="text-align: center;"><b style="text-decoration: underline;">SIMS Assessment Sections</b></h4>
                    </div>
		                                     <div class="row">
		                                    <div class="col-sm-12 col-sm-offset-0">
                                                            <table class="table table-hover">
                                                                <thead>
                                                            <th style="text-align: center; font-weight: bolder;">No</th>
                                                            <th style="text-align: center; font-weight: bolder;">Section Code</th>
                                                            <th style="text-align: center; font-weight: bolder;">Section Title</th>
                                                            <th style="text-align: center; font-weight: bolder;">Indicator Code</th>
                                                            <th style="text-align: center; font-weight: bolder;">Indicator Question</th>
                                                            <th style="text-align: center; font-weight: bolder;">Status</th>
                                                        </thead>
                                                        <tbody id="tdata">
                                                          
                                                            </tbody>
                                                        </table>
		                                    </div>
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
        <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>
	<script src="assets/js/chartist.min.js"></script>
    <script src="assets/js/bootstrap-notify.js"></script>
    
            <script type="text/javascript">
           
        $(document).ready(function() {
        load_indicators();
        });
    
    function load_indicators(){
            $.ajax({
        url:'load_indicators',
        type:"post",
        dataType:"json",
        success:function(raw_data){
            var position=0,indicator_id,area_code,area_title,indicator_code,indicator_question,is_active,status,output="";
        var data=raw_data.data;
            indicator_id=area_code,area_title=indicator_code=indicator_question=status="";is_active=0;
            for(var i=0;i<data.length;i++){
                position++;
            if( data[i].indicator_id!=null){indicator_id = data[i].indicator_id;}
            if( data[i].area_code!=null){area_code = data[i].area_code;}    
            if( data[i].area_title!=null){area_title = data[i].area_title;}    
            if( data[i].indicator_code!=null){indicator_code = data[i].indicator_code;}    
            if( data[i].indicator_question!=null){indicator_question = data[i].indicator_question;}     
            if( data[i].is_active!=null){is_active = data[i].is_active;}  
            if(is_active==1){
             status="<label class='form-control' style='background-color:green; color:white;'>Active</label>";   
            }
            else{
             status="<label class='form-control'>Inactive</label>";   
            }
            
            
            output += "<tr><td>"+position+"</td><td>"+area_code+"</td><td>"+area_title+"</td><td>"+indicator_code+"</td><td>"+indicator_question+"</td><td>"+status+"</td></tr>";
         }
            $("#tdata").html(output);
           
    }
    });
    } 
</script>
</html>

