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
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<style>

section#content ul li { margin:50px 0; }
 section#content ul li img { width:250px; height:250px; }
 section#content ul li::after { content:""; display:block; clear:both; }
 section#content div.thumb { float:left; width:700px; }
/* section#content div.gdsInfo { float:left; width:900px; }*/
 section#content div.gdsInfo { font-size:20px; line-height:2; }
 section#content div.gdsInfo span { display:inline-block; width:150px; font-weight:bold; margin-right:10px; }

 .allCheck { float:right; width:400px; }
.allCheck input { width:16px; height:16px; }
.allCheck label { margin-left:10px;}
.delBtn {width:400px;}
.delBtn button { font-size:18px; padding:5px 10px;}

.checkBox { float:left; width:350px; }
.checkBox input { width:16px; height:16px; }

.listResult { padding:20px; background:#eee; }
.listResult .sum { float:right; width:45%; font-size:22px; }

.listResult .orderOpne { float:center; width:45%; text-align:right; }
.listResult .orderOpne button { font-size:18px;}
.listResult::after { content:""; display:block; clear:both; }

.orderInfo { border:5px solid #eee; padding:20px; display: none; }
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-left:20px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }

.orderInfo .inputArea:last-child { margin-top:30px; }

.orderInfo .inputArea #sample2_address { width:230px; }
.orderInfo .inputArea #sample2_detailAddress { width:280px; }
.orderInfo .inputArea #sample2_extraAddress { display:none; }

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
			<li>
  <div class="allCheck">
   <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
    <button type="button" class="selectDelete_btn btn btn-default">선택 삭제</button> 
   <script>
$("#allCheck").click(function(){
 var chk = $("#allCheck").prop("checked");
 if(chk) {
  $(".chBox").prop("checked", true);
 } else {
  $(".chBox").prop("checked", false);
 }
});
</script>


  
   
   <script>
 $(".selectDelete_btn").click(function(){
  var confirm_val = confirm("정말 삭제하시겠습니까?");
  
  if(confirm_val) {
   var checkArr = new Array();
   
   $("input[class='chBox']:checked").each(function(){
    checkArr.push($(this).attr("data-cartNum"));
   });
    
   $.ajax({
    url : "/shop/deleteCart",
    type : "post",
    data : { chbox : checkArr },
    success : function(){
     location.href = "/shop/cartList";
    }
   });
  } 
 });
</script>
   
   
  </div>
  
 </li>
			
 <c:set var="sum" value="0"/>
  
  <c:forEach items="${cartList}" var="cartList">
  <li>
  
   <div class="checkBox">
   <input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
  
  <script>
 $(".chBox").click(function(){
  $("#allCheck").prop("checked", false);
 });
</script>
  
  
  </div>
  
  <hr>
  
   <div class="thumb">
    <img src="${cartList.gdsThumbImg}" />
   </div>
   <div class="gdsInfo" align="left">
    <p>
     <span>상품명 : </span>${cartList.gdsName}<br />
     <span>개당 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" />원<br />
     <span>구입 수량 : </span>${cartList.cartStock} 개<br />
	<span>사이즈:</span> <%=request.getParameter("gdsSize") %><br>
     <span>최종 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" />
    </p>    
    
     <div class="delete">
    <button type="button" class="delete_${cartList.cartNum}_btn btn btn-default" data-cartNum="${cartList.cartNum}">삭제</button>
   
    <script>

$(".delete_${cartList.cartNum}_btn").click(function(){
	  var confirm_val = confirm("정말 삭제하시겠습니까?");
	  
	  if(confirm_val) {
	   var checkArr = new Array();
	   
	   checkArr.push($(this).attr("data-cartNum"));
	              
	   $.ajax({
	    url : "/shop/deleteCart",
	    type : "post",
	    data : { chbox : checkArr },
	    success : function(result){
	     if(result == 1) {            
	      location.href = "/shop/cartList";
	     } else {
	      alert("삭제 실패");
	     }
	    }
	   });
	  } 
	 });

</script>
    
    
    </div>
    
   </div>
  </li>
  
  <c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
  
  </c:forEach>
 </ul>
 
 <div class="listResult">
 <div class="sum">
  총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원 &nbsp;
  <button type="button" class="orderOpne_bnt btn btn-default">주문 정보 입력</button>
 
 <script>
 $(".orderOpne_bnt").click(function(){
  $(".orderInfo").slideDown();
  $(".orderOpne_bnt").slideUp();
 });      
</script>
 
 </div>
</div>
 
 <div class="orderInfo" align="center">
 <form role="form" method="post" autocomplete="off">
    
  <input type="hidden" name="amount" value="${sum}" />
    
  <div class="inputArea">
   <label for="">수령인</label>
   <input type="text" name="orderRec" id="orderRec" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="orderPhon">수령인 연락처</label>
   <input type="text" name="orderPhon" id="orderPhon" required="required" />
  </div>
 <!--  
  <div class="inputArea">
   <label for="userAddr1">우편번호</label>
   <input type="text" name="userAddr1" id="userAddr1" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="userAddr2">1차 주소</label>
   <input type="text" name="userAddr2" id="userAddr2" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="userAddr3">2차 주소</label>
   <input type="text" name="userAddr3" id="userAddr3" required="required" />
  </div>
   -->
   <div class="inputArea">
					
						<p>
							<input type="text" id="sample2_postcode" placeholder="우편번호">
							<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
						</p>
						<p>
							<input type="text" name="userAddr1" id="sample2_address" placeholder="주소" >
							<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소">
							<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목">
						</p>
						
						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script>
						    // 우편번호 찾기 화면을 넣을 element
						    var element_layer = document.getElementById('layer');
						
						    function closeDaumPostcode() {
						        // iframe을 넣은 element를 안보이게 한다.
						        element_layer.style.display = 'none';
						    }
						
						    function sample2_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var addr = ''; // 주소 변수
						                var extraAddr = ''; // 참고항목 변수
						
						                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    addr = data.roadAddress;
						                } else { // 사용자가 지번 주소를 선택했을 경우(J)
						                    addr = data.jibunAddress;
						                }
						
						                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						                if(data.userSelectedType === 'R'){
						                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있고, 공동주택일 경우 추가한다.
						                    if(data.buildingName !== '' && data.apartment === 'Y'){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                    if(extraAddr !== ''){
						                        extraAddr = ' (' + extraAddr + ')';
						                    }
						                    // 조합된 참고항목을 해당 필드에 넣는다.
						                    document.getElementById("sample2_extraAddress").value = extraAddr;
						                
						                } else {
						                    document.getElementById("sample2_extraAddress").value = '';
						                }
						
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById('sample2_postcode').value = data.zonecode;
						                document.getElementById("sample2_address").value = addr;
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("sample2_detailAddress").focus();
						
						                // iframe을 넣은 element를 안보이게 한다.
						                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						                element_layer.style.display = 'none';
						            },
						            width : '100%',
						            height : '100%',
						            maxSuggestItems : 5
						        }).embed(element_layer);
						
						        // iframe을 넣은 element를 보이게 한다.
						        element_layer.style.display = 'block';
						
						        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
						        initLayerPosition();
						    }
						
						    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
						    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
						    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
						    function initLayerPosition(){
						        var width = 300; //우편번호서비스가 들어갈 element의 width
						        var height = 400; //우편번호서비스가 들어갈 element의 height
						        var borderWidth = 5; //샘플에서 사용하는 border의 두께
						
						        // 위에서 선언한 값들을 실제 element에 넣는다.
						        element_layer.style.width = width + 'px';
						        element_layer.style.height = height + 'px';
						        element_layer.style.border = borderWidth + 'px solid';
						        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
						        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
						        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
						    }
						</script>
					</div>  
   
   
  <div class="inputArea">
   <button type="submit" class="order_btn btn btn-default">주문</button>
   <button type="button" class="cancel_btn btn btn-default">취소</button> 
   
   <script>
$(".cancel_btn").click(function(){
 $(".orderInfo").slideUp();
 $(".orderOpne_bnt").slideDown();
});      
</script>

  </div>
 
 </form> 
</div>
 
</section>
	</div>


</body>
</html>