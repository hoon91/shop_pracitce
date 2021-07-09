<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:300px; height:350px; }
 section#content div.goodsName { padding:10px 0; text-align:left; }
 section#content div.goodsName a { color:#000; font-size: 20px; text-align:left;}
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

	<div class="content" align="center">

		<section id="content">
			<ul>
				<c:forEach items="${list}" var="list">
					<li>
						<div class="goodsThumb">
							<a href="/shop/view?n=${list.gdsNum}"><img src="${list.gdsThumbImg}"></a>
						</div>
						<div style="height:2px;border-bottom:1px solid #e3e3e3;margin-bottom:0px;"></div>
						<div class="goodsName">
							<a href="/shop/view?n=${list.gdsNum}">${list.gdsName}</a>
							<h4>${list.gdsPrice} <span>원</span></h4>

						</div>
					</li>
				</c:forEach>
			</ul>


		</section>
	</div>


	

</body>
</html>