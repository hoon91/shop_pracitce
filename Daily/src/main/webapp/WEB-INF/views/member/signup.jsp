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
<%@ include file="../include/header.jsp" %>

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
			<form class="form-horizontal" action="/member/signup" method="post">
				
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">ID</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputId" placeholder="ID" name="userid">
						<button class="btn btn-default btn-sm" id="idCheck">ID 중복체크</button>
						<span></span>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword" placeholder="Password" name="userpw">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputPassword2" class="col-sm-2 control-label">Confirm Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword2" placeholder="Password">
					</div>
				</div>		
						
				<div class="form-group">
					<label for="inputName" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputName" placeholder="Name" name="username">
					</div>
				</div>		
				
				<div class="form-group">
					<label for="inputAdd" class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
    				<input type="text" id="postcode" name="postcode" placeholder="우편번호">&nbsp;
        			<input type="button" class="btn btn-default btn-sm" id="searchAdd" value="우편번호 찾기"><br>
    				<input type="text" id="roadAddress" name="useraddress" placeholder="도로명주소">
    				<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
    				</div>
				</div>
			
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">Tel</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="inputEmail" placeholder="Tel" name="tel">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputBirth" class="col-sm-2 control-label">Bitrh</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" id="inputBirth" placeholder="Birth" name="birthDate">
					</div>
				</div>	
							
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">회원 가입</button>
					</div>
				</div>
				
			</form>
		</div><!-- class=row -->
	</div><!-- class=container -->
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$("#idCheck").click(function(event) {
		event.preventDefault();
		var inputId = $("#inputId").val(); 
		
		$.ajax({
			
			type : 'post',
			url : '/member/idCheck',
			data : {
				userid : inputId
			},
			dataType : 'text',
			success : function(result) {
				
				if (result == 1) {
					var span = $("#idCheck").next();
					span.html("중복된 ID 입니다.");
					$("#inputId").focus();
				} else {
					var span = $("#idCheck").next();
					span.html("사용 가능한 ID 입니다.");
				}
			}
		});
		
	});
});


$("#searchAdd").click(function(event) {
	event.preventDefault();
	postcode();

});



function postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            
        }

    }).open();
}

</script>



</body>

</html>