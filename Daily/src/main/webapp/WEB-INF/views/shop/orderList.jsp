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
/*
section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:300px; height:350px; }
 section#content div.goodsName { padding:10px 0; text-align:left; }
 section#content div.goodsName a { color:#000; font-size: 20px; text-align:left;}
*/

 section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
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
			 <ul class="orderList">
  <c:forEach items="${orderList}" var="orderList">
  <li>
  <div>
   <p><span>주문번호</span><a href="/shop/orderView?n=${orderList.orderid}">${orderList.orderid}</a></p>
   <p><span>수령인</span>${orderList.orderRec}</p>
   <p><span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
   <p><span>상태</span>${orderList.delivery}</p>

  </div>
  </li>
  </c:forEach>
 </ul>

		</section>
	</div>


	

</body>
</html>