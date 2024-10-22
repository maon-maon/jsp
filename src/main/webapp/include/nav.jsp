<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="${ctp}/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#">Guest</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pds</a>
      </li>    
      <li class="nav-item">
				<div class="dropdown">
			    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
			      Study1
			    </button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="${ctp}/mapping/Test1">mapping 연습</a>
			      <a class="dropdown-item" href="${ctp}/study2/test/StorageMenu">Storage연습</a> <!-- 스토리지 호출 컨트롤러 줒 주소로 넣음 -->
			      <a class="dropdown-item" href="${ctp}/study/1018_JSTL/el.jsp">EL연습</a>
			      <a class="dropdown-item" href="${ctp}/study2/test/JstlMenu">JSTL연습</a> <!-- 컨트롤러(JstlMenu)가 각jstl페이지를 연결 -->
			      <%-- <a class="dropdown-item" href="${ctp}/study/1018_JSTL/jstlMenu.jsp">JSTL연습</a> --%>
			    </div>
			  </div>
      </li>    
    </ul>
  </div>  
</nav>