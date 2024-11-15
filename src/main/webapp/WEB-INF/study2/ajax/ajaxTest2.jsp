<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxTest2.jsp</title>
<jsp:include page="/include/bs4.jsp" />
<script>
  	'use strict';
  	
  	function idCheck(mid) {
			if(mid == "") {
				alert("아이디를 입력하세요");
				myform.mid.focus();
				return "0";
			}
		}
		
  	// 일반 AJAX처리
  	function idCheck1() {
			let mid = myform.mid.value;
			if(idCheck(mid) == "0") return false;
			
			$.ajax({
				type : "get",
				url : "${ctp}/AjaxIdCheck2_1",
				data : {mid : mid},
				success : function(res) {
					let str = "성명 : "+res;
					$("#demo").html(str);
				},
				error: function() {
					alert("전송오류");
				}
			});
		}
  	
  	// vo객체 형식으로 자료전달해보기
  	function idCheck2() {
			let mid = myform.mid.value;
			if(idCheck(mid) == "0") return false;
			
			$.ajax({
				type : "get",
				url : "${ctp}/AjaxIdCheck2_2",
				data : {mid : mid},
				success : function(res) {
					$("#demo").html(res);
					
					if(res.indexOf("/")  != -1) {
						let str = res.split("/");
						$("#imsiMid").html(str[0]);
						$("#imsiName").html(str[1]);
						$("#imsiAge").html(str[2]);
						$("#imsiGender").html(str[3]);
						$("#imsiAddress").html(str[4]);
					}
				},
				error: function() {
					alert("전송오류");
				}
			});
		}
  	
  	// vo를 json방식으로 변환시켜서 전달받아서 처리
  	function idCheck3() {
			let mid = myform.mid.value;
			if(idCheck(mid) == "0") return false;
			
			$.ajax({
				type : "get",
				url : "${ctp}/AjaxIdCheck2_3",
				data : {mid : mid},
				success : function(res) {
					//console.log("res "+res);
					$("#demo").html(res);
					//JSON자료를 자바스크립트에서 사용하기위한 Object로 변환한다.(파싱)
					/* 외부 제공 데이터를 가져올 때 사용 */
					let js = JSON.parse(res);
					console.log("js ",js);
					
					let str = res.split("/");
					$("#imsiMid").html(js.mid);
					$("#imsiName").html(js.name);
					$("#imsiAge").html(js.age);
					$("#imsiGender").html(js.gender);
					$("#imsiAddress").html(js.address);
					
				},
				error: function() {
					alert("전송오류");
				}
			});
		}
  	
  	// vos객체를 json방식으로 변환시켜서 전달받아서 처리
  	function idCheck4() {
			let mid = myform.mid.value;
			if(idCheck(mid) == "0") return false;
			
			$.ajax({
				type : "get",
				url : "${ctp}/AjaxIdCheck2_4",
				data : {mid : mid},
				success : function(res) {
					console.log("res ",res);
					$("#demo").html(res);
					
					//JSON자료를 자바스크립트에서 사용하기위한 Object로 변환한다.(파싱)
					/* 외부 제공 데이터를 가져올 때 사용 */
					let js = JSON.parse(res); //parse:JSON객체를 자바스크립트형식으로 파싱처리
					console.log("js : ", js);
	    			
    			let tMid="", tName="", tAge="", tGender="", tAddress="";
    			for(let j of js) {
    				tMid += j.mid + "/";
    				tName += j.name + "/";
    				tAge += j.age + "/";
    				tGender += j.gender + "/";
    				tAddress += j.address + "/";
    			}
  				$("#imsiMid").html(tMid);
  				$("#imsiName").html(tName);
  				$("#imsiAge").html(tAge);
  				$("#imsiGender").html(tGender);
  				$("#imsiAddress").html(tAddress);
				},
				error: function() {
					alert("전송오류");
				}
			});
		}
  	 
    // vos객체를 j
    function idCheck5() {
    	let mid = myform.mid.value;
    	if(idCheck(mid) == "0") return false;
    	
    	$.ajax({
    		type : "get",
    		url  : "${ctp}/AjaxIdCheck2_5",
    		data : {mid : mid},
    		success:function(res) {
    			console.log("res : ", res);
    			$("#demo").html(res);
    			
    			
    			// JSON자료를 자바스크립에서 사용하기위한 Object로 변환한다.(파싱)
    			let js = JSON.parse(res);
    			console.log("js : ", js);
    			
    			let tMid="", tName="", tAge="", tGender="", tAddress="";
    			for(let j of js) {
    				tMid += j.mid + "/";
    				tName += j.name + "/";
    				tAge += j.age + "/";
    				tGender += j.gender + "/";
    				tAddress += j.address + "/";
    			}
  				$("#imsiMid").html(tMid);
  				$("#imsiName").html(tName);
  				$("#imsiAge").html(tAge);
  				$("#imsiGender").html(tGender);
  				$("#imsiAddress").html(tAddress);
    			
  				//앞에서 넘어온 JSON형식의 자료를 자바스크립트 Object로 변경후 프론트 형식에 맞게 출력한다 
  				let i = 1;
  				let str ='';
  				str += '<table class="table table-hover text-center" >';
  				str += '<tr class="table-info"><th>번호</th><th>아이디</th><th>성명</th><th>나이</th><th>성별</th><th>주소</th></tr>';
  				for(let j of js) {
  				str += '<tr>';
  				str += '<td>'+(++i)+'</td>';
  				str += '<td>'+j.mid+'</td>';
  				str += '<td>'+j.name+'</td>';
  				str += '<td>'+j.age+'</td>';
  				str += '<td>'+j.gender+'</td>';
  				str += '<td>'+j.address+'</td>';
  				str += '</tr>';
  				}
  				str += '<tr><td colspan="6" class="m-0 p-0"></td></tr>';
  				str += '</table>';
  				demo2.innerHTML = str;
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
  </script>
</head>
<body>
		<jsp:include page="/include/header.jsp" />
		<jsp:include page="/include/nav.jsp" />
		<p>
				<br />
		</p>
		<div class="container">
				<h2>AJAX 값 전달 응용</h2>
				<!-- 크롬 /  웹 제공 데이터 : json으로 발행 : json 처리에 사용 -->
				<form name="myform">
						<!-- 아이디 : <input type="button" name="mid" id="mid" value="hkd1234" -->
						아이디 : <input type="button" name="mid" id="mid" value="hkd1234" class="form-control text-left mb-2" />
						<div>
								<input type="button" value="아이디검색1" onclick="idCheck1()"	class="btn btn-success" />
								<input type="button" value="아이디검색2" onclick="idCheck2()" class="btn btn-primary" />
								<input type="button" value="아이디검색3" onclick="idCheck3()" class="btn btn-secondary" />
								<input type="button" value="아이디검색4(주로사용)" onclick="idCheck4()" class="btn btn-info" />
								<input type="button" value="아이디검색5(실제사용)" onclick="idCheck5()" class="btn btn-warning" />
						</div>
						<hr />
						<div>
							1. 일반값의 전달처리<br/>
							2. vo를 편집하여 전달받아서 처리<br/> <!-- {"키1":"값1","키2":"밸류2"...} -->
							3. vo를 json방식으로 변환시켜서 전달받아서 처리<br/>
							4. vos형식의 자료로 만들어서 json형식으로 변환시켜 전달받아서 처리<br/>
							5. vos형식의 자료를 json형식으로 변환시켜 전달받아서 처리<br/>
						</div>						
						<hr />
						<div id="demo"></div>
						<hr />
						<div>
								<div>
										아이디 : <span id="imsiMid"></span>
								</div>
								<div>
										성명 : <span id="imsiName"></span>
								</div>
								<div>
										나이 : <span id="imsiAge"></span>
								</div>
								<div>
										성별 : <span id="imsiGender"></span>
								</div>
								<div>
										주소 : <span id="imsiAddress"></span>
								</div>
						</div>
						<hr />
						<div id="demo2"></div>
						<hr />
				</form>
		</div>
		<p>
				<br />
		</p>
		<jsp:include page="/include/footer.jsp" />
</body>
</html>