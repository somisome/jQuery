<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
<script>
	$(function(){
		$('.dropdown').click(function(){
			//주메뉴와 부메뉴를 가져온다.
			menu = $('.dropdown-toggle', this).text(); //주메뉴			
			submenu = $('.dropdown-menu li a',this).text(); //부메뉴
			
			//부메뉴를 하나씩 공백기준으로 분리해서 배열로 반환 - map()  split(" ")
			sub2 = $('.dropdown-menu li a',this).map(function(){
				return $(this).text();
			});
			
			var code ="<div class='list-group'>";
			code+="<a href='#' class='list-group-item active disabled'>"+menu+"</a>";
			
			$.each(sub2,function(i){
				code+="<a href='#' class='list-group-item lgi'>"+sub2[i]+"</a>";
			});
			code+="</div>";
			
			$('.sidenav').html(code);
			
			
			$('.text-left h1').text(menu);
		});
		////////////////////////////////////////////////////////////////////////////
		
		$('.sidenav').on('click','.lgi',function(){
			txtsub = $(this).text();
			$('.text-left h3').text(txtsub);
			proc();
		});
			
		$('.dropdown-menu li a').click(function(){
			txtsub = $(this).text();
			$('.text-left h3').text(txtsub);
			proc();
		});	
			
		function proc(){
			if(txtsub == "공지사항" ){
				//buyer실행				
			}else if(txtsub=="자유게시판"){
				// lprod_prod 실행
			}else if(txtsub=="QnA게시판"){
				// 북리스트실행
				url="${pageContext.request.contextPath}/0222/test_booklist.html";
				$('.text-left #contentresult').load(url);
			}else if(txtsub=="이달의업데이트"){
				
			}else if(txtsub=="지난이벤트"){
				//할인율실행
			}else if(txtsub=="당첨자"){
				
			}else if(txtsub=="HTML"){
				
			}else if(txtsub=="CSS"){
				
			}else if(txtsub=="JavaScript"){
			
			}else if(txtsub=="정보수정"){
			
			}else if(txtsub=="장바구니"){
				
			}else if(txtsub=="메일함"){
				
			}			
		};
		
		
		
		
	});
</script>
</head>
<body>
	<jsp:include page="navheader.jsp"/>
	<jsp:include page="content.jsp"/>
	<jsp:include page="footer.jsp"/>
</body>
</html>
