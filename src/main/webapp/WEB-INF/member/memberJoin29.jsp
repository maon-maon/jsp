<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String today = LocalDate.now().toString();
	pageContext.setAttribute("today", today);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberJoin.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${ctp}/js/woo.js"></script>
<script>
	'use strict'
	let sw = 0;
	 /*1번 사용 가능 
	let mid = '$ { vo.mid}';
	
	$(function() {
  	if(mid == "") {
  		demo.innerHTML = mid + "는 이미 사용중입니다.";
  	}
  	else {
			demo.innerHTML = "$ { vo.tempMid}는 사용가능합니다.";
		}
	}); */
	 
  function fCheck() {
		let tel2 = myform.tel2.value.trim();
		let tel3 = myform.tel3.value.trim();
		if(tel2 == "") tel2 = " ";
		if(tel3 == "") tel3 = " ";
		 
		let tel = myform.tel1.value +" -"+ tel2 +" -"+ tel3;
		let email = myform.email1.value +"@"+myform.email2.value
		let address = myform.postcode.value+" /"+myform.address.value+" /"+myform.detailAddress.value+" /"+myform.extraAddress.value;
		/* 분리해서 저장하시 위해 /를 삽입. /앞에 띄어쓰기로 공백을 넣어줘야 오류가 안 생김. /가 연달아 나오면 한개의 덩어리로 생각함*/
		
		//유효성 정규식 처리
		
		// ~~~~
		//alert("tel : "+tel);
		
		myform.tel.value = tel;
		myform.email.value = email;
		myform.address2.value = address;
		
  	myform.submit();
	}
    
	//아이디 중복체크
	function idCheck() {
		let mid = myform.mid.value;
		
		if(mid.trim() == "") {
			alert("아이디를 입력하세요");
			myform.mid.focus();
		}
		else {
			let url = "MemberIdCheck.mem?mid="+mid;
			window.open(url, "idCheckWindow", "width=450px, height=250px"); /*(변수,창이름,크기)  */
			sw++;
		}
	}  	 
	
	//닉네임 중복체크
	function nickCheck() {
		let nickName = myform.nickName.value;
		
		if(nickName.trim() == "") {
			alert("닉네임을 입력하세요");
			myform.nickName.focus();
		}
		else {
			let url = "MemberNickNameCheck.mem?nickName="+nickName
			window.open(url, "nickCheckWindow", "width=450px, height=250px");
			sw++;
		}
	}  	 
	 
	//회원가입 버튼 : 중복확인 체크
	function joinCheck() {
		if(sw == 0) {
			alert("아이디를 중복체크하세요");
			myform.midBtn.focus();
		}
		else if(sw == 1) {
			alert("닉네임을 중복체크하세요");
			myform.midBtn.focus();
		}
		else myform.submit();
	}
</script>
<style type="text/css">
      th {
        width: 150px; 
        background-color: #eee;    
        padding: 10px;
      }
      
      #subject {
        background-color: #eee;    
      }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" id="myform" method="post" action="MemberJoinOk.mem" onsubmit="return fCheck()">
    <h3 class="text-center">회 원 가 입</h3>
    <table class="table table-bordered">
      
      <!-- 중복체크 -->
      <tr>
        <th class="text-center"><label for="mid" class="form-label">아이디</label></th>
        <td >
        	<div class=" input-group mb-1">
	        	<input type="text" name="mid" id="mid" placeholder="입력하세요" class="form-control" autofocus required />
	        	<div class="input-group-append">
		        	<input type="button" name="midBtn" value="아이디 중복체크" onclick="idCheck()" class="btn btn-secondary">
	        	</div>
        	</div>
        </td>
      </tr>
      
      <tr>
        <th class="text-center"><label for="pwd" class="form-label">비밀번호</label></th>
        <td ><input type="password" name="pwd" id="pwd" placeholder="입력하세요" class="form-control" required /></td>
      </tr>
      <tr class="mb-2">
        <th class="text-center"><label for="name" class="form-label">이름</label></th>
        <td ><input type="text" name="name" id="name" placeholder="입력하세요" class="form-control" required /></td>
      </tr>
      
      <!-- 중복체크 -->
      <tr class="mb-2">
        <th class="text-center"><label for="nickName" class="form-label">닉네임</label></th>
        <td  >
        	<div class="input-group mb-1">
	        	<input type="text" name="nickName" id="nickName" placeholder="입력하세요" class="form-control" required />
	        	<div class="input-group-append">
		        	<input type="button" value="닉네임 중복체크" onclick="nickCheck()" class="btn btn-secondary" />
	        	</div>
        	</div>
        </td>
      </tr>
      
      <tr class="mb-2">
        <th class="text-center">성별</th>
        <td  class="text-center">
          <input type="radio" name="gender" id="male" value="남자" checked /><label for="male" class="form-label mr-3">남자</label>
          <input type="radio" name="gender" id="female" value="여자" />    <label for="female" class="form-label">여자</label>
        </td>
      </tr>
      <tr class="mb-4">
        <th class="text-center"><label for="birthday" class="form-label">생일</label></th>
        <td ><input type="date" name="birthday" id="birthday" value="${today}" class="form-control"></td>
      </tr>
      <tr class="mb-2">
        <th class="text-center"><label for="tel1" class="form-label">전화번호</label></th>
        <td >
        <select class="" id="tel1" name="tel1">
            <option >010</option>
            <option value="02">서울</option>
            <option value="041">천안</option>
            <option value="042">대전</option>
            <option value="043">청주</option>
            <option value="031">인천</option>
         </select>
         -<input type="text" class="" id="tel2" name="tel2" size="4" maxlength="4" />
         -<input type="text" class="" id="tel3" name="tel3" size="4" maxlength="4" />
        </td>
      </tr>
      
      <!-- 다음 주소api 삽입 : DNC방식으로 상단 스트립트+내누 예제코드 -->
      <tr class="mb-2" >
        <th class="text-center"><label for="address" class="form-label">주소</label></th>
        <td >
					<div class=" input-group mb-1">
		      	<input type="text" name="postcode" id="sample6_postcode" onclick="sample6_execDaumPostcode()"placeholder="우편번호 검색하세요" class="form-control">
						<div class=" input-group-append">
							<input type="button"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						</div>
					</div>  	
					<input type="text" name="address" id="sample6_address" onclick="sample6_execDaumPostcode()" size="50" placeholder="주소" class="form-control mb-1" readonly>
	      	
					<div class=" input-group mb-1">
		      	<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control mb-1" >
						<div class=" input-group-append">
							<input type="text" name="extraAddress" id="sample6_extraAddress" onclick="sample6_execDaumPostcode()" placeholder="추가사항" class="form-control" >
						</div>
					</div>  		      	
        </td>
      </tr>
      
      <tr class="mb-2">
        <th class="text-center">이메일</th>
        <td >
        	<input type="text" name="email1" id="email1" class="" required />@
          <select class="" id="email2" name="email2" required style="height:30px " >
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="gmail.com">gmail.com</option>
          </select>
        </td>
    	</tr>
      <tr class="mb-2">
        <th class="text-center"><label for="content" class="form-label">자기소개</label></th>
        <td ><textarea cols="5" name="content" id="content" class="form-control"></textarea></td>
      </tr>
      <tr class="mb-2">
        <th class="text-center"><label for="photo" class="form-label">사진</label></th>
        <td ><input type="file" name="photo" id="photo" class="form-control-file border" /></td>
      </tr>
      <tr class="mb-2">
        <th class="text-center"><label for="userInfo" class="form-label">정보공개</label></th>
        <td  class="text-center">
          <input type="radio" name="userInfo" id="YES" value="공개" class="btn-check" checked /><label for="YES" class="form-label mr-3">공개</label>
          <input type="radio" name="userInfo" id="NO" value="비공개" class="btn-check"  /><label for="NO" class="form-label">비공개</label>
        </td>
      </tr>
    </table>
    <table class="table table-borderless">
      <tr>
        <td>
			    <!-- <button type="submit" class="btn btn-success mb-2">회원가입</button> -->
			    <input type="button" value="회원가입" onclick="joinCheck()" class="btn btn-success mb-2" />
			    <button type="reset" class="btn btn-warning mb-2">다시입력</button>
			  </td>
			  <td class="text-right">
		    	<%-- <button type="button" onclick="location.href='${ctp}/'" class="btn btn-info mb-2">돌아가기</button> --%>
		    	<button type="button" onclick="history.back()" class="btn btn-info mb-2">돌아가기</button>
        </td>
      </tr>
    </table>
    <input type="hidden" name="tel" id="tel" />
    <input type="hidden" name="email" id="email" />
    <input type="hidden" name="address2" />
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>