/**
 * 
 */
  $(function(){
 	
	$(document).ready(function(){
	$(".card-body button[name=simple]").click(function(){
            		selectModifyDetail( $(this).children("#moAttNo").val());
            	})
 	})

	 
 	
	 
 })
 
 
 function selectModifyDetail(moAttNo){
	
 	console.log(moAttNo);
 	
 
    $.ajax({
        url: "modifyDetail.mo",
		data:{
		    moAttNo : moAttNo
		},
        type:"post",
        success:function(att){
          	
          	let value=""
          	
          	value +=      "<div class='card mb-4 modifyDiv' style='height: 759px;'>"
		    +               "<h5 class='card-header'><img src='" + att.empPhoto + "' alt='Avatar' class='rounded-circle' width='40px;' height='40px;'/><b> "+ att.empName +"</b> " + att.grName +" " + att.moAttType + " π μμ μμ²­μ</h5>"
		    +               "<div class='card-body' style='width: 95%;'>"
		    +                 "<form id='formAccountSettings' method='POST' action='modifyMo.mo'>"
			+                 	"<input type='hidden' value='" + att.moAttNo + "' name='moAttNo'>"
		    +                   "<table class='table table-hover modifyTable'>"
		    +                      "<thead>"
		                      
		    +                       "<tr>"
			+                         "<td>μ‘°ν</td>"
		    +                         "<td>μμ μμ²­μΌ</td>"
		    +                         "<td>μΆκ·Όμκ°</td>"
		    +                         "<td>ν΄κ·Όμκ°</td>"
		    +                         "<td>μ΄ κ·Όλ¬΄μκ°</td>"
		    +                         "<td>μν</td>"
			+                         "<td>μμ±μΌ</td>"
		    +                       "</tr>"
		    +                     "</thead>"
		    +                     "<tbody>"
		    +                       "<tr>"
			+                         "<td>"+ att.moReadFlag +"</td>"
		    +                         "<td>"+ att.moAttModifyD +"</td>"
		    +                         "<td>"+ att.attIn +"</td>"
		    +                         "<td>"+ att.attOut +"</td>"
		    +                         "<td>"+ att.gapHour + ":" + att.gapMinute + ":" + att.gapSecond +"</td>"
		    +                         "<td>"+ att.attStatus +"</td>"
			+                         "<td>"+ att.moAttEnrollD +"</td>"
		    +                       "</tr>"
		    +                     "</tbody>"
		    +                   "</table>"
		    +                 "</form>"
		    +                 "<form class='mb-3 col-md-12 reason' style='margin-top: 15px;' method='POST' action='confirmMo.mo'>"
			+                 	"<input type='hidden' value='" + att.moAttNo + "' name='moAttNo'>"
		    +                   "<h5 class='card-header' style='margin-bottom : 15px'><b>π§Ύ " + att.moAttType + "μμ μ¬μ </b></h5>"
		    +                   "<textarea class='textarea' autofocus>" + att.moAttReason + "</textarea>"
			+                   "<div class='row submitDiv' style='margin-left: 90px;'>"
		    +                   "<div class='mt-2 btnDiv col-md-10' style='margin-bottom:10px;'>"
		    +                       "<label for='address' class='form-label' style='font-size: 10px; width:50px'>μμ μΌμ</label>"
			+                       "<input type='date' class='attDate value='" + att.attDate + "'>'"
		    +                       "<input type='time' class='form-control' id='attTime' name='attTime' min='00:00:00' max='23:59:59' value='" + att.moAttModifyTime + "'/>"
		    +                     "</div>"

		    +                   "</div>"
		    +                   "<h5 class='card-header' style='margin-bottom : 15px; padding-top:0';><b>π μμ μκ²¬</b></h5>"
		    +                   "<textarea class='textarea' autofocus required name='moAttBack' style='background-color:#E7E7E7' id='moAttBack' readOnly>"+ att.moAttBack +"</textarea>"
		    
		    +                 "</form>"
          	
          	$(".printModifyDiv").html(value);
			
        },
        error:function(){
            console.log("κ΄λ¦¬μ μμ½λ΄μ­λ¦¬μ€νΈ μ‘°νμ© ajaxν΅μ  μ€ν¨"); 
        }
    })

}


function selectMoAttForm(){
	let empNo = $("#empNo").val();
	
	console.log(empNo);
	$.ajax({
        url: "selectMoAttForm.mo",
		data:{
		    empNo : empNo
		},
        type:"post",
        success:function(e){
          	
          	let value=""
          	
          	value +=      "<div class='card mb-4 vacDetailDiv'>"
				  +				 "<h5 class='card-header' style='margin-bottom:20px; margin-top:20px;'><b> "+ e.empName +"</b> " + e.grName + " π μμ μμ²­μ μμ±</h5>"
				  +				"<div class='card-body' style='width: 95%;'>"
				  +					"<form id='formAccountSettings' method='POST' action='insertMoAtt.mo'>"
				  +					"<div class='row'>"
				  +						"<input type='hidden' value='" + e.empNo + "' name='empNo'>"
				  +						"<div class='mb-3 col-md-4'>"
				  +						"<label for='address' class='form-label' style='font-size: 10px; width:50px'>μμ μΌ</label>"
				  +                       "<input type='date' class='attDate' name='attDate' >"
				  +						"</div>"
				  +						"<div class='mb-3 col-md-4'>"
				  +						"<label for='address' class='form-label' style='font-size: 10px; width:50px'>μμ μ</label>"
				  +                       "<input type='time' class='form-control' min='00:00:00' max='23:59:59' id='moAttModifyTime' name='moAttModifyTime'>"
				  +						"</div>"
				  +						"<div class='mb-3 col-md-4'>"
				  +						"<label for='organization' class='form-label'>μμ μμ²­μ ν</label>"
				  +						"<div style='height : 10px'></div>"
				  +						"<input class='form-check-input'  type='radio' name='moAttType' value='I'>&nbspμΆκ·Όμμ &nbsp&nbsp&nbsp&nbsp&nbsp"
				  +						"<input class='form-check-input'  type='radio' name='moAttType' value='O'>&nbspν΄κ·Όμμ &nbsp&nbsp&nbsp&nbsp&nbsp"
				  +						"</div>"
				  +						"<div class='mb-3 col-md-12' style='margin-top: 20px;''>"
				  +						"<label for='reason' class='form-label' >μμ  μμ²­μ¬μ </label><br>"
				  +						"<textarea class='reasonArea' autofocus required name='moAttReason'></textarea>"
				  +						"</div>"
				  +					"</div>"
				  +					"<div class='mt-2 attModifyFormBtnDiv'>"
				  +						"<button type='submit' class='btn btn-primary me-2'>μμ μμ²­</button>"
				  +					"</div>"
				  +					"</form>"
				  +			"</div>"
				  +		"</div>"
          	
          	$(".printModifyDiv").html(value);
			
        },
        error:function(){
            console.log("κ·Όν μμ νΌ μμ±μ© ajaxν΅μ  μ€ν¨"); 
        }
    })

}
