<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 보기</title>
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
			<h1>회원 가입 화면</h1>
		</div>
		<div class="row">
			<div class="form-horizontal">
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">ID</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputId" placeholder="ID" name="userid" value="${userInfo.userid}" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputName" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputName" placeholder="Name" name="username" value="${userInfo.username}" readonly>
					</div>
				</div>				
				<div class="form-group">
					<label for="inputAdd" class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputAdd" placeholder="Address" name="useraddress" value="${userInfo.useraddress}" readonly>
					</div>
				</div>				
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email" value="${userInfo.email}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">Tel</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="inputEmail" placeholder="Tel" name="tel" value="${userInfo.tel}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="inputBirth" class="col-sm-2 control-label">Bitrh</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputBirth" placeholder="Birth" name="birthDate" value="${userInfo.birthDate}" readonly>
					</div>
				</div>				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button class="btn btn-default" id="update_userInfo">회원정보 수정</button>
						<button class="btn btn-default" id="back_to_main">메인으로 돌아가기 </button>
						<button class="btn btn-default" id="delete">회원탈퇴 </button>
					</div>
				</div>
			</div>
		</div><!-- class=row -->
	</div><!-- class=container -->
</div>

<script type="text/javascript">
	$(document).ready(function () {
		$("#back_to_main").click(function() {
			location.assign("/");
		});
	});
	
	$("#update_userInfo").click(function() {
		var userid = $("#inputId").val();
		location.assign("/member/update/" + userid);
	});

	$("#delete").click(function() {
		var userid = $("#inputId").val();
		location.assign("/member/delete/" + userid);
	});
	
</script>


</body>

</html>