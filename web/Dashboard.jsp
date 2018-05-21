<%-- 
    Document   : Dashboard
    Created on : May 15, 2018, 3:59:19 PM
    Author     : GNyabuto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" sizes="96x96" href="assets/img/logo.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Dashboard</title>

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
       .DG {stroke: #086508;} 
       .LG {stroke: #33d933;} 
       .Y {stroke: yellow;} 
       .R {stroke: red;} 
        
        </style>
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
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-warning text-center">
                                            <i class="ti-bell"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>No. of Assessments</p>
                                           <div id="assessments"> 0</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-upload"></i> <a href="Assessment.jsp">Perform Assessment</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-success text-center">
                                            <i class="ti-wallet"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>Average Score</p>
                                            <div id="average_score"> 0</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-upload"></i> <a href="Assessment.jsp">Perform Assessment</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-danger text-center">
                                            <i class="ti-world"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>Counties Assessed</p>
                                          <div id="no_counties"> 0</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-upload"></i> <a href="Assessment.jsp">Perform Assessment</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-info text-center">
                                            <i class="ti-home"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>Facilities Assessed</p>
                                           <div id="no_facilities"> 0</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                         <i class="ti-upload"></i> <a href="Assessment.jsp">Perform Assessment</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                   <div class="row">
                    <div class="col-md-3">
                        <div class="card">
                            <div class="header">
                                <h4 class="title" id="section1">CEE#: F_1.01[001]</h4>
                                <p class="category">HIV Quality Management/Quality Improvement (QM/QI) System [ALL FACILITIES]</p>
                            </div>
                            <div class="content">
                                <canvas  id="area_1"  height="450" width="450" class="ct-chart ct-perfect-fourth"></canvas>

                                <div class="footer">
                                    <div class="chart-legend">
                                        <i class="fa fa-circle" style="color: #086508;"></i> D. Green
                                        <i class="fa fa-circle" style="color: #33d933;"></i> L. Green
                                        <i class="fa fa-circle" style="color: yellow;"></i> Yellow
                                        <i class="fa fa-circle " style="color: red;"></i> Red
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="header">
                                <h4 class="title" id="section2">CEE#: F_1.03[003] </h4>
                                <p class="category">Risk Reduction Counseling and Condom Availability [ALL FACILITIES]<br><br></p>
                            </div>
                            <div class="content">
                                <canvas id="area_2"  height="450" width="450"  class="ct-chart ct-perfect-fourth"></canvas>

                                <div class="footer">
                                    <div class="chart-legend">
                                         <i class="fa fa-circle" style="color: #086508;"></i> D. Green
                                        <i class="fa fa-circle" style="color: #33d933;"></i> L. Green
                                        <i class="fa fa-circle" style="color: yellow;"></i> Yellow
                                        <i class="fa fa-circle " style="color: red;"></i> Red
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                   
                    <div class="col-md-3">
                        <div class="card">
                            <div class="header">
                                <h4 class="title" id="section3">CEE#: F_1.09[009] </h4>
                                <p class="category">Data Quality Assurance [ALL FACILITIES]<br><br><br></p>
                            </div>
                            <div class="content">
                                <canvas id="area_3"  height="450" width="450"  class="ct-chart ct-perfect-fourth"></canvas>

                                <div class="footer">
                                    <div class="chart-legend">
                                        <i class="fa fa-circle" style="color: #086508;"></i> D. Green
                                        <i class="fa fa-circle" style="color: #33d933;"></i> L. Green
                                        <i class="fa fa-circle" style="color: yellow;"></i> Yellow
                                        <i class="fa fa-circle " style="color: red;"></i> Red
                                    </div>
                                     
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="header">
                                <h4 class="title" id="section4">'CEE#: F_2.11[031]</h4>
                                <p class="category">ART Monitoring [C&T GEN POP]<br><br><br></p>
                            </div>
                            <div class="content">
                                <canvas id="area_4"  height="450" width="450"  class="ct-chart ct-perfect-fourth"></canvas>

                                <div class="footer">
                                    <div class="chart-legend">
                                        <i class="fa fa-circle" style="color: #086508;"></i> D. Green
                                        <i class="fa fa-circle" style="color: #33d933;"></i> L. Green
                                        <i class="fa fa-circle" style="color: yellow;"></i> Yellow
                                        <i class="fa fa-circle " style="color: red;"></i> Red
                                    </div>
                                    
                                </div>
                            </div>
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

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	            <!--  Chart js -->
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

    <script>
        $().ready(function(){
         dashboard();
        });
        
        
            function dashboard(){
            $.ajax({
        url:'dashboard',
        type:"post",
        dataType:"json",
        success:function(raw_data){
            var assessments,average_score,no_counties,no_facilities;
             assessments=0,average_score=0,no_counties=0,no_facilities=0;
        var data=raw_data.data;
        var section_score;
            if( data.assessments!=null){assessments = data.assessments;}
            if( data.average_score!=null){average_score = data.average_score;}  
            if( data.no_counties!=null){no_counties = data.no_counties;}  
            if( data.no_facilities!=null){no_facilities = data.no_facilities;}  
            if( data.section_score!=null){section_score = data.section_score;}  
            
            average_score = Math.round((average_score*100)/100)+"%"; 
            
            $("#assessments").html(assessments);
            $("#average_score").html(average_score);
            $("#no_counties").html(no_counties);
            $("#no_facilities").html(no_facilities);
         
        
        for(var i=0;i<section_score.length;i++){
            
            var DG,LG,Y,R;
            DG = section_score[i].DG;
            LG = section_score[i].LG;
            Y = section_score[i].Y;
            R = section_score[i].R;
            var position = i+1;
      
          var data_chart = {
  labels: ["Dark Green", "Light Green","Yellow","Red"],
  datasets: [{
    fill: true,
    backgroundColor: [
      '#086508',
      '#33d933',
      'yellow',
      'red'
    ],
    data: [DG, LG, Y,R],
    borderColor: ['black', 'black','black','black'],
    borderWidth: [0.1, 0.1,0.1,0.1]
  }]
};  

draw_chart(data_chart,position);

     } //end of loop
     
     
     
     
    }
    });
    }
    
    </script>

	<script type="text/javascript">
    	function draw_chart(data,pos){
var canvas = document.getElementById("area_"+pos);
var ctx = canvas.getContext('2d');

Chart.defaults.global.defaultFontColor = 'black';
Chart.defaults.global.defaultFontSize = 16;
var theHelp = Chart.helpers;         
var options = {
  legend: {
    display: false,
    
    // generateLabels changes from chart to chart,  check the source, 
    // this one is from the doughut :
    // https://github.com/chartjs/Chart.js/blob/master/src/controllers/controller.doughnut.js#L42
    labels: {
      generateLabels: function(chart) {
        var data = chart.data;
        if (data.labels.length && data.datasets.length) {
          return data.labels.map(function(label, i) {
            var meta = chart.getDatasetMeta(0);
            var ds = data.datasets[0];
            var arc = meta.data[i];
            var custom = arc && arc.custom || {};
            var getValueAtIndexOrDefault = theHelp.getValueAtIndexOrDefault;
            var arcOpts = chart.options.elements.arc;
            var fill = custom.backgroundColor ? custom.backgroundColor : getValueAtIndexOrDefault(ds.backgroundColor, i, arcOpts.backgroundColor);
            var stroke = custom.borderColor ? custom.borderColor : getValueAtIndexOrDefault(ds.borderColor, i, arcOpts.borderColor);
            var bw = custom.borderWidth ? custom.borderWidth : getValueAtIndexOrDefault(ds.borderWidth, i, arcOpts.borderWidth);
              return {
              // And finally : 
              text: ds.data[i] + "% of the time " + label,
              fillStyle: fill,
              strokeStyle: stroke,
              lineWidth: bw,
              hidden: isNaN(ds.data[i]) || meta.data[i].hidden,
              index: i
            };
          });
        }
        return [];
      }
    }
  }
};

// Chart declaration:
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: data,
  options: options
});

console.log(myPieChart.generateLegend());



Chart.plugins.register({
  afterDatasetsDraw: function(chartInstance, easing) {
    // To only draw at the end of animation, check for easing === 1
    var ctx = chartInstance.chart.ctx;
    chartInstance.data.datasets.forEach(function(dataset, i) {
      var meta = chartInstance.getDatasetMeta(i);
      if (!meta.hidden) {
        meta.data.forEach(function(element, index) {
          // Draw the text in black, with the specified font
          ctx.fillStyle = 'black';
          var fontSize = 20;
          var fontStyle = 'normal';
          var fontFamily = 'Helvetica Neue';
          ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);
          // Just naively convert to string for now
          var dataString = dataset.data[index].toString();
          // Make sure alignment settings are correct
          ctx.textAlign = 'center';
          ctx.textBaseline = 'middle';
          var padding = 5;
          var position = element.tooltipPosition();
          ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding);
        });
      }
    });
  }
});
        }
	</script>
</html>
