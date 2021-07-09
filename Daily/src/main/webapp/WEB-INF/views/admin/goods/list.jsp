<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style>
.inputArea { margin:5px 0; }
select { width:100px; }
label { display:inline-block; width:70px; padding:5px; }
label[for='gdsDes'] { display:block; }
input { width:150px; }
textarea#gdsDes { width:400px; height:180px; }


.container_box table th { font-size:15px; font-weight:bold;
							text-align:center; padding:10px; border-bottom:2px solid #666; }
.container_box table tr:hover { background:#eee; }
.container_box table td { padding:10px; text-align:center; }
.container_box table img { width:150px; height:auto; }
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

	<aside>
		<%@ include file="../include/aside.jsp" %>
	</aside>
		
	<section class="container">
		<div class="container_box">
			<h1 class="jumbotron" style="text-align: center; margin: 50px 0;">상품 목록</h1>
	<table class="table table-hover">
 <thead>
  <tr>
   <th>이미지</th>
   <th>이름</th>
   <th>카테고리</th>
   <th>가격</th>
   <th>수량</th>
   <th>등록날짜</th>
  </tr>
 </thead>
 <tbody>
 <c:forEach items="${list}" var="list">
<tr>
 <td>
  <img src="${list.gdsThumbImg}">
 </td>
 <td>
  <a href="/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a>
 </td>
 <td>
  <!-- ${list.cateCode} -->
  ${list.cateName}
 </td>
 <td>
  <fmt:formatNumber value="${list.gdsPrice}"  pattern="###,###,###"/>
 </td>
 <td>${list.gdsStock}</td>
 <td>
  <fmt:formatDate value="${list.gdsDate}" pattern="yyyy-MM-dd" />
 </td>
</tr>   
</c:forEach>
 </tbody>
</table>
	
</div>
</section>
		
		


</body>
</html>