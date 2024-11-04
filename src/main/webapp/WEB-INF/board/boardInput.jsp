<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boardInput.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
<script>
	'use strict';
	
	function fCheck() {
		
		
		myform.submit();
	}
</script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="BoardInputOk.bo" onsubmit="return fCheck()">
		<h2 class="text-center">게 시 판 글 쓰 기</h2>
    <table class="table table-bordered">
      <tr>
        <th class="text-center"><label for="nickName" class="form-label">글쓴이</label></th>
        <td>
	      	<input type="text" name="nickName" id="nickName" value="${sNickName}" class="form-control" readonly />
        </td>
      </tr>
      <tr class="mb-2">
        <th class="text-center">글제목</th>
        <td>
          <input type="text" name="title" id="title" placeholder="제목을 입력하세요" class="form-control mr-1" required autofocus />
        </td>
    	</tr>
      <tr class="mb-2">
        <th class="text-center"><label for="content" class="form-label">글내용</label></th>
        <td><textarea rows="6" name="content" id="content" class="form-control" placeholder="내용을 작성하세요" required></textarea></td>
      </tr>
      <tr class="mb-2">
        <th class="text-center"><label for="openSw" class="form-label">공개여부</label></th>
        <td>
          <input type="radio" name="openSw" id="openSw1" value="공개" class="mr-1" checked /><label for="openSw1">공개</label> &nbsp;&nbsp;
          <input type="radio" name="openSw" id="openSw2" value="비공개" class="mr-1" /><label for="openSw2">비공개</label>
        </td>
      </tr>
    </table>
    <table class="table table-borderless">
      <tr>
			  <td class="text-left">
		    	<button type="button" onclick="location.href='BoardList.bo'" class="btn btn-info mb-2">돌아가기</button>
        </td>
        <td class="text-right">
			    <button type="submit" class="btn btn-success mb-2">등록하기</button> <!-- submit=엔터치면 넘어감 -->
			    <button type="reset" class="btn btn-warning mb-2">다시입력</button>
			  </td>
      </tr>
    </table>
    <input type="hidden" name="mid" id="mid" value="${sMid}" />
    <input type="hidden" name="hostIp" id="hostIp" value="${pageContext.request.remoteAddr}" />
  </form>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>