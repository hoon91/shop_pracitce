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
<script type="text/javascript">

//댓글
function replyList() {
 var gdsNum = ${view.gdsNum};
 $.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data){
  var str = "";
  
  $(data).each(function(){
  
   console.log(data);
   
   var repDate = new Date(this.repDate);
   repDate = repDate.toLocaleDateString("ko-US")
   
  str += "<li data-repNum='" + this.repNum + "'>"
  + "<div class='userInfo' align='left'>"
  + "<span class='userid'>" + this.userid + "</span>"
  + "<span class='date'>" + repDate + "</span>"
  + "<c:if test='${member != null}'>"
  + "<button type='button' class='modify btn btn-default' data-repNum='" + this.repNum + "'>수정</button>"
  + "<button type='button' class='delete btn btn-default' data-repNum='" + this.repNum + "'>삭제</button>"
  + "</c:if>"
  + "</div>"
  + "<div class='replyContent' align='left'>" + this.repCon + "</div>"
  + "</li>";           
  });
  
  $("section.replyList ol").html(str);
 });
 
}


//댓글작성버튼
$("#reply_btn").click(function(){
	  
	  var formObj = $(".replyForm form[role='form']");
	  var gdsNum = $("#gdsNum").val();
	  var repCon = $("#repCon").val()
	  
	  var data = {
	    gdsNum : gdsNum,
	    repCon : repCon
	    };
	  
	  $.ajax({
	   url : "/shop/view/registReply",
	   type : "post",
	   data : data,
	   success : function(){
	    replyList();
	    $("#repCon").val("");
	   }
	  });
	 });
 
 
 
 
// 댓글 삭제
 $(document).on("click", ".delete", function(){
  
	var deletConfirm = confirm("정말로 삭제하시겠습니까?");
	
	if(deletConfirm) {
	 
	 
  var data = {repNum : $(this).attr("data-repNum")};
   
  $.ajax({
   url : "/shop/view/deleteReply",
   type : "post",
   data : data,
   success : function(result){
	   
	   if(result == 1) {
	    replyList();
	   } else {
	    alert("작성자 본인만 할 수 있습니다.");     
	   }
	  },
	  error : function() {
		  alert("로그인하셔야합니다.")
	  }
  });
	}
 });


 // 댓글 수정
 $(document).on("click", ".modify", function(){
	// $(".replyModal").attr("style", "display:block;");
	 $(".replyModal").fadeIn(200);
	 
	 var repNum = $(this).attr("data-repNum");
	 var repCon = $(this).parent().parent().children(".replyContent").text();
	 
	 $(".modal_repCon").val(repCon);
	 $(".modal_modify_btn").attr("data-repNum", repNum);
	 
	});
	 
</script>
<style>
 div.goods div.goodsImg { float:left; width:550px; }
 div.goods div.goodsImg img { width: 450px; height:auto;  margin:30px 0 0 100px;}
 
 div.goods div.goodsInfo { float:right; width:500px; font-size:15px; }
 div.goods div.goodsInfo label { margin:0 10px 0 0; }
 div.goods div.goodsInfo p span { display:inline-block; width:100px;  }
 
 div.goods div.goodsInfo p.cartStock input { font-size:22px; width:30px; padding:5px; margin:0; border:1px solid #eee; }
 div.goods div.goodsInfo p.cartStock button { font-size:15px; padding:20px; border:none; background:none;}
 div.goods div.goodsInfo p.addToCart { text-align:left; padding:10px;}
 div.goods div.gdsDes { font-size:15px; clear:both; padding-top:15px; }


section.replyForm { padding:10px 0; }
 section.replyForm div.input_area { margin:10px 0; }
 section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:1000px; height:40px; }
 section.replyForm button { font-size:15px; padding:5px 10px; margin:0;}
 
 section.replyList { padding:0; }
 section.replyList ol { padding:0; margin:0; }
 section.replyList ol li { padding:0; border-bottom:2px solid #eee; }
 section.replyList div.userInfo .userid { font-size:20px; font-weight:bold; }
 section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
 section.replyList div.replyContent { padding:5px; margin:5px 0; }
section.replyList div.userInfo button { font-size:14px; margin-right:10px; }


div.replyModal { position:relative; z-index:1; display:none;}
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:480px; height:100px; }
 div.modalContent button {padding:5px 5px; margin:10px 0; }

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

	<section class="container">
	<section id="content">
	<div id="container_box">
		
			<form role="form" method="post">
 <input type="hidden" name="gdsNum" value="${view.gdsNum}" id="gdsNum" />
</form>

<div class="goods">
 <div class="goodsImg">
  <img src="${view.gdsImg}">
 </div>
 
 <div class="goodsInfo">
  <div class="gdsName"><h1 class="page-header" style="text-align: center; margin-bottom: 50px; font-size: 25px; color:gray;">
  ${view.gdsName}</h1>
  </div>
  
  <div class="gdsPrice form-group"  style="text-align: left;" >
   <label>가격 </label>&nbsp;<span><fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" /> 원</span>
   <input type="hidden" value="${view.gdsPrice}" id="price">
  </div>
  
  <div class="gdsStock form-group">
   <label>재고 </label>&nbsp;<fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}" /> EA
  </div>
  
  <div class="form-group" style="text-align: left;">
	<label>사이즈</label> 
	<select  class="form-control opt_select" id="gdsSize" name="gdsSize">
		<option value="S">S</option>
		<option value="M">M</option>
		<option value="L">L</option>
		<option value="XL">XL</option>
	</select>
</div>
  
 <c:if test="${view.gdsStock != 0}">
  
  <div class="cartStock">
   <label>구매수량 </label> 
    <button type="button" class="plus btn btn-default">+</button>
   <input type="number" class="numBox" min="1" max="${view.gdsStock}" value="1" id="select_count" readonly="readonly"/> 
   <button type="button" class="minus btn btn-default">-</button>
	<!--<select class="numBox form-control" id="select_count" >
	  <c:forEach begin="1" end="${view.gdsStock}" var="count" > -->	
			
		<!--	<option>${count}</option>
			</c:forEach>
	</select> -->
	
	 <script>
  $(".plus").click(function(){
   var num = $(".numBox").val();
   var plusNum = Number(num) + 1;
   
   if(plusNum >= ${view.gdsStock}) {
    $(".numBox").val(num);
   } else {
    $(".numBox").val(plusNum);          
   }
  });
  
  $(".minus").click(function(){
   var num = $(".numBox").val();
   var minusNum = Number(num) - 1;
   
   if(minusNum <= 0) {
    $(".numBox").val(num);
   } else {
    $(".numBox").val(minusNum);          
   }
  });
 </script>
  </div>
  <hr>
  
 	<div style="font-size: 13px; padding:15px;">
		<div class="selected_option" style="text-align: right;">
	</div>

 <div style="font-size: 13px; padding:15px;" >
  	<label>배송비 : </label><span>&nbsp;2,500원</span>
	<p>도서산간지역 배송비 5000원 / 3만원 이상 결제시 무료배송</p>
 </div>

  <div class="addToCart" align="center">
   <button type="button" class="addCart_btn btn btn-default">카트에 담기</button>
   <button type="button" class="btn btn-default">찜</button>
  </div>
	
</div>
	</c:if>
	
	<c:if test="${view.gdsStock == 0 }">
		<p> 상품 수량이 부족합니다.</p>
	</c:if>
	
</div>
</div>
</div>

	</section>

</section>		
		<hr>
	<div class="container">
		<div class="row nav">
			<ul class="nav-tabs nav-justified" style="text-align: center">
				<li id="about">상품상세</li>
				<li id="review">리뷰</li>
				<li id="qna">상품문의</li>
			</ul>
	
			
			<h1 class="jumbotron" align="center">
				<div>
					<h1>DAILY</h1>
					<small>WELCOME TO DAILY</small>
				</div>
			</h1>
			
	
		
		<div class="row" style="text-align: center;">
			<h1 class="page-header">상품 상세</h1>
				${view.gdsDes}
		</div>
		
		<div class="row reviews" style="text-align: center;">
			<h1 class="page-header" style="margin-bottom: 50px;">Review</h1>
			
			<div id="reply">
			 <c:if test="${member == null }">
  				<p style="font-size: 25px;">소감을 남기시려면 <a href="/member/login">로그인</a>해주세요</p>
				 </c:if>
 
 <c:if test="${member != null}">
 <section class="replyForm">
  <form role="form" method="post" autocomplete="off">
  <input type="hidden" name="gdsNum" value="${view.gdsNum}">
   <div class="input_area">
    <textarea name="repCon" id="repCon" class="col-sm-4 control-label" placeholder="리뷰를 남겨주세요"></textarea>
     <button type="button" id="reply_btn" class="btn btn-default">리뷰 작성</button>
   </div>
 </form>
 </section>
 </c:if>
 
  	</div>

 <hr>
 
 <section class="replyList">
  <ol>
  <!-- 
 <c:forEach items="${reply}" var="reply">

  <li>
      <div class="userInfo"  align="left">
       <span class="userid">${reply.userid}</span>
       <span class="date"><fmt:formatDate value="${reply.repDate}" pattern="yyyy-MM-dd" /></span>
      </div>
      <div class="replyContent"  align="left">${reply.repCon}</div>
    </li>
   </c:forEach>
 -->
  
</ol>

  <script type="text/javascript">
  replyList();
  </script>


</section>
</div>
			<!--  
			<c:forEach begin="1" end="5">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Panel title</h3>
				</div>
				<div class="panel-body">Panel content</div>
			</div>
			</c:forEach>
			-->
		</div>

		<div class="row qnas" style="text-align: center; height: 700px;">
			<h1 class="page-header">상품 Q&A</h1>
            /* Q&A 테이블 */
		</div>

	</div>






<div class="replyModal">

 <div class="modalContent">
  
  <div>
   <textarea class="modal_repCon" name="modal_repCon"></textarea>
  </div>
  
  <div>
   <button type="button" class="modal_modify_btn btn btn-warning">수정</button>
   <button type="button" class="modal_cancel btn btn-danger">취소</button>
  </div>
  
 </div>

 <div class="modalBackground"></div>
 
</div>
	

<script>
var gdsNum = $("#gdsNum").val();

$.getJSON("/shop/view?n=" + gdsNum, function(result) {
	
	var str = '';
	
	$(result).each(function() {
		var data = this;
		
		str += makeHtmlcode_read(data);
			
	});
	
	$(".about_product").append(str);
	
});


$("#review").click(function() {
	
	var scrollPosition = $(".reviews").offset().top;
	$("html").animate({scrollTop: scrollPosition}, 500); 
});

$("#qna").click(function() {

	var scrollPosition = $(".qnas").offset().top;
	$("html").animate({scrollTop: scrollPosition}, 500); 
});

$("#about").click(function() {
	
	var scrollPosition = $(".about_product").offset().top;
	$("html").animate({scrollTop: scrollPosition}, 500); 
});


$("#select_count").on('blur', function() {
	var count = $(this).val();
	var price = $("#price").val();
	var opt = $(".opt_select").val();
	
	
	if (count*price >= 30000) {
		var shipping = '무료배송';
		var finalPrice = count*price;
	} else {
		var shipping = 2500;
		var finalPrice = (count*price) + shipping;
	}
	
	var str = '';
	
	str += '<p><label>수량 : </label><span>' + count + '</span>&nbsp;&nbsp;&nbsp;';	
	
	if (opt != 'S' && opt != 'M' && opt != 'L' && opt != 'XL') {
		str += '<lable></lable>';
	} else {
		str += '<label>옵션 : </label><span>' + opt + '</span>&nbsp;&nbsp;&nbsp;';	
	}
	
	str += '<label>배송비 : </label><span>&nbsp;' + shipping + '</span>&nbsp;&nbsp;&nbsp;';
	str	+= '<label>가격 : </label><span>&nbsp;' + price + ' 원</span></p>';
	str += '<h4><label>결제금액 : </label><span>&nbsp;' + finalPrice + ' 원</span></h4>'; 
	str += '<span class="glyphicon glyphicon-exclamation-remove"></span>';
	
	$(".selected_option").html(str);
});

</script>

<script>
$(".addCart_btn").click(function(){
	  var gdsNum = $("#gdsNum").val();
	  var cartStock = $(".numBox").val();
	           
	  var data = {
	    gdsNum : gdsNum,
	    cartStock : cartStock
	    };
	  
	  $.ajax({
	   url : "/shop/view/addCart",
	   type : "post",
	   data : data,
	   success : function(result){
	    
	    if(result == 1) {
	     alert("카트 담기 성공");
	     $(".numBox").val("1");
	    } else {
	     alert("회원만 사용할 수 있습니다.")
	     $(".numBox").val("1");
	    }
	   },
	   error : function(){
	    alert("카트 담기 실패");
	   }
	  });
	 });


$(".modal_cancel").click(function(){
//	 $(".replyModal").attr("style", "display:none;");
	 $(".replyModal").fadeOut(200);
});



$(".modal_modify_btn").click(function(){
	 var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	 
	 if(modifyConfirm) {
	  var data = {
	     repNum : $(this).attr("data-repNum"),
	     repCon : $(".modal_repCon").val()
	    };  // ReplyVO 형태로 데이터 생성
	  
	  $.ajax({
	   url : "/shop/view/modifyReply",
	   type : "post",
	   data : data,
	   success : function(result){
	    
	    if(result == 1) {
	     replyList();
	     $(".replyModal").fadeOut(200);
	    } else {
	     alert("작성자 본인만 할 수 있습니다.");       
	    }
	   },
	   error : function(){
	    alert("로그인하셔야합니다.")
	   }
	  });
	 }
	 
	});

</script>

</body>
</html>