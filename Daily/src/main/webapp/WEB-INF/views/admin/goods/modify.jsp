<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="/resources/ckeditor/ckeditor.js"></script>
<style>
.inputArea { margin:5px 0; }
select { width:100px; }
label { display:inline-block; width:70px; padding:5px; }
label[for='gdsDes'] { display:block; }
input { width:150px; }
textarea#gdsDes { width:400px; height:180px; }
.select_img img{width:500px; margin:20px 0;}
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
			<h1 class="jumbotron" style="text-align: center; margin: 50px 0;">상품 수정</h1>
	
	<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">

<input type="hidden" name="gdsNum" value="${goods.gdsNum}" />

<div class="inputArea"> 
 <label>1차 분류</label>
 <select class="category1">
  <option value="">전체</option>
 </select>   
 <label>2차 분류</label>
 <select class="category2" name="cateCode">
  <option value="">전체</option>
 </select>
</div>
<div class="inputArea">
 <label for="gdsName">상품명</label>
 <input type="text" id="gdsName" name="gdsName" value="${goods.gdsName}"/>
</div>
<div class="inputArea">
 <label for="gdsPrice">상품가격</label>
 <input type="text" id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice}"/>
</div>
<div class="inputArea">
 <label for="gdsStock">상품수량</label>
 <input type="text" id="gdsStock" name="gdsStock" value="${goods.gdsStock}"/>
</div>
<div class="inputArea">
 <label for="gdsDes">상품소개</label>
 <textarea rows="5" cols="50" id="gdsDes" name="gdsDes">${goods.gdsDes}</textarea>
</div>

<div class="inputArea">
 <label for="gdsImg">이미지</label>
 <input type="file" id="gdsImg" name="file" />
 <div class="select_img">
  <img src="${goods.gdsImg}" />
  <input type="hidden" name="gdsImg" value="${goods.gdsImg}" />
  <input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}" /> 
 </div>
</div>

<div class="inputArea">
 <button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
<button type="button" id="back_Btn" class="btn btn-warning">취소</button>
</div>   
</form>


		</div>
</section>
		
		
<script>

//ck에디터
var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,
   shiftEnterMode : CKEDITOR.ENTER_P,
   filebrowserUploadUrl : "/admin/goods/ckUpload"
 };
 
 CKEDITOR.replace("gdsDes", ckeditor_config);

//이미지
$("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
  

$("#back_Btn").click(function(){
 //history.back();
 location.href = "/admin/goods/view?n=" + ${goods.gdsNum};
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


/*
var select_cateCode = '${goods.cateCode}';
var select_cateCodeRef = '${goods.cateCodeRef}';
var select_cateName = '${goods.cateName}';

if(select_cateCodeRef != null && select_cateCodeRef != '') {
 $(".category1").val(select_cateCodeRef);
 $(".category2").val(select_cateCode);
 $(".category2").children().remove();
 $(".category2").append("<option value='"
       + select_cateCode + "'>" + select_cateName + "</option>");
} else {
 $(".category1").val(select_cateCode);
 //$(".category2").val(select_cateCode);
 // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
 $(".category2").append("<option value="' + select_cateCode + '" selected='selected'>전체</option>");
}
*/

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