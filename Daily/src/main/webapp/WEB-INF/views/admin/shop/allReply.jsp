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
/*
 div.container_box ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }

 div.container_box .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
*/
.container_box ul li { margin-bottom:20px; border:10px solid #eee; }
.replyInfo { background:#eee; padding:10px; font-size:18px; }
.replyInfo span { font-size:20px; font-weight:bold; margin-right:20px; }
.replyContent { padding:10px; }

.replyControll {text-align:right; padding:10px; }
.replyControll button { border:2px solid #999; background:#fff; }
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
			<ul>
  <c:forEach items="${reply}" var="reply">
  <li>
   <div class="replyInfo">
    <p>
     <span>작성자</span>${reply.userid}
    </p>
    <p>
     <span>작성된 상품</span> <a href="/shop/view?n=${reply.gdsNum}">바로가기</a>
    </p>
   </div>
   <div class="replyContent">
    ${reply.repCon}
   </div>
   
   <div class="replyControll">
 <form role="form" method="post">
  <input type="hidden" name="repNum" value="${reply.repNum}" />
  <button type="submit" class="delete_${reply.repNum}_btn">삭제</button>
 </form>
</div>
   
  </li>     
  </c:forEach>
 </ul>
		</div>
</section>
		
</body>
</html>