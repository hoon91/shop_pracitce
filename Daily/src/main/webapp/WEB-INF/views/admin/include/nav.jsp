<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>/*
aside#aside li { position:relative; }
aside#aside li:hover { background:#eee; }   
aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
aside#aside li:hover > ul.low { display:block; }
aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
aside#aside li:hover > ul.low li a:hover { background:#fff;}
aside#aside li > ul.low li { width:180px; }
*/
 ul, ol, li, a{ list-style:none; margin:0; color:black; padding: auto;}
   
    ul.myMenu {z-index: 6;}
    ul.myMenu > li { display:inline-block; padding:0 50px 0 20px; background:white; text-align:center; position:relative; font-size:20px;}
     ul.myMenu > li > a {text-align: center;}
    ul.myMenu > li:hover { background:#fff; }
    ul.myMenu > li ul.submenu { display:none; position:absolute;  left:-80px; }
    ul.myMenu > li:hover ul.submenu { display:block; }
    ul.myMenu > li ul.submenu > li { display:inline-block; width:150px; background:white; text-align:center; font-size: 15px;}
    ul.myMenu > li ul.submenu > li:hover { background:black; }
    ul.myMenu > li ul.submenu > li:hover > a {color: white;}

</style>    
<div align="center">
<nav>
<hr style="height:2px;border-width:0;color:gray;background-color:gray">
	
<ul class="myMenu">

	<li><a class="menu1 p-2 link-secondary" href="/shop/list?c=100&l=1">TOP</a>
     	<ul class="menu1_s submenu">
			<li><a href="/shop/list?c=101&l=2">긴팔</a></li>
			<li><a href="/shop/list?c=102&l=2">반팔</a></li>
			<li><a href="/shop/list?c=103&l=2">니트</a></li>
			<li><a href="/shop/list?c=104&l=2">후드</a></li>
		</ul>
	</li>

	<li><a class="menu2 p-2 link-secondary" href="/shop/list?c=200&l=1">SHIRTS</a>
     	<ul class="menu2_s submenu">
			<li><a href="/shop/list?c=201&l=2">베이직</a></li>
			<li><a href="/shop/list?c=202&l=2">체크,스트라이프</a></li>
			<li><a href="/shop/list?c=203&l=2">반팔</a></li>
		</ul>
	</li>
	
     
     <li><a class="menu3 p-2 link-secondary" href="/shop/list?c=300&l=1">BOTTOM</a>
     	<ul class="menu3_s submenu">
			<li><a href="/shop/list?c=301&l=2">슬랙스</a></li>
			<li><a href="/shop/list?c=302&l=2">청바지</a></li>
			<li><a href="/shop/list?c=303&l=2">면바지</a></li>
			<li><a href="/shop/list?c=304&l=2">반바지</a></li>
		</ul>
	</li>
	
	<li><a class="menu4 p-2 link-secondary" href="/shop/list?c=400&l=1">OUTER</a>
		<ul class="menu4_s submenu">
			<li><a href="/shop/list?c=401&l=2">자켓</a></li>
			<li><a href="/shop/list?c=402&l=2">가디건</a></li>
			<li><a href="/shop/list?c=403&l=2">코트</a></li>
		</ul>
	</li>
	
      <li><a class="menu5 p-2 link-secondary" href="/shop/list?c=500&l=1">BAG</a></li>
      <li><a class="menu6 p-2 link-secondary" href="/shop/list?c=600&l=1">ACC</a></li>
      <li><a class="menu7 p-2 link-secondary" href="/shop/list?c=700&l=1">SALE</a></li>
      <li><a class="menu8 p-2 link-secondary" href="/shop/list?c=800&l=1">EVENT</a></li>
</ul>
<hr style="height:2px;border-width:0;color:gray;background-color:gray">
</nav>
</div>