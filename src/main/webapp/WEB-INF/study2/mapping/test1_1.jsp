<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
  	'use strict';
  	
  	$(function() {
  		$("#demo1").hide();
  		$("#demo2").hide();
  		
	  	if('${hap}' != "") {
	  		$("#demo1").show();
	  	}
	  	else if('${gop}' != "") {
	  		$("#demo2").show();
	  	}
  	});
  	
  	
  	function fCheck(flag) {
  		let su1 = myform.su1.value;
  		let su2 = myform.su2.value;
			
  		if(flag == 1 || flag == 3) {
	  		if(su1 == "" || su2 == "") {
	  			alert("수를 입력하세요!");
	  			myform.su1.focus();
	  		}
	  		else {
	  			myform.flag.value = flag;
	  			myform.submit();
	  		}
  		}
  		else if(flag == 2) {
  			location.href = "${ctp}/study2/mapping/Test1";
  		}
  		else if(flag == 4) {
  			location.href = "${ctp}/mapping/Test1Ok?flag=4";
  		}
		}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>이곳은 test1.jsp 입니다.(/WEB-INF/study2/mapping)</h2>
  <hr/>
  <div>전송된 메세지 : ${msg}</div>
  <hr/>
  <div class="row">
    <div class="col"><input type="button" value="두수의 합/차" onclick="fCheck(1)" class="btn btn-success mr-2"/></div>
    <div class="col"><input type="button" value="돌아가기" onclick="fCheck(2)" class="btn btn-primary mr-2"/></div>
    <div class="col"><input type="button" value="두수의 곱/몫" onclick="fCheck(3)" class="btn btn-warning mr-2"/></div>
    <div class="col"><input type="button" value="현재시간" onclick="fCheck(4)" class="btn btn-info mr-2"/></div>
  </div>
  <hr/>
  <div>
    <form name="myform" method="post" action="${ctp}/mapping/Test1Ok">
    	<input type="number" name="su1" value="${su1}" placeholder="첫번째 수를 입력하세요" class="form-control mb-2"/>
    	<input type="number" name="su2" value="${su2}" placeholder="두번째 수를 입력하세요" class="form-control mb-2"/>
    	<input type="hidden" name="flag" />
    </form>
  </div>
  <hr/>
  <!-- <div id="demo" style="display:none;"> -->
  <div id="demo1">
    <div>두수의 합 : ${hap}</div>
    <div>두수의 차 : ${cha}</div>
  </div>
  <div id="demo2">
    <div>두수의 곱 : ${gop}</div>
    <div>두수의 몫 : ${mok}</div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>