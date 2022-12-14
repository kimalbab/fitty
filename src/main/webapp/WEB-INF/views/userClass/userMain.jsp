<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
#calendar{
	width: 100%; height:100%;
  }

  .div:hover{
    background-color:#696cff0c;
  }

  .mm{
    font-size: 20px; font-weight: bolder; text-align: center; margin-bottom:10px
  }

  table{
    width: 90%; height:90%; margin:auto; margin-radius:5px;
  }

  tr{
  	height:15%
  }

  td{
    padding: 3px 3px; text-align: right; vertical-align: sub; 
    min-width: 105px;
    max-width: 105px;
    width: 105px; 
  }

  .div{
    width:100%; height:100%; border:1px solid lightGray; border-radius:5px
  }

  .div>span{
    display: block; padding: 10px 10px;
    height: 30%;
  }

  .day{
    height: 70%;
    text-align: center;
  }
  
  .calMove{
  	height:5%
  }
  
  .cal{
  	height:90%
  }	
  
  .arrow:hover{color:purple; cursor:pointer};
</style>
</head>
<body>

<jsp:include page="userHeader.jsp" />



<div class="row">
    <div class="col-md-12">
    <div class="card mb-4">
		<h5 class="card-header" style='color:#696cff; font-size:20px; font-weight:900; text-align:center'>π ${loginU.userName }λμ my fitty π</h5>
		<div class="card-body row" style="height:740px">
        
        <div style='margin:auto; width:100%; height:100%;'>
	        	<div id='calendar' style='height:100%'></div>
		</div>
		
		
		
		<script>
		var today = new Date();
		
		var yy = "";
		var mm = "";
		var dd = "";
		
		$(function(){
			
			calrendarMaker();
		
            $(document).on("click", ".pre", function() { // μ΄μ λ¬
                today = new Date ( today.getFullYear(), today.getMonth()-1, today.getDate());
                dd = today.getDate(); //μ€λμ μΌ
                mm = today.getMonth()+1;  //μ€λμ ν΄λΉνλ μ
    			yy = today.getFullYear().toString().substring(2); //μ€λμ ν΄λΉνλ λ
           		calrendarMaker();
            })
		
            $(document).on("click", ".next", function() { // λ€μλ¬
                today = new Date ( today.getFullYear(), today.getMonth()+1, today.getDate());
                dd = today.getDate(); //μ€λμ μΌ
                mm = today.getMonth()+1;  //μ€λμ ν΄λΉνλ μ
    			yy = today.getFullYear().toString().substring(2); //μ€λμ ν΄λΉνλ λ
           		calrendarMaker();
            })
            
            
            //var ttt = new Date(); //μ§μ λ νμλλ‘ λ§λ  μ€λλ μ§
            
			dd = today.getDate(); //μ€λμ μΌ
			mm = today.getMonth()+1;  //μ€λμ ν΄λΉνλ μ
			yy = today.getFullYear().toString().substring(2); //μ€λμ ν΄λΉνλ λ

			if(dd<10){
			    dd='0'+dd
			}
			if(mm<10){
			    mm='0'+mm
			}
			var ttt = yy + "/" + mm + "/" + dd;
            
		})
            
		
		function calrendarMaker(){
			
			// μλ¨λ¦¬μ€νΈλ₯Ό μ‘°ννλ ajax
			$.ajax({
				url : "select.cl",
				data : {classNo: ${classNo}},
				success:function(data){ // 
					
				
				var d = data.d; //dietλ¦¬μ€νΈ
				var e = data.e; //exerciseλ¦¬μ€νΈ
				
				var all = data.all; //κ° μΌμλ³ μ μ²΄ μ΄λ κ°―μ
				var com = data.com; //κ° μΌμλ³ μ΄λμλ£ν κ°―μ
				
				console.log(d);
				console.log(e);
				
				var now = new Date();	// νμ¬ λ μ§ λ° μκ°
				var mn = now.getMonth()+1;
				
					// λ¬λ ₯ μ°λ
		            var calendarYear = today.getFullYear();
		            // λ¬λ ₯ μ
		            var calendarMonth = today.getMonth() + 1;
		            // λ¬λ ₯ μΌ
		            var calendarToday = today.getDate();
		            
		            // λ¬λ ₯ μμ λ§μ§λ§ μΌ
		            var monthLastDate = new Date(calendarYear, calendarMonth, 0);
		            var calendarMonthLastDate = monthLastDate.getDate();
		            
		            // λ¬λ ₯ μμ μμ μμΌ
		            var monthStartDay = new Date(calendarYear, today.getMonth(), 1);
		            var calendarMonthStartDay = monthStartDay.getDay();
		            
		            // μ£Ό μΉ΄μ΄νΈ
		            var calendarWeekCount = Math.ceil((calendarMonthStartDay + calendarMonthLastDate) / 7);
		            
		            var html = "";
		                html += "<div align='center' class='calMove'>";
		                
		                
		                html += "<button type='button' class='pre' style='border:none; background:none;'><i class='bx bxs-left-arrow arrow' style='color:lavender'></i></button>";
		                html += " &nbsp;&nbsp;&nbsp;<label class='mm'>" + calendarMonth + "μ</label> &nbsp;&nbsp;&nbsp;";
		                html += "<button type='button' class='next' style='border:none; background:none;'><i class='bx bxs-right-arrow arrow' style='color:lavender'></i></button>";

		                html += "</div><br>";
		                
		                html += "<table class='calrendar'>";
		                html += "<thead>";
		                html += "<tr align='center'>";
		                html += "<th style='color:red'>SUN</th><th>MON</th><th>THU</th><th>WEN</th><th>THU</th><th>FRI</th><th>SAT</th>";
		                html += "</tr>";
		                html += "</thead>";
		                html += "<tbody>";
		                
		                // μμΉ
		                var calendarPos = 0;
		                // λ μ§
		                var calendarDay = 0;
		                
		                for (var index1 = 0; index1 < calendarWeekCount; index1++) {
		                  html += "<tr>";
		                  for (var index2 = 0; index2 < 7; index2++) {
		                    html += "<td>";
		                    if (calendarMonthStartDay <= calendarPos && calendarDay < calendarMonthLastDate) {
		                    	calendarDay++;
		                      
		                      	if(calendarDay == calendarToday && calendarMonth == mn){
		                      		html += "<div class='div' style='width: 99%; height: 103%; border: 5px solid #9a9cf76e;'>"
		                      			  + "<span>" + calendarDay + "</span>";
		                      	}else{
			                      	html += "<div class='div'><span>" + calendarDay + "</span>";
		                      	}
		                      	
		                      	html += "<div class='day'><div class='diet' style='background:#fcffceab;'>";
		                      	
		                      		//μ‘°νν΄μ¨ λ¦¬μ€νΈμ κ° λ μ§μ div μμ λ μ§κ° κ°μ κ²½μ° λ°λ³΅λ¬Έμ λλ € λΏλ €μ§λλ‘
			                      	for(let i in d){
			                      		if( (yy + "/" + mm + "/" + calendarDay) == d[i].dietDate ){
 			                      	/* html += "μλ¨ "; */
			                      			if(d[i].bfImage != null){
			                      				html += "π";
			                      			}				                      			
			                      			if(d[i].lcImage != null){
			                      				html += "π";
			                      			}
			                      			if(d[i].dnImage != null){
			                      				html += "π";
			                      			}
			                      			if(d[i].reImage != null){
			                      				html += "π";
			                      			}
			                      			/* html += "<div style='background:purple; border-radius:70%; width:15px; height:15px; margin:auto; float:left'></div>" */
			                      		}
			                      	}
		                        html += "</div><div class='exercise' style='background:#c75ef621'>";
		                      		
		                      		//κ° μΌμλ³ μ§νλ₯  λ³΄μ¬μ£ΌκΈ°
	                      			//μλ£
		                      		for(let i in com){ 
		                      			if( (yy + "/" + mm + "/" + calendarDay) == com[i].exDate ){
		                      				html += "μ΄λ <label style='font-weight:500'>" + com[i].exSet + "</label> / ";
		                      			}
		                      		}
	                      			//μ μ²΄
		                      		for(let i in all){ 
		                      			if( (yy + "/" + mm + "/" + calendarDay) == all[i].exDate ){
		                      				html += "<label style='font-weight:500'>" + all[i].exCount + "</label>";
		                      			}
		                      		}
		                      	html += "</div>";
		                      	
		                       	html += "</div>"
		                              + "</div></div>";
		                              
		                    }
		                    
		                    html += "</td>";
		                    calendarPos++;
		                  }
		                  html += "</tr>";
		                }
		                html += "</tbody>";
		                html += "</table></div>";
		                
		                $("#calendar").html(html);
		                
		                
		                $(".div").click(function(){
		        			
		                    let dd = $(this).children().eq(0).text(); //ν΄λ¦­ν divμ "μΌ"
		                    
		                    if(dd>0 && dd<10){ // "μΌ"μ λκΈμλ‘ νν
		                      dd = "0" + dd;
		                    }

		                    let month = $(".mm").text().replace("μ", ""); //λ¬λ ₯λ΄μ "μ"μ λκΈμλ‘ νν
		                    let mm = "";
		                    if(month>0 && month<10){
		                      mm = "0" + month;
		                    }

		                    let yy = calendarYear.toString(); //λ¬λ ₯λ΄μ "λ"μ λκΈμλ‘ νν
		                    yy =yy.substring(2);

		                    
		                    let clDate = yy + "/" + mm + "/" + dd; //ν΄λ¦­ν divμ μ§μ νμ λ μ§ (DBμμ λΉκ΅ κ°λ₯ν κ°)
		                    
		                    
		                    
		                    let t = new Date(); //νμ¬ λ μ§(λμμΌ)
		                    let clickDate = new Date(calendarYear, month-1, dd); //ν΄λ¦­ν divμ μμ€ν λ μ§
		                    
		                    console.log(clDate);
		                    
		                    
		                    if(clickDate < t){ //μ€λ μ΄νμ λ μ§λ ν΄λ¦­λμ§ μλλ‘
		                       	location.href = 'userDiDetail.cl?classNo=${classNo}&dietDate=' + clDate;
		                    }else{
		                  	  alert("μ ν λΆκ°λ₯ν λ μ§μλλ€.");
		                    }
		                    
		              	}) 
		                
				},
				error:function(){
					console.log("λ¬λ ₯ μ‘°νμ© ajax ν΅μ  μ€ν¨");
				}
			})
                
		}
        </script>
          
          
		</div>
    </div>
    </div>
</div>


</body>
</html>