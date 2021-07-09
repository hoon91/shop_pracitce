<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<nav class="navbar navbar-inverse">
<div align="right">
	<c:choose>
		<c:when test="${member.userid != null}">
			<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
			<span id="login_log" style="border-bottom: 1px solid white;">${member.userid}님, 환영합니다.</span>
			<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${member.userid == 'admin'}">
					<a href="/admin/main">관리자 페이지</a>
					</c:if>
					<a href="/member/read/${member.userid}">마이페이지</a>
					<a href="/shop/cartList">내 카트</a>
					<a href="/shop/orderList">주문 목록</a>
					<a href="/member/logout" id="logout_btn" >로그아웃</a>
		</c:when>
		<c:otherwise>
			<a href="/member/login" >로그인</a>
			<a href="/member/signup">회원가입</a>
		</c:otherwise>
	</c:choose>
</div>
</nav>

<script>
$("#logout_btn").click(function(event) {
	event.preventDefault();
	
	var logout = confirm("로그아웃 하시겠습니까?");
	
	if (logout) {
		location.assign("/member/logout");
	}
});

$("#go_to_adminPage").click(function(event) {
	event.preventDefault();
	location.assign("/admin/main");
});

</script>