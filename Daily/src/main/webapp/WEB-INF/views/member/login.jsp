<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../include/header.jsp" %>
<style type="text/css">
	.btn {
		margin-top: 10px;
	}
	
	h1{
		text-align: center;
		padding: 10px;
	}
</style>
</head>
<body>

	<div id="gnb">
		<%@ include file="../include/gnb.jsp" %>
	</div>

	<div class="logo">
		<h1><a href="/">DAILY</a></h1>
	</div>

	<div id="nav">
		<%@ include file="../include/nav.jsp" %>
	</div>
	
	<div class="container">
		<div class="content">
		<div class="row">
			<form class="form-horizontal" method="post">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-4 control-label">ID</label>
					<div class="col-sm-4">
						<input id="inputEmail3" class="form-control" name="userid" placeholder="ID">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-4 control-label">Password</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="inputPassword3" name="userpw" placeholder="Password">
					</div>
				</div>
				
				<br>

				<div class="form-group" id="buttons">
					<div class="col-sm-offset-2 col-sm-10">
						<label class="col-sm-4 control-label"></label>
						<button type="submit" id="login" class="btn btn-default">로그인</button>
						<button type="button" id="signup_page" class="btn btn-default">회원가입</button>
					</div>
				</div>
				
				<c:if test ="${msg ==false}">
					<p style="color:#f00; text-align: center;"> 로그인에 실패했습니다</p>
				</c:if>
				
				
				<div class="form-group text-center">		
					<h3>ID와 비밀번호를 잊어버리셨나요?</h3>
					<Br>
					<button class="btn btn-default">ID 찾기</button>
					<button class="btn btn-default">비밀번호 찾기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
$("#signup_page").click(function(event) {
	event.preventDefault();

	location.assign("/member/signup");
});
</script>

</body>
</html>