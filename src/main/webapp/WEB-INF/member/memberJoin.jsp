<%@ page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <jsp:include page="/include/bs4.jsp" />
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <style>
    th {
      text-align: center;
      background-color: #eee;
    }
  </style>
  <script>
    'use strict';
    
    let idCheckSw = 0;
    let nickCheckSw = 0;
    
  	// 정규식을 이용한 유효성검사처리.....
  	let regMid = /^[a-zA-Z0-9_]{4,20}$/;	// 아이디는 4~20의 영문 대/소문자와 숫자와 밑줄 가능
    let regNickName = /^[가-힣0-9_]{2,20}$/;			// 닉네임은 한글, 숫자, 밑줄만 2~20자 가능
    let regName = /^[가-힣a-zA-Z0-9]{2,20}$/;				// 이름은 한글/영문/숫자 2~20자 가능
    
    function fCheck() {
    	let mid = myform.mid.value;
    	let pwd = myform.pwd.value;
    	let nickName = myform.nickName.value;
    	let name = myform.name.value;
    	
    	// split분리시 공백이 있어야 배열로 분리되어 들어감
    	let tel2 = myform.tel2.value.trim();
    	let tel3 = myform.tel3.value.trim();
    	if(tel2 == "") tel2 = " ";
    	if(tel3 == "") tel3 = " ";
    	
    	let tel = myform.tel1.value + "-" + tel2 + "-" + tel3;
    	let email = myform.email1.value + "@" + myform.email2.value;
    	let address = myform.postcode.value+" /"+myform.address.value+" /"+myform.detailAddress.value+" /"+myform.extraAddress.value +" ";
    	
    	if(!regMid.test(mid)) {
    		alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
    		myform.mid.focus();
    		return false;
    	}
    	else if(pwd.length < 4 || pwd.length > 20) {
        alert("비밀번호는 4~20 자리로 작성해주세요.");
        myform.pwd.focus();
        return false;
      }
      else if(!regNickName.test(nickName)) {
        alert("닉네임은 2자리 이상 한글만 사용가능합니다.");
        myform.nickName.focus();
        return false;
      }
      else if(!regName.test(name)) {
        alert("성명은 2자리 이상 한글과 영문대소문자만 사용가능합니다.");
        myform.name.focus();
        return false;
      }
    	
			// 이메일 주소형식체크
			// 전화번호 형식 체크
    	
    	myform.tel.value = tel;
    	myform.email.value = email;
    	myform.address2.value = address;
    	
		  // 아이디/닉네임 중복버튼 눌렀는지 체크
    	if(idCheckSw == 0) {
    		alert("아이디 중복체크버튼을 눌러주세요");
    		document.getElementById("midBtn").focus();
    		return false;
    	}
    	else if(nickCheckSw == 0) {
    		alert("닉네임 중복체크버튼을 눌러주세요");
    		document.getElementById("nickNameBtn").focus();
    		return false;
    	}
    	
  		myform.email.value = email;
  		myform.tel.value = tel;
  		myform.address.value = address;
  		
  		//myform.submit(); //onsubmit은 리턴값 받아서 전송함. 여기서 바로 전송하면 안 됨
    }
    
    // 아이디 중복체크
    function idCheck() {
    	let mid = myform.mid.value;
    	
    	if(!regMid.test(mid)) {
    		alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
    		myform.mid.focus();
    		return false;
    	}
    	else {
    		idCheckSw = 1;
    		
    		let url = "MemberIdCheck.mem?mid="+mid;
    		window.open(url, "idCheckWindow", "width=400px, height=250px");
    	}
    }
    
    // 닉네임 중복체크
    function nickNameCheck() {
    	let nickName = myform.nickName.value;
    	if(!regNickName.test(nickName)) {
        alert("닉네임은 2자리 이상 한글만 사용가능합니다.");
        myform.nickName.focus();
        return false;
      }
    	else {
    		nickCheckSw = 1;
    		
    		let url = "MemberNickNameCheck.mem?nickName="+nickName;
    		window.open(url, "nickNameCheckWindow", "width=400px, height=250px");
    	}
    }
    
    // 닉네임 중복체크(Ajax처리)
    function nickNameAjaxCheck() {
    	let nickName = myform.nickName.value;
    	if(!regNickName.test(nickName)) {
        alert("닉네임은 2자리 이상 한글만 사용가능합니다.");
        myform.nickName.focus();
        return false;
      }
    	nickCheckSw = 1;
    	
    	$.ajax({
				type : "get",
				url  : "NickNameAjaxCheck.mem",
				data : {"nickName" : nickName},
				
				success : function(res) {
					if(res != "0") alert("닉네임이 중복되었습니다.\n다른 닉네임을 사용하세요.");
					else 	alert("사용할 수 있는 닉네임입니다.\n계속 가입 진행하세요");
				},
				error : function() {
					alert("전송오류");
				}
    	});
    }
    
    
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="MemberJoinOk.mem" onsubmit="return fCheck()">
    <h3 class="text-center">회 원 가 입</h3>
    <table class="table table-bordered">
      <tr>
        <th class="text-center"><label for="mid" class="form-label">아이디</label></th>
        <td>
          <div class="input-group">
	          <input type="text" name="mid" id="mid" value="${mid}" placeholder="아이디를 입력하세요" class="form-control" autofocus required />
	          <div class="input-group-append ml-1">
	          	<input type="button" value="아이디 중복체크" onclick="idCheck()" id="midBtn" class="form-control btn-secondary" />
	          </div>
          </div>
        </td>
      </tr>
      <tr>
        <th class="text-center"><label for="pwd" class="form-label">비밀번호</label></th>
        <td><input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" class="form-control" required /></td>
      </tr>
      <tr>
        <th class="text-center"><label for="name" class="form-label">성명</label></th>
        <td><input type="text" name="name" id="name" placeholder="성명을 입력하세요" class="form-control" required /></td>
      </tr>
      <tr>
        <th class="text-center"><label for="nickName" class="form-label">닉네임</label></th>
        <td>
          <div class="input-group">
	          <input type="text" name="nickName" id="nickName" placeholder="닉네임을 입력하세요" class="form-control" required />
	          <div class="input-group-append ml-1">
	          	<!-- <input type="button" value="닉네임 중복체크" onclick="nickNameCheck()" id="nickNameBtn" class="form-control btn-secondary" /> -->
	          	<input type="button" value="닉네임 중복체크" onclick="nickNameAjaxCheck()" id="nickNameBtn" class="form-control btn-secondary" />
	          </div>
          </div>
        </td>
      </tr>
      <tr>
        <th class="text-center">성별</th>
        <td >
          <input type="radio" name="gender" id="male" value="남자" checked class="mr-1" /><label for="male" class="form-label mr-3">남자</label>
          <input type="radio" name="gender" id="female" value="여자" class="mr-1" /><label for="female" class="form-label">여자</label>
        </td>
      </tr>
      <tr>
        <th class="text-center"><label for="birthday" class="form-label">생일</label></th>
        <td><input type="date" name="birthday" id="birthday" value="${today}" class="form-control"></td>
      </tr>
      <tr>
        <th class="text-center"><label for="tel1" class="form-label">전화번호</label></th>
        <td>
          <div class="input-group">
            <div class="input-group-prepend">
	        	<select id="tel1" name="tel1" class="form-control mr-1">
	            <option>010</option>
	            <option value="02">서울</option>
	            <option value="041">천안</option>
	            <option value="042">대전</option>
	            <option value="043">청주</option>
	            <option value="031">인천</option>
	          </select>
	          </div>
	          -<input type="text" name="tel2" id="tel2" maxlength="4" class="form-control ml-1 mr-1">
	          -<input type="text" name="tel3" id="tel3" maxlength="4" class="form-control ml-1">
          </div>
        </td>
      </tr>
      <tr class="mb-2">
        <th class="text-center"><label for="address" class="form-label">주소</label></th>
        <td>
          <div class="input-group mb-1">
		      	<input type="text" name="postcode" id="sample6_postcode" onclick="sample6_execDaumPostcode()" placeholder="우편번호" class="form-control mr-1" readonly>
		      	<div class="input-group-append">
							<input type="button" value="우편번호 찾기" onclick="sample6_execDaumPostcode()" class="btn btn-secondary">
						</div>
					</div>
					<input type="text" name="address" id="sample6_address" onclick="sample6_execDaumPostcode()" placeholder="주소" class="form-control mb-1" readonly>
					<div class="input-group mb-1">
						<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control mr-1">
						<div class="input-group-append">
							<input type="text" name="extraAddress" id="sample6_extraAddress" onclick="sample6_execDaumPostcode()" placeholder="참고항목" class="form-control" readonly>
						</div>
					</div>
        </td>
      </tr>
      <tr class="mb-2">
        <th class="text-center">이메일</th>
        <td>
          <div class="input-group">
	          <input type="text" name="email1" id="email1" placeholder="이메일을 입력하세요" class="form-control mr-1" required />@
	          <div class="input-group-append ml-1">
		          <select id="email2" name="email2" class="form-control">
		            <option value="naver.com">naver.com</option>
		            <option value="daum.net">daum.net</option>
		            <option value="gmail.com">gmail.com</option>
		          </select>
	          </div>
          </div>
        </td>
    	</tr>
      <tr class="mb-2">
        <th class="text-center"><label for="content" class="form-label">자기소개</label></th>
        <td><textarea rows="4" name="content" id="content" class="form-control" placeholder="자기소개를 간단히 입력하세요"></textarea></td>
      </tr>
      <tr class="mb-2">
        <th class="text-center"><label for="photo" class="form-label">사진</label></th>
        <td><input type="file" name="photo" id="photo" class="form-control-file border" /></td>
      </tr>
      <tr class="mb-2">
        <th class="text-center"><label for="userInfo" class="form-label">정보공개</label></th>
        <td>
          <input type="radio" name="userInfo" id="YES" value="공개" class="mr-1" checked /><label for="YES">공개</label> &nbsp;&nbsp;
          <input type="radio" name="userInfo" id="NO" value="비공개" class="mr-1" /><label for="NO">비공개</label>
        </td>
      </tr>
    </table>
    <table class="table table-borderless">
      <tr>
        <td>
			    <button type="submit" class="btn btn-success mb-2">회원가입</button>
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