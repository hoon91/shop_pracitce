<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.oriImg {width:500px; height:auto;}
.thumbImg {}
.gdsDes img { max-width:100%; height:auto; }

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
	
	<form role="form" method="post" autocomplete="off">
	
	<input type="hidden" name="n" value="${goods.gdsNum}" />

<div class="inputArea"> 
 <label>1차 분류</label>
 <span class="category1"></span>        
 <label>2차 분류</label>
 <span class="category2">${goods.cateCode}</span>
</div>

<div class="inputArea">
 <label for="gdsName">상품명</label>
 <span>${goods.gdsName}</span>
</div>

<div class="inputArea">
 <label for="gdsPrice">상품가격</label>
 <span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></span>
</div>

<div class="inputArea">
 <label for="gdsStock">상품수량</label>
 <span>${goods.gdsStock}</span>
</div>

<div class="inputArea">
 <label for="gdsDes">상품소개</label>
 <!-- <span>${goods.gdsDes}</span> -->
 <div class="gdsDes">${goods.gdsDes}</div>
</div>

<div class="inputArea">
 <label for="gdsImg">파일첨부</label>
 <p>원본 이미지</p>
 <img src="${goods.gdsImg}" class="oriImg"/>
 
 <p>썸네일</p>
 <img src="${goods.gdsThumbImg}" class="thumbImg"/>
</div>

<div class="inputArea">
 <button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
 <button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
</div>

</form>


</div>
</section>
		
		
<script>

var formObj = $("form[role='form']");

$("#modify_Btn").click(function(){
 formObj.attr("action", "/admin/goods/modify");
 formObj.attr("method", "get")
 formObj.submit();
});

$("#delete_Btn").click(function(){
	 
	 var con = confirm("정말로 삭제하시겠습니까?");
	 
	 if(con) {      
	  formObj.attr("action", "/admin/goods/delete");
	  formObj.submit();
	 }
	});



//컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

//1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {

if(jsonData[i].level == "1") {
cate1Obj = new Object();  //초기화
cate1Obj.cateCode = jsonData[i].cateCode;
cate1Obj.cateName = jsonData[i].cateName;
cate1Arr.push(cate1Obj);
}
}

//1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1")

for(var i = 0; i < cate1Arr.length; i++) {
cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
   + cate1Arr[i].cateName + "</option>"); 
}

$(document).on("change", "select.category1", function(){

	 var cate2Arr = new Array();
	 var cate2Obj = new Object();
	 
	 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	 for(var i = 0; i < jsonData.length; i++) {
	  
	  if(jsonData[i].level == "2") {
	   cate2Obj = new Object();  //초기화
	   cate2Obj.cateCode = jsonData[i].cateCode;
	   cate2Obj.cateName = jsonData[i].cateName;
	   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
	   
	   cate2Arr.push(cate2Obj);
	  }
	 }
	 
	 var cate2Select = $("select.category2");
	 
	 /*
	 for(var i = 0; i < cate2Arr.length; i++) {
	   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	        + cate2Arr[i].cateName + "</option>");
	 }
	 */
	 
	 cate2Select.children().remove();

	 $("option:selected", this).each(function(){
	  
	  var selectVal = $(this).val();  
	  cate2Select.append("<option value=''>전체</option>");
	  
	  for(var i = 0; i < cate2Arr.length; i++) {
	   if(selectVal == cate2Arr[i].cateCodeRef) {
	    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	         + cate2Arr[i].cateName + "</option>");
	   }
	  }
	  
	 });
	 
	});

</script>


</body>
</html>