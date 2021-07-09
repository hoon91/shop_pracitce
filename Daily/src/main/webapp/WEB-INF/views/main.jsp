<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="include/header.jsp" %>
<!-- resources에 만들어뒀던 css 적용을 위한 링크태그 -->
</head>
<body>


	<div id="gnb">
		<%@ include file="include/gnb.jsp" %>
	</div>

	<div class="logo">
		<h1><a href="/">DAILY</a></h1>
	</div>

	<div id="nav">
		<%@ include file="include/nav.jsp" %>
	</div>
	
	<div class="container">
		<div class="content">
		<h1>컨텐츠 영역</h1>
	</div>

</div>



</body>
</html>
