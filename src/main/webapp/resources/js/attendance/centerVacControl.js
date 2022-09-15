$(function(){

    selectAllAttList(1);
	
	$(document).ready(function(){
		$("#orderByWorkTime").on("change",function(){
			changeSelect();	
		})
	})
	
	$(document).ready(function(){
		$("#searchBtn").on("click",function(){
			changeSelect();	
		})
	})
	
	$(document).ready(function(){
		$('input:radio[name=orderByPercent]').on("click",function(){
			filterPercent();	
		})
	})
	
})

function selectAllAttList(page){

		$.ajax({
			url: "vacList.att",
			data:{
				addSql : $("#orderByWorkTime").val(),
				sqlEmpName :$("#searchText").val(),
				searchFlag : "N",
				cpage:page
			},
			type:"post",
			success:function(result){
			
			
				let value = "";
				let pageValue = "";
				
				let aList = result.aList;
				let pi = result.pi;
				

				if(aList.length == 0) {
					value += "<tr>"
						+ "<td colspan='12'> 직원이 없습니다. </td>"
							+ "</tr>";
				} else {
					for(let i=0; i<aList.length; i++){
						
						value += "<tr>"
							+    "<th><input type='checkbox' id='empNoInput' name='empNoInput' value='" + aList[i].empNo + "'></th>"
							+  	 "<td>" +  aList[i].empNo + "</td>"
							+  	 "<td>" +  aList[i].empName + "</td>"
							+  	 "<td>" +  aList[i].grName + "</td>"
							+  	 "<td>" +  aList[i].empEnrollDate.substr(0, 9) + "</td>"
							+  	 "<td>" +  aList[i].workYear + "</td>"
							
							if(aList[i].perYearMonthList[0].perYear === undefined) {
								value +=	"<td colspan='2'>미정</td>"
							} else {
								value +=	"<td>" + aList[i].perYearMonthList[0].perYear + "%</td>"
									   +    "<td>" + aList[i].perYearMonthList[0].perMonth + "%</td>"
							}
							
							if(aList[i].empVacList[0].plusYearVac === undefined) {
								value +=	"<td colspan='4'>미정</td>"
							} else {
								value +=	"<td>" + aList[i].empVacList[0].plusYearVac + "</td>"
									   +    "<td>" + aList[i].empVacList[0].minusYearVac + "</td>"
									   +    "<td>" + aList[i].empVacList[0].plusVac + "</td>"
									   +    "<td>" + aList[i].empVacList[0].minusVac + "</td>"
							}
								}
								
						value += "</tr>";
						
					}

						
					
					if(pi.currentPage == 1){
						// 현재페이지가 1페이지면 < 버튼 disabled
						pageValue += "<li class='page-item prev'><button disabled class='page-link'><i class='tf-icon bx bx-chevron-left'></i></button></li>";
							
					} else {
						// 현재 페이지가 1페이지가 아니면
						pageValue += "<li class='page-item prev'><button class='page-link' onclick='selectAllAttList(" + (pi.currentPage - 1) + ")'><i class='tf-icon bx bx-chevron-left'></i></button></li>";
					}
					
					for(let p=pi.startPage; p<=pi.endPage; p++) { 
						if(p == pi.currentPage) { 
								pageValue += "<li class='page-item'><button class='page-link' disabled>"  + p  + "</button></li>"
						}else {
								pageValue += "<li class='page-item'><button class='page-link' onclick='selectAllAttList(" + p +")'>" + p + "</button></li>"
						} 
					}     
			
					if(pi.currentPage == pi.maxPage) {
						pageValue += "<li class='page-item prev'><button disabled class='page-link'><i class='tf-icon bx bx-chevron-right'></i></button></li>"
					} else {
						pageValue +=	"<li class='page-item next'><button class='page-link' onclick='selectAllAttList(" + (pi.currentPage + 1) + ")'><i class='tf-icon bx bx-chevron-right'></i></button></li>"
						
					}
					
					$("#memListTBody").html(value);
					$(".pagination").html(pageValue);
			}
		,error:function(){
				console.log("페이지 로딜 리스트 조회용 ajax통신 실패"); 
		}
	

	})
}



function changeSelect(){
	let orderByWorkTime = $("#orderByWorkTime").val();
	let orderByAtt = $("#orderByAtt").val();
	let memListTBody = $("#memListTBody");
	
 
	
	
	 $.ajax({
			  url:"orderByVac.att",
			 data:{
			   orderByWorkTime:orderByWorkTime,
			   //orderByAtt:orderByAtt,
			   searchText:$("#searchText").val()
			 },
			 type:"post",
			 success:function(result){
			    let value = "";
		  	    let pageValue = "";
		   
				let aList = result.aList;
				let pi = result.pi;
				
				
				
				if(aList.length == 0) {
					value += "<tr>"
						+ "<td colspan='12'> 직원이 없습니다. </td>"
							+ "</tr>";
				} else {
					for(let i=0; i<aList.length; i++){
						
						value += "<tr>"
							+    "<th><input type='checkbox' id='empNoInput' name='empNoInput' value='" + aList[i].empNo + "'></th>"
							+  	 "<td>" +  aList[i].empNo + "</td>"
							+  	 "<td>" +  aList[i].empName + "</td>"
							+  	 "<td>" +  aList[i].grName + "</td>"
							+  	 "<td>" +  aList[i].empEnrollDate.substr(0, 10) + "</td>"
							+  	 "<td>" +  aList[i].workYear + "</td>"
							
							if(aList[i].perYearMonthList[0].perYear === undefined) {
								value +=	"<td colspan='2'>미정</td>"
							} else {
								value +=	"<td>" + aList[i].perYearMonthList[0].perYear + "%</td>"
									  +     "<td>" + aList[i].perYearMonthList[0].perMonth + "%</td>"
							}
							
							if(aList[i].empVacList[0].plusYearVac === undefined) {
								value +=	"<td colspan='4'>미정</td>"
							} else {
								value +=	"<td>" + aList[i].empVacList[0].plusYearVac + "</td>"
										+    "<td>" + aList[i].empVacList[0].minusYearVac + "</td>"
										+    "<td>" + aList[i].empVacList[0].plusVac + "</td>"
										+    "<td>" + aList[i].empVacList[0].minusVac + "</td>"
							}
								}
								
						value += "</tr>";
						
					}

						
					
					if(pi.currentPage == 1){
						// 현재페이지가 1페이지면 < 버튼 disabled
						pageValue += "<li class='page-item prev'><button disabled class='page-link'><i class='tf-icon bx bx-chevron-left'></i></button></li>";
							
					} else {
						// 현재 페이지가 1페이지가 아니면
						pageValue += "<li class='page-item prev'><button class='page-link' onclick='selectAllAttList(" + (pi.currentPage - 1) + ")'><i class='tf-icon bx bx-chevron-left'></i></button></li>";
					}
					
					for(let p=pi.startPage; p<=pi.endPage; p++) { 
						if(p == pi.currentPage) { 
								pageValue += "<li class='page-item'><button class='page-link' disabled>"  + p  + "</button></li>"
						}else {
								pageValue += "<li class='page-item'><button class='page-link' onclick='selectAllAttList(" + p +")'>" + p + "</button></li>"
						} 
					}     
			
					if(pi.currentPage == pi.maxPage) {
						pageValue += "<li class='page-item prev'><button disabled class='page-link'><i class='tf-icon bx bx-chevron-right'></i></button></li>"
					} else {
						pageValue +=	"<li class='page-item next'><button class='page-link' onclick='selectAllAttList(" + (pi.currentPage + 1) + ")'><i class='tf-icon bx bx-chevron-right'></i></button></li>"
						
					}
					
					$("#memListTBody").html(value);
					$(".pagination").html(pageValue);
			   
			 }
	   ,
	   error:function(){
		 console.log("회원목록 조회용 ajax 통신 실패");
	   }
	   
	})
}


function filterPercent(){
	
	let orderByPercent = $('input:radio[name=orderByPercent]:checked').val();
	console.log(orderByPercent);
	
	if(orderByPercent == "over80"){
		
		// memListTBody의 tr의 6번째 td의 텍스트값 중 퍼센트를 떼고 숫자로 변환한 값이 80보다 크면	
		 let perYear = $("#memListTBody tr td:nth-child(7)").text()
		 const perYearArr = perYear.split("%");
		 
		 for(let i=0; i<perYearArr.length-1; i++){
		 	if(Number(perYearArr[i]) < 80) {
		 		console.log(i + "번------");
		 		console.log(Number(perYearArr[i]));
		 		console.log(i + "번------");
		 		
		 		$("#invalidNo").val((i+1) + "%");
		 		console.log($("#invalidNo").val());
		 		
		 		$("#memListTBody checkbox : nth-child()").attr("disabled", true);
		 	}
		 }
		 const disabledNo = ($("#invalidNo").val().split("%"));
		 
		 for(int i = 0; i<disabledNo.length; i++){
		 	$("#memListTBody checkbox : nth-child(disabledNo[i])").attr("disabled", true);
		 	console.log(disabledNo[i]);
		 }
	} else if(orderByPercent == "over100") {
		console.log("오버백");
	} else {
		console.log("전체");
	}
	
	
}
	