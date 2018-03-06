<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.navLogo{
		background : skyblue;
	}
	
	.navLogo .nav li a:hover{
		background : skyblue;
		font-size : 1.2em;
	}
	
	img {
		width : 60px;
		height : 35px;
	}
</style>   
<nav class="navLogo">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"><img id="gsj" src="../images/gsjLogo1.png"></a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li class="login"><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <li class="user"><a href="#"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
    </ul>
  </div>
</nav>   
   
   
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      
		<li class="dropdown">
	    	<a class="dropdown-toggle" data-toggle="dropdown">마이페이지
	   			<span class="caret"></span>
	   		</a>
	   		<ul class="dropdown-menu">
    			<li><a href="#">정보수정 </a></li>
	     	 	<li><a href="#">장바구니 </a></li>
	     	 	<li><a href="#">메일함 </a></li>
	  		</ul>
		</li>
		
		<li class="dropdown">
	    	<a class="dropdown-toggle" data-toggle="dropdown">게시판
	   			<span class="caret"></span>
	   		</a>
	   		<ul class="dropdown-menu">
    			<li><a href="#">자유게시판 </a></li>
	     	 	<li><a href="#">공지사항 </a></li>
	     	 	<li><a href="#">QnA </a></li>
	  		</ul>
		</li>
		
		<li class="dropdown">
	    	<a class="dropdown-toggle" data-toggle="dropdown">이벤트
	   			<span class="caret"></span>
	   		</a>
	   		<ul class="dropdown-menu">
    			<li><a href="#">이달의업데이트 </a></li>
	     	 	<li><a href="#">지난이벤트 </a></li>
	     	 	<li><a href="#">당첨자 </a></li>
	  		</ul>
		</li>
		
		<li class="dropdown">
	    	<a class="dropdown-toggle" data-toggle="dropdown">마지막메뉴
	   			<span class="caret"></span>
	   		</a>
	   		<ul class="dropdown-menu">
    			<li><a href="#">HTML </a></li>
	     	 	<li><a href="#">CSS </a></li>
	     	 	<li><a href="#">JavaScript </a></li>
	  		</ul>
		</li>
		
		
		
		
      </ul>
    </div>
  </div>
</nav>