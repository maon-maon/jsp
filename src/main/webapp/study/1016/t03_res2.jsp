<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String name = request.getParameter("name");
  String age = request.getParameter("age");
  String gender = request.getParameter("gender");
  String hobby = request.getParameter("hobby");
  /* String job = request.getParameter("job");
  String mountain = request.getParameter("mountain");
  String content = request.getParameter("content");
  String fName = request.getParameter("fName");
  String title = request.getParameter("title");
  if(title == null) title = (String) request.getAttribute("title"); */
  
  /*서버 저장소 pageContext : 페이지가 남아있으면 메모리를 불러와 데이터를 가져와서 사용할 수 있음
						request : 일회성. 도착시 소멸됨. 메모리에 안 남음. 대부분 request를 사용*/
  /* request.setAttribute("name", name); */
  pageContext.setAttribute("name", name);
  pageContext.setAttribute("age", age);
  pageContext.setAttribute("gender", gender);
  pageContext.setAttribute("hobby", hobby);
  
  pageContext.setAttribute("job", request.getParameter("job"));
  pageContext.setAttribute("mountain", request.getParameter("mountain"));
  pageContext.setAttribute("content", request.getParameter("content"));
  pageContext.setAttribute("fName", request.getParameter("fName"));
  pageContext.setAttribute("title", request.getParameter("title"));
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t03_res2.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    th {
      text-align: center;
      background-color: #eee;
    }
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 class="text-center">전송된 자료(${title})</h2>
  <hr/>
  <table class="table table-bordered">
    <tr>
      <th>성명</th>
      <td>${name} : ${name}</td>
      <!-- EL표기법 : 서버 저장소에서 자료를 꺼내오는 방법 : $ { }  -->
    </tr>
    <tr>
      <th>나이</th>
      <td>${age} : ${age}</td>
    </tr>
    <tr>
      <th>성별</th>
      <td>${gender}</td>
    </tr>
    <tr>
      <th>취미</th>
      <td>${hobby}</td>
    </tr>
    <tr>
      <th>현재직업</th>
      <td>${job}</td>
    </tr>
    <tr>
      <th>다녀온산</th>
      <td>${mountain}</td>
    </tr>
    <tr>
      <th>자기소개</th>
      <td>${content}</td>
    </tr>
    <tr>
      <th>첨부파일</th>
      <td>${fName}</td>
    </tr>
    <tr>
      <td colspan="2" class="text-center">
        <input type="button" value="돌아가기" onclick="location.href='<%=request.getContextPath()%>/study/1016/t03_Form2.jsp';" class="form-control btn-success"/>
      </td>
    </tr>
  </table>
</div>
<p><br/></p>
</body>
</html>