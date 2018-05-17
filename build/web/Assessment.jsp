<%-- 
    Document   : Assessment
    Created on : May 15, 2018, 4:16:43 PM
    Author     : GNyabuto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" sizes="96x96" href="assets/img/logo.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>SIMS Assessment</title>

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

    
</head>
<body>
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
		        <div class="col-sm-12">

		            <!--      Wizard container        -->
		            <div class="">
		                <div class="card wizard-card" data-color="green" id="wizard">
		                <form action="save_assessment_form" method="post">
		                <!--        You can switch " data-color="green" "  with one of the next bright colors: "blue", "azure", "orange", "red"       -->

		                    	<div class="wizard-header">
		                        	<h3 class="wizard-title">SIMS Facility Assessment</h3>
		                    	</div>
								<div class="wizard-navigation">
									<div class="progress-with-circle">
									    <div class="progress-bar" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="4" style="width: 15%;"></div>
									</div>
									<ul id="header_info">
			                            <li>
											<a href="#basic_info" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-map"></i>
												</div>
												<div id="area_0">Basic Info</div>
											</a>
										</li>
			                            <li>
											<a href="#f_101" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-map"></i>
												</div>
												<div id="area_1">F 101</div>
											</a>
										</li>
			                            <li>
											<a href="#f_103" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-direction-alt"></i>
												</div>
												<div id="area_2">F 103</div>
											</a>
										</li>
			                            <li>
											<a href="#f_109" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-panel"></i>
												</div>
												<div id="area_3">F 109</div>
											</a>
										</li>
			                            <li>
											<a href="#f_211" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-comments"></i>
												</div>
												<div id="area_4">F 211</div>
											</a>
										</li>
			                           
			                        </ul>
								</div>
		                        <div class="tab-content">
		                            <div class="tab-pane" id="basic_info">
		                            	<div class="row">
		                                	<div class="col-sm-12">
                                                            <h5 class="info-text" style="text-align: left;" id="area_title_0"> Select details appropriately</h5>
		                            		</div>
		                                	<div class="col-sm-5">
		                                    	<div class="form-group">
		                                            <label>County</label><br>
		                                            <select name="county" id="county" class="form-control">
		                                                <option disabled="" selected="">- County -</option>
		                                            </select>
		                                        </div>
		                                        </div>
                                                          
                                                        <div class="col-sm-5  col-sm-offset-1">
		                                        <div class="form-group">
		                                            <label>Sub County</label><br>
		                                            <select name="sub_county" id="sub_county" class="form-control">
		                                                <option disabled="" selected="">- Sub County -</option>
		                                            </select>
		                                        </div>
		                                        </div>
                                                            
                                                         <div class="col-sm-5">   
		                                        <div class="form-group">
		                                            <label>Health Facility</label><br>
		                                            <select name="facility" id="facility" class="form-control">
		                                                <option disabled="" selected="">- Health Facility -</option>
		                                            </select>
                                                     </div>
                                                     </div>
                                                       
                                                    <div class="col-sm-5  col-sm-offset-1">
		                                    	<div class="form-group">
		                                        	<label>Assessor Name</label>
		                                        	<div class="input-group">
		                                            	<input type="text" id="assessor_name" name="assessor_name" class="form-control" placeholder="Assessor Name">
                                                                <span class="input-group-addon"></span>
		                                            	</div>
		                                    	</div>
		                                	</div>
                                                       
                                                    <div class="col-sm-5">
		                                    	<div class="form-group">
		                                        	<label>Assessment Date</label>
		                                        	<div class="input-group">
		                                            	<input type="text" id="assessment_date" name="assessment_date" class="form-control" placeholder="Assessment Date">
		                                            	<span class="input-group-addon"></span>
                                                                </div>
		                                    	</div>
		                                	</div>
                                                            
                                                            
                                                    <div class="col-sm-5  col-sm-offset-1">
		                                    	<div class="form-group">
		                                        	<label>Assessor Team Lead</label>
		                                        	<div class="input-group">
		                                            	<input type="text" id="assessor_team_lead" name="assessor_team_lead" class="form-control" placeholder="A    ssessor Team Lead">
		                                            	<span class="input-group-addon"></span>
                                                                </div>
		                                    	</div>
		                                	</div>
                                                    
		                            	</div>
		                            </div>
                                            
		                            <div class="tab-pane" id="f_101">
		                                <h5 class="info-text"  style="" id="area_title_1" >Title</h5>
                                                <div class="info-text"  style="text-align: left; margin-top: -3%;" id="area_standard_1">Standard</div>
		                                <div class="info-text" style="text-align: left; margin-top: -2%;" id="area_comments_1">Comments</div>
		                                <div class="row">
		                                    <div class="col-sm-12 col-sm-offset-0">
                                                            <table class="table table-hover">
                                                        <thead>
                                                            <th>Code</th>
                                                            <th>Question</th>
                                                            <th>Response</th>
                                                            <th>Scoring</th>
                                                        </thead>
                                                        <tbody id="tdata_1">
                                                          
                                                            </tbody>
                                                        </table>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="tab-pane" id="f_103">
		                                <h5 class="info-text"  style="" id="area_title_2">Title</h5>
                                                <div class="info-text"  style="text-align: left; margin-top: -3%;" id="area_standard_2">Standard</div>
		                                    <div class="info-text"  style="text-align: left; margin-top: -2%;" id="area_comments_2">Comments</div>
		                                <div class="row">
		                                    <div class="col-sm-12 col-sm-offset-0">
                                                            <table class="table table-hover">
                                                        <thead>
                                                            <th>Code</th>
                                                            <th>Question</th>
                                                            <th>Response</th>
                                                            <th>Scoring</th>
                                                        </thead>
                                                        <tbody id="tdata_2">
                                                          
                                                            </tbody>
                                                        </table>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="tab-pane" id="f_109">
		                                <div class="row">
		                                    <h5 class="info-text"  style="" id="area_title_3"> Title</h5>
                                                    <div class="info-text"  style="text-align: left; margin-top: -3%;" id="area_standard_3">Standard</div>
		                                    <div class="info-text"  style="text-align: left; margin-top: -2%;" id="area_comments_3">Comments</div>
		                                     <div class="row">
		                                    <div class="col-sm-12 col-sm-offset-0">
                                                            <table class="table table-hover">
                                                        <thead>
                                                            <th>Code</th>
                                                            <th>Question</th>
                                                            <th>Response</th>
                                                            <th>Scoring</th>
                                                        </thead>
                                                        <tbody id="tdata_3">
                                                          
                                                            </tbody>
                                                        </table>
		                                    </div>
		                                </div>
		                                </div>
		                            </div>
		                            <div class="tab-pane" id="f_211">
		                                <div class="row">
		                                    <h5 class="info-text"  style="" id="area_title_4">Title </h5>
		                                    <div class="info-text"  style="text-align: left; margin-top: -3%;" id="area_standard_4">Standard</div>
		                                    <div class="info-text"  style="text-align: left; margin-top: -2%;" id="area_comments_4">Comments</div>
		                                     <div class="row">
		                                    <div class="col-sm-12 col-sm-offset-0">
                                                            <table class="table table-hover">
                                                        <thead>
                                                            <th>Code</th>
                                                            <th>Question</th>
                                                            <th>Response</th>
                                                            <th>Scoring</th>
                                                        </thead>
                                                        <tbody id="tdata_4">
                                                          
                                                            </tbody>
                                                        </table>
		                                    </div>
		                                </div>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="wizard-footer">
	                            	<div class="pull-right">
	                                    <input type='button' class='btn btn-next btn-fill btn-success btn-wd' name='next' value='Next' />
	                                    <input type='submit' class='btn btn-finish btn-fill btn-success btn-wd' name='finish' value='Finish' />
					</div>

	                                <div class="pull-left">
	                                    <input type='button' class='btn btn-previous btn-default btn-wd' name='previous' value='Previous' />
	                                </div>
	                                <div class="clearfix"></div>
		                        </div>
		                    </form>
		                </div>
		            </div> <!-- wizard container -->
		        </div>
	        </div> <!-- row -->
			
<!--                    
			</div>-->
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

	<!--  Plugin for the Wizard -->
	<script src="wizard/assets/js/paper-bootstrap-wizard.js" type="text/javascript"></script>

	<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="wizard/assets/js/jquery.validate.min.js" type="text/javascript"></script>
        
 <script type="text/javascript" language="en">
   function numbers(evt){
        var charCode=(evt.which) ? evt.which : event.keyCode
        if(charCode > 31 && (charCode < 48 || charCode>57))
        return false;
        return true;
  }
//-->
</script>


	<script>
   $(document).ready(function() {
} ); 
    </script>
        <script type="text/javascript">
           
        $(document).ready(function() {
        load_county();
        load_sub_county();
        load_facility();
        
        
       $("#county").change(function(){
            load_sub_county();
            load_facility(); 
       }); 
       $("#sub_county").change(function(){
        load_facility();  
       }); 
    });
    
    function load_county(){
            $.ajax({
        url:'load_county',
        type:"post",
        dataType:"json",
        success:function(raw_data){
            var position=0,id,name,output="<option value=\"\">Choose County</option>";
             var dataSet=[];
        var data=raw_data.data;
            position++;
            id=name="";
            for(var i=0;i<data.length;i++){
            if( data[i].id!=null){id = data[i].id;}
            if( data[i].name!=null){name = data[i].name;}
            output += '<option value="'+id+'">'+name+'</option> ';     
         }
            $("#county").html(output);

    }
    });
    }    
    function load_sub_county(){
        var county = $("#county").val();
            $.ajax({
        url:'load_subcounty?county='+county,
        type:"post",
        dataType:"json",
        success:function(raw_data){
            var position=0,id,name,output="<option value=\"\">Choose Sub County</option>";
             var dataSet=[];
        var data=raw_data.data;
            position++;
            id=name="";
            for(var i=0;i<data.length;i++){
            if( data[i].id!=null){id = data[i].id;}
            if( data[i].name!=null){name = data[i].name;}
            output += '<option value="'+id+'">'+name+'</option> ';     
         }
            $("#sub_county").html(output);

    }
    });
    }    
    function load_facility(){
        var county = $("#county").val();
        var sub_county = $("#sub_county").val();
            $.ajax({
        url:'load_facility?county='+county+'&&sub_county='+sub_county,
        type:"post",
        dataType:"json",
        success:function(raw_data){
            var position=0,id,name,mfl_code,output="<option value=\"\">Choose Facility</option>";
             var dataSet=[];
        var data=raw_data.data;
            position++;
            id=name=mfl_code="";
            for(var i=0;i<data.length;i++){
            if( data[i].id!=null){id = data[i].id;}
            if( data[i].name!=null){name = data[i].name;}
            if( data[i].mfl_code!=null){mfl_code = data[i].mfl_code;}
            output += '<option value="'+id+'">'+mfl_code+' - '+name+'</option> ';     
         }
            $("#facility").html(output);

    }
    });
    }    
           
           </script>
 <script>
   $(document).ready(function() {
    load_data();    
    } );

    function load_data(){
            $.ajax({
        url:'loadform',
        type:"post",
        dataType:"json",
        success:function(raw_data){
            var data=raw_data.data;
            //areas
            var area_id,area_score_id,area_standard,area_instructions,area_comments,area_code,color_code,color,area_title,area_active,area_has_data,indicator;
            for(var i=0;i<data.length;i++){
                area_id = data[i].area_id;
                area_score_id = data[i].area_score_id;
                area_standard = data[i].area_standard;
                area_instructions = data[i].area_instruction;
                area_comments = data[i].area_comments;
                area_code = data[i].area_code;
                color_code = data[i].color_code;
                color = data[i].color;
                area_title = data[i].area_title;
                area_active = data[i].area_active;
                area_has_data = data[i].has_data;
                indicator = data[i].indicator;
             $("#area_"+area_id).html(area_code);
             $("#area_title_"+area_id).html("<b>"+area_code+" "+area_title+"</b><hr>");
             if(area_instructions!=""){
             $("#area_standard_"+area_id).html("<b>STANDARD:</b> <i>"+area_standard+"</i><hr><b>Instructions:</b> <i>"+area_instructions+"</i><hr>");
            }
             else{
             $("#area_standard_"+area_id).html("<b>STANDARD:</b> <i>"+area_standard+"</i><hr>");
            }
             $("#area_comments_"+area_id).html("<b>Comment:</b> "+area_comments+"<hr>");
           
           //indicator 
           var mother_id,has_data,code,is_active,question,id,has_child,is_child,response,indicator_score_id,child_data;
           var quiz_output="";
            for(var j=0;j<indicator.length;j++){
              mother_id = indicator[j].mother_id;  
              has_data = indicator[j].has_data;  
              code = indicator[j].code;  
              is_active = indicator[j].is_active;  
              question = indicator[j].question;   
              id = indicator[j].id;  
              is_child = indicator[j].is_child;  
              has_child = indicator[j].has_child;  
              child_data = indicator[j].child_data; 
              response = indicator[j].response; 
              indicator_score_id = indicator[j].indicator_score_id; 
               var child_quiz="";
              if(has_child==1){
            var mother_id_1,has_data_1,code_1,is_active_1,question_1,id_1,has_child_1,is_child_1,response_1,indicator_score_id_1;
            for(var k=0;k<child_data.length;k++){
                
              mother_id_1 = child_data[k].mother_id;  
              has_data_1 = child_data[k].has_data;  
              code_1 = child_data[k].code;  
              is_active_1 = child_data[k].is_active;  
              question_1 = child_data[k].question;   
              id_1 = child_data[k].id;  
              is_child_1 = child_data[k].is_child;  
              has_child_1 = child_data[k].has_child; 
              response_1 = child_data[k].response; 
              indicator_score_id_1 = child_data[k].indicator_score_id; 
              
              if(response_1=="on"){
              child_quiz+="<br><input type='checkbox' id='indic_"+id_1+"' name='"+indicator_score_id_1+"' onchange='manage_child();' checked> "+question_1;
          }
          else{
           child_quiz+="<br><input type='checkbox' id='indic_"+id_1+"' name='"+indicator_score_id_1+"'  onchange='manage_child();' > "+question_1;    
          }
              }   
              }
              var output_res = "";
              if(id!=20){
              output_res = selected_indic(id,response,indicator_score_id);
          }
          else{
            output_res = '<div class="input-group"><input type="text" onkeyup="percART();" onkeypress="return numbers(event)" value="'+response+'" class="form-control" onchange="manage_responses('+id+');" name="'+indicator_score_id+'" id="indic_response_'+id+'"><span class="input-group-addon">%</span></div>';  
          }
             question+=child_quiz;
             quiz_output+='<tr id="indic_'+id+'">'+
                            '<td>'+code+'</td>'+
                            '<td>'+question+'</td>';
                    if(has_child==0){
                   quiz_output+= '<td>'+output_res+'</td>';    
                    }
                    else{
                      output_res = selected_indic(id,"",indicator_score_id);
                      quiz_output+= '<td>'+output_res+'</td>';    
                    }
                            
                     quiz_output+= '<td></td>'+
                            '</tr>';
             
            } 
            
            quiz_output+= '<tr><td colspan="2" style="text-align:right;">SCORE</td><td colspan="2"><input type="text"  class="form-control" readonly name="area_'+area_score_id+'" id="area_score_'+area_id+'" style="background-color:'+color+'" value="'+color_code+'"></></td>'+
                            '</tr>';
           $("#tdata_"+area_id).html(quiz_output); 
           
            if(area_has_data==0){  
                        
          if(i==0){
             disable_all(2,8);
              
          }  
          else if(i==1){
              disable_all(10,13);
          }  
          else if(i==2){
              disable_all(15,18);
          }  
          else if(i==3){
              disable_all(20,21);
          }
          
         }
            }
    }
    });
    }
    function percART(){
        var id=20;
        var next=parseInt(id)+1;
        var no_charts = $("#indic_response_"+id).val();
        $("#indic_response_"+next).attr("disabled", true);
        $("#indic_response_"+next).attr("required", false);
        if(no_charts<50){
          area_indic_score(id,"R","red");
        }
        if(no_charts>50 && no_charts<70){ 
          area_indic_score(id,"Y","yellow");
        }
        if(no_charts>70 && no_charts<90){  
        area_indic_score(id,"LG","#33d933");
        }
        if(no_charts>=90){
           selected_indicator2(next,"");
           $("#indic_response_"+next).attr("disabled", false);
           $("#indic_response_"+next).attr("required", true);
            selected_indicator2(next,"");
        }
        
//        remove_others(id,8,selected_val);
    }
    
    function manage_entered(id,selected_val){
        if(id!==20){
       var next=parseInt(id)+1;
       if(selected_val=="Y"){
           if(id!="2"){
           $("#indic_response_"+next).attr("disabled", false);
           $("#indic_response_"+next).attr("required", true);
            }
         if(id=="2"){
         $("#indic_4").attr("disabled", false);  
         $("#indic_5").attr("disabled", false);  
         $("#indic_6").attr("disabled", false);
         
         $("#indic_response_"+next).attr("required", true);
         
//         $("#indic_4").attr("required", true);  
//         $("#indic_5").attr("required", true);  
//         $("#indic_6").attr("required", true); 
         selected_indicator2(next,"");
       }
       else if(id==8 || id==13 || id==18 || id==21){ 
        area_indic_score(id,"DG","#086508");
       }
       }
       
       else{
           if(next==9 || next==14 || next==19 || next==22){
           $("#indic_response_"+next).attr("disabled", false);    
           $("#indic_response_"+next).attr("required", true);    
           }
           else{
        $("#indic_response_"+next).attr("disabled", true);  
        $("#indic_response_"+next).attr("required", false);  
        area_indic_score(id,"R","red");
           }
        if(id=="2"){
            
         $("#indic_4").attr("checked", false);  
         $("#indic_5").attr("checked", false);  
         $("#indic_6").attr("checked", false);  
         
         $("#indic_4").attr("disabled", true);  
         $("#indic_5").attr("disabled", true);  
         $("#indic_6").attr("disabled", true);
         
         $("#indic_response_"+next).attr("required", false);
         
//         $("#indic_4").attr("required", false);  
//         $("#indic_5").attr("required", false);  
//         $("#indic_6").attr("required", false); 
         
         selected_indicator2(next,"");
       }
       else if(id==7 || id==11 || id==12 || id==15 || id==16 || id==17 ){
        area_indic_score(id,"Y","yellow");
       }
       else if(id==8 || id==13 || id==18 || id==21){ 
        area_indic_score(id,"LG","#33d933");
       }
       }
       
     if(id<8) {
     remove_others(id,8,selected_val);
     
     }
     else if(id>8 && id<13){
      remove_others(id,13,selected_val);
      
     }
     else if(id>13 && id<18){
      remove_others(id,18,selected_val);
      
     }
     else if(id>18 && id<21){
     remove_others(id,21,selected_val);
     
     }
        }
       if(id==19){
            if(selected_val=="Y"){
            $("#indic_response_"+next).attr("disabled", false); 
            $("#indic_response_"+next).attr("required", true); 
        }
        else{
          $("#indic_response_"+next).attr("disabled", true);
          $("#indic_response_"+next).attr("required", false);
          $("#indic_response_"+next).val("");
          
        }
        }
    }
    
    function disable_all(pos,max){
        while(pos<=max){
            if($("#indic_"+pos).length > 0) {
              $("#indic_"+pos).attr("disabled", true);  
              $("#indic_"+pos).attr("required", false);  
            }
            
            if($("#indic_response_"+pos).length > 0) {
             $("#indic_response_"+pos).attr("disabled", true);   
             $("#indic_response_"+pos).attr("required", false);   
            }
            pos++;
        }
    }
    function selected_indic(id,selected,indicator_score_id){
           var output_res = '<select class="form-control" onchange="manage_responses('+id+');" name="'+indicator_score_id+'" id="indic_response_'+id+'">';
              
              var responses=["","Y","N"];
              for(var a=0;a<responses.length;a++){
                  if(responses[a]==selected){
                   output_res+="<option value='"+responses[a]+"' selected>"+responses[a]+"</output>";   
                  }
                  else{
                   output_res+="<option value='"+responses[a]+"'>"+responses[a]+"</output>";     
                  }
              }
             output_res+="</select>";
       
        return output_res;
    }
    function manage_responses(id){
       var selected_val = $("#indic_response_"+id).val();
       manage_entered(id,selected_val);
    }
    
    function manage_child(){
       if($("#indic_4").is(":checked") && $("#indic_5").is(":checked") && $("#indic_6").is(":checked")){
        $("#indic_response_7").attr("disabled", false); 
        $("#indic_response_7").attr("required", true); 
        selected_indicator2(3,"Y");
       }
       else{
       $("#indic_response_7").attr("disabled", true); 
       $("#indic_response_7").attr("required", false); 
       selected_indicator2(3,"N");
       area_indic_score(3,"Y","yellow");
       }
    }
    
    function selected_indicator2(id,selected){
      var output_res = '';
              
             var responses=["","Y","N"];
              for(var a=0;a<responses.length;a++){
                  if(responses[a]==selected){
                   output_res+="<option value='"+responses[a]+"' selected>"+responses[a]+"</output>";   
                  }
                  else{
                   output_res+="<option value='"+responses[a]+"'>"+responses[a]+"</output>";     
                  }
              }
             output_res+="";
       $("#indic_response_"+id).html(output_res);   
    }
    
    
        function remove_others(pos,max,selected){
           
//           selected_indicator2(pos+1,""); 
           
           if((pos+1)==max){
              selected_indicator2(max,"");
            }
           
            pos+=1;
        while(pos<=max){
            if($("#indic_"+pos).length > 0) {
                if(pos==4 && selected=="Y"){
              $("#indic_"+pos+2).attr("disabled", false); 
              $("#indic_"+pos+3).attr("disabled", false); 
              $("#indic_"+pos+4).attr("disabled", false); 
              
              $("#indic_response_"+pos-1).attr("required", true);
              
//              $("#indic_"+pos+2).attr("required", true); 
//              $("#indic_"+pos+3).attr("required", true); 
//              $("#indic_"+pos+4).attr("required", true); 

                }
                else if(pos==4){
              $("#indic_"+pos+2).attr("disabled", true); 
              $("#indic_"+pos+3).attr("disabled", true); 
              $("#indic_"+pos+4).attr("disabled", true); 
              
              $("#indic_response_"+pos-1).attr("required", false);
              
//              $("#indic_"+pos+2).attr("required", false); 
//              $("#indic_"+pos+3).attr("required", false); 
//              $("#indic_"+pos+4).attr("required", false);        
                }
            }
            
            if($("#indic_response_"+pos).length > 0) {
                if(pos!==max){
             $("#indic_response_"+(pos+1)).attr("disabled", true);
             $("#indic_response_"+(pos+1)).attr("required", false);
                }
             selected_indicator2(pos,"");
            }
            
            pos++;
        }
        
        
    }
    
    function area_indic_score(indicator_id,score,color){
        var area_id = "";
        if(indicator_id<=8){
         area_id = "area_score_1";   
        }
        else if(indicator_id>8 && indicator_id<=13){
         area_id = "area_score_2";   
        }
        else if(indicator_id>13 && indicator_id<=18){
         area_id = "area_score_3";   
        }
        else if(indicator_id>18 && indicator_id<=21){
         area_id = "area_score_4";   
        }
       
        area_score(area_id,score,color);
     
    }
    
    function area_score(area_id,score,color){
        $("#"+area_id).val(score);
        $("#"+area_id).attr("style", "background-color: "+color+";");
    }
    </script>   
           
</html>