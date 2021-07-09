<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
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
	
	<aside>
		<%@ include file="include/aside.jsp" %>
	</aside>

	<section class="container">
		<div class="container_box">
			<h1 class="jumbotron" style="text-align: center; margin: 50px 0;">회원 리스트</h1>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>회원ID</th>
						<th>이름</th>
						<th>Email</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>생일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.userid}</td>
							<td>${vo.username}</td>
							<td>${vo.email}</td>
							<td>${vo.tel}</td>
							<td>${vo.useraddress}</td>
							<td>${vo.birthDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
</section>
		
</body>
</html>