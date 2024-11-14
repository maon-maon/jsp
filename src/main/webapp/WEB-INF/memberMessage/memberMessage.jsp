<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberMessage.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    th {
      text-align: center;
      background-color: #ccc;
    }
  </style>
  <script>
    'use strict';
    
    $(function(){
    	<c:if test="${!empty mid}">
    		document.getElementById("jusorokBtn").click();
    	</c:if>
    	
    	if('${msgFlag}' == 'r') {
    		$("#receiveMessage").show();
	    	$("#sendMessage").hide();
    	}
    	else if('${msgFlag}' == 's') {
    		$("#sendMessage").show();
	    	$("#receiveMessage").hide();
    	}
    	else {
	    	$("#receiveMessage").hide();
	    	$("#sendMessage").hide();
    	}
    });
    
    // 주소록 모달창에서 아이디검색버튼을 클릭시 동적폼 추가
    function idSearchView() {
    	$("#idSearchShowBtn").hide();
    	
    	let str = '';
    	str += '<div class="input-group m-3">';
    	str += '<input type="text" name="mid" id="mid" class="form-control"/>';
    	str += '<div class="input-group-append">';
    	str += '<input type="button" value="아이디검색" id="idSearchBtn" onclick="idSearchCheck()" class="btn btn-info btn-sm"/>';
    	str += '</div>';
    	str += '</div>';
    	idSearch.innerHTML = str;
    }
    
    // 아이디 검색 동적폼에서 아이디 검색 버튼클릭시 수행처리함수
    function idSearchCheck() {
    	let mid = $("#mid").val();
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요");
    		return false;
    	}
    	location.href = "MemberIdSearchCheck.msg?mid="+mid;
    }
    
    // 메세지 보내기
    function messageSend() {
    	let receiverId = $("#receiverId").val();
    	let content = $("#content").val();
    	if(receiverId.trim() == "") {
    		alert("받는사람 아이디를 입력해주세요");
    		return false;
    	}
    	else if(content == "") {
    		alert("메세지 내용을 입력하세요.");
    		$("#content").focus();
    		return false;
    	}
    	
    	let query = {
    			senderId 		: $("#senderId").val(),
    			receiverId 	: receiverId,
    			content			: content
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "MemberMessageInput.msg",
    		data : query,
    		success:function(res) {
    			if(res != "0") {
    				alert(receiverId + "님에게 메세지를 전송했습니다.");
    				location.href = "MemberMessageSearch.msg?mid=${sMid}&msgFlag=s";
    			}
    			else alert("메시지 전송에 실패했습니다.");
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 메세지 삭제하기(받은 메시지함에서만 삭제처리했다. 따라서 보낸사람의 메세지에서도 삭제된 메세지(보낸메세지)가 보이지 않는다.)
    function messageDeleteCheck(idx) {
    	let ans = confirm("메세지를 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url  : "MessageDeleteOk.msg",
    		data : {idx : idx},
    		success:function(res) {
    			if(res != "0") {
    				alert("메세지를 삭제했습니다.");
    				location.reload();
    			}
    			else alert("메시지 삭제에 실패했습니다.");
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 메세지 내용 모달로 띄우기
    function messageContentView(msgDate, senderId, content) {
    	//alert(senderId + " : " + content);
    	$("#myModal2 #senderId").text(senderId);
    	$("#myModal2 #msgDate").text(msgDate.substring(0,19));
    	$("#myModal2 #content").html(content);
    }
    
    // 메세지 답장쓰기
    function messageReplyInput() {
    	let senderId = $("#myModal2 #senderId").text();
    	location.href = "MemberMessage.msg?mid=${sMid}&msgFlag=s&senderId="+senderId;
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform">
    <h3 class="text-center">메세지 보내기</h3>
    <div class="input-group mb-2">
      <div class="input-group-prepend"><span class="input-group-text">보내는사람</span></div>
      <input type="text" name="senderId" id="senderId" value="${sMid}" class="form-control" readonly />
    </div>
    <div class="input-group mb-2">
      <div class="input-group-prepend"><span class="input-group-text">받는 사람</span></div>
      <c:if test="${empty senderId}"><input type="text" name="receiverId" id="receiverId" value="${param.receiverId}" class="form-control" readonly /></c:if>
      <c:if test="${!empty senderId}"><input type="text" name="receiverId" id="receiverId" value="${senderId}" class="form-control" readonly /></c:if>
      <div class="input-group-append"><a href="#" id="jusorokBtn" data-toggle="modal" data-target="#myModal" class="btn btn-success">주소록</a></div>
    </div>
    <div class="input-group">
      <textarea rows="3" name="content" id="content" placeholder="메세지 내용을 입력하세요" class="form-control"></textarea>
      <div class="input-group-append"><input type="button" value="메세지전송" onclick="messageSend()" class="btn btn-info"/></div>
    </div>
  </form>
  <hr/>
  <div>
    <input type="button" value="받은메세지" id="receiveMessageBtn" onclick="location.href='MemberMessageSearch.msg?mid=${sMid}&msgFlag=r'" class="btn btn-success"/>
    <input type="button" value="보낸메세지" id="sendMessageBtn" onclick="location.href='MemberMessageSearch.msg?mid=${sMid}&msgFlag=s'" class="btn btn-primary"/>
  </div>
  <hr/>
  <div id="receiveMessage">
    <h3 class="text-center">받은 메세지</h3>
    <table class="table table-hover text-center">
      <tr class="table-secondary">
        <th>번호</th>
        <th>보낸사람</th>
        <th>보낸날짜</th>
        <th>비고</th>
      </tr>
      <c:set var="no" value="${fn:length(messageVos)}"/>
      <c:forEach var="vo" items="${messageVos}" varStatus="st">
        <tr>
          <td>${no}</td>
          <td><a href="#" onclick="messageContentView('${vo.msgDate}','${vo.senderId}','${fn:replace(vo.content,newLine,'<br/>')}')" data-toggle="modal" data-target="#myModal2" title="메세지 내용보기">${vo.senderId}</a></td>
          <td>${fn:substring(vo.msgDate,0,19)}</td>
          <td><a href="javascript:messageDeleteCheck(${vo.idx})" class="btn btn-danger btn-sm">삭제</a></td>
        </tr>
        <c:set var="no" value="${no - 1}"/>
      </c:forEach>
      <tr><td colspan="4" class="m-0 p-0"></td></tr>
    </table>
  </div>

  <div id="sendMessage">
    <h3 class="text-center">보낸 메세지</h3>
    <table class="table table-hover text-center">
      <tr class="table-secondary">
        <th>번호</th>
        <th>받은사람</th>
        <th>보낸날짜</th>
      </tr>
      <c:set var="no" value="${fn:length(messageVos)}"/>
      <c:forEach var="vo" items="${messageVos}" varStatus="st">
        <tr>
          <td>${no}</td>
          <%-- <td>${vo.receiverId}</td> --%>
					<td><a href="#" onclick="messageContentView('${vo.msgDate}','${vo.senderId}','${fn:replace(vo.content,newLine,'<br/>')}')" data-toggle="modal" data-target="#myModal2" title="메세지 내용보기">${vo.receiverId}</a></td>
          <td>${fn:substring(vo.msgDate,0,19)}</td>
        </tr>
        <c:set var="no" value="${no - 1}"/>
      </c:forEach>
      <tr><td colspan="4" class="m-0 p-0"></td></tr>
    </table>
  </div>
</div>

<!-- 회원 주소록을 모달로 처리 -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="m-3">
        <div class="row">
          <div class="col"><h4>회원 주소록</h4></div>
          <div class="col text-right"><input type="button" value="아이디검색" onclick="idSearchView()" id="idSearchShowBtn" class="btn btn-success btn-sm text-right"/></div>
        </div>
        <div class="row" id="idSearch"></div>
      </div>
      <div class="modal-body">
        <table class="table table-hover">
          <tr class="table-dark text-dark">
            <th>번호</th>
            <th>아이디</th>
            <th>닉네임</th>
          </tr>
          <c:forEach var="vo" items="${vos}" varStatus="st">
            <tr>
              <td>${st.count}</td>
              <td><a href="MemberMessage.msg?receiverId=${vo.mid}">${vo.mid}</a></td>
              <td>${vo.nickName}</td>
            </tr>
          </c:forEach>
          <tr><td colspan="3" class="m-0 p-0"></td></tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- 받은/보낸 메세지 내용을 모달로 보여주기 -->
<div class="modal" id="myModal2">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="m-3">
        <div class="row">
          <div class="col"><h4 class="text-center">메세지 내용</h4></div>
        </div>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
	        <tr>
	        	<th style="width:20%;">보낸사람</th>
	        	<td style="width:75%;"><span id="senderId"></span></td>
	        </tr>
	        <tr>
	        	<th style="width:20%;">보낸날짜</th>
	        	<td style="width:75%;"><span id="msgDate"></span></td>
	        </tr>
	        <tr>
	          <th style="background-color:#ccc;">내용</th>
	          <td><span id="content"></span></td>
	        </tr>
        </table>
      </div>
      <div class="modal-footer row">
        <div class="col text-left">
          <c:if test="${msgFlag == 'r'}"><button type="button" onclick="messageReplyInput()" class="btn btn-primary">답글쓰기</button></c:if>
        </div>
        <div class="col text-right"><button type="button" class="btn btn-danger" data-dismiss="modal">Close</button></div>
      </div>
    </div>
  </div>
</div>

<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>