<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<style>
 div.container_box ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }

 div.container_box .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>

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
			<h1 class="jumbotron" style="text-align: center; margin: 50px 0;">회원 리스트</h1>
			<ul class="orderList">
				<c:forEach items="${orderList}" var="orderList">
					<li>
						<div>
							<p>
								<span>주문번호</span><a
									href="/admin/shop/orderView?n=${orderList.orderid}">${orderList.orderid}</a>
							</p>
							<p>
								<span>주문자</span>${orderList.userid}</p>
							<p>
								<span>수령인</span>${orderList.orderRec}</p>
							<p>
								<span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2}
								${orderList.userAddr3}
							</p>
							<p>
								<span>가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderList.amount}" />
								원
							</p>
							<p><span>상태</span>${orderList.delivery}</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
</section>
		
</body>
</html>