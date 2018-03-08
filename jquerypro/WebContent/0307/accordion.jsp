<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <title>jQuery UI Accordion - Default functionality</title> -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- <!-- <link rel="stylesheet" href="/resources/demos/style.css"> --> 
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->



<script>
	$(function(){
		$('#dialog-form').hide();
		$('#modify-form').hide();
		//$('#accordion').accordion();
		
		var board = {}; //board객체
		var currentPage = 1;
		
		//함수호출 : readServer(1), readServer(2),
		//readServer 함수 정의
		var readServer = function(cpage){
			//게시판의 내용 가져오기;
			$.ajax({
				url : '${pageContext.request.contextPath}/BoardList', //서블릿 파일
				type : 'get',
				data : {'cpage' : cpage},
				success : function(res){
					code = "";
					$.each(res.data, function(i,v){
						/* code += "<h3>" + res.data[i].subject + "</h3>";
						code += "<div><p>" + res.data[i].writer + "</p></div>"; */
						code +='<button class="accordion">' + v.subject + '</button>';
    					code += '<div class="panel">';
    					code += "<p style='width: 80%; float: left;'>작성자 : " +  v.writer 
				            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				            + "이메일 : " + v.mail + "</p>"
				            + '<p style="text-align:right; vertical-align:top;"><button idx="' 
				            + v.seq + '" name="modify" class="action"  data-toggle="modal" data-target="#updateModal"    >수정</button><button idx="' 
				            + v.seq + '" name="delete" class="action" data-toggle="modal" data-target="#deleteModal" >삭제</button></p>'
				            + "<hr/>";
				        code += "<p>" + v.content + "</p>"
			            code += '</div>';
    				})
    				
    				
    				
    				$('#accordionList').empty();
    				$('#accordionList').append(code);
    				//setting();
					/* }) */
// 					$('#accordion').accordion();
			
					//페이지 버튼
					$('#btngroup1').empty();
					for(i=1; i<=res.totalPage;i++){
						$("<button class='paging'></button>").text(i).appendTo('#btngroup1');
						//새로 만들어진 버튼이기 때문에 이벤트는 delegate방식의 이벤트다
					}
			
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
		} 
		////////////////////////////////////////////////////////////////////////////////
		
		//readServer 호출
		readServer(1);
		
		//아코디언 접었다 폈다
		acc=$('.accordion');
		//delegate 방식
		$('#accordionList').on('click','.accordion',function(){
			panel = $(this).next();
			
// 			alert(panel.prop('scrollHeight'));
			if(panel.css('maxHeight')=='0px'){ //펼쳐지지 않았을 때
				panel.css('maxHeight',panel.prop('scrollHeight')+"px");
			}else{ //펼쳐졌을 때
				panel.css('maxHeight','0px');
			}
			
		});
		
		////////////페이지버튼에 대한 이벤트///////
		$('#btngroup1').on('click','button.paging',function(){
			cpage = $(this).text();
			readServer(cpage);
		});
		////////////글쓰기 모달창에서 확인버튼 입력 후 ////////////////
		$('#writeModal #w_submit').on('click',function(){
			writeServer();
		});
		////////////////writeServer, function//////////////
		writeServer = function(){
			//입력한 모든 값을 가져온다.
			$.ajax({
				
				url: '${pageContext.request.contextPath}/BoardWrite',
				type: 'post',
				data: $('#writeForm').serialize(),
				dataType: 'json',
				success : function(res){
					alert(res.flag);
					$('#writeModal').modal('hide'); //모달창 닫기
					//모달창 닫을 때 입력된 값 지워야 함
					
					readServer(1);
				},
				error : function(xhr){
					alert("상태 : "+xhr.status);
				}
			})
		};
		
		///////수정모달창에 해당 번호의 내용을 출력하기위한 함수정의/////////////////////////////////////
		viewServer=function(seq){
			$.ajax({
				url:'${pageContext.request.contextPath}/DetailView',
				data:{'seqno':seq},
				async: false, // 비동기가 아닌 동기방식으로 처리한다.
				success: function(res){ //결과값을 board객체에 담는다.
					board.seq=res.seq; 
					board.subject=res.subject;
					board.writer=res.writer;
					board.mail=res.mail;
					board.content=res.content;
				},
				error:function(xhr){
					
				},
				dataType:'json'
			})
		};
		//viewServer를 호출해서 updateModal창에 출력한다.
		//viewServer에서 데이터를 완벽하게 가져와야만 모달창에 출력할 수 있다.
		
		$('#u_writer').val(res.writer);	
		$('#u_subject').val(res.subject);	
		$('#u_mail').val(res.mail);	
		$('#u_content').val(res.content);	
		
		////////삭제/////////////////////////////////////////////////////
		$('#deleteModal').on('click',function(){
			
			
		});
		
		
		
		
		////////////모달창 닫기 - 입력값 지우기/////////////////////////
		$('#writeModal').on('hide.bs.modal',function(){
			$('#w_writer').val("");	
			$('#w_subject').val("");	
			$('#w_mail').val("");	
			$('#w_password').val("");	
			$('#w_content').val("");	
		});
		/////////////////////////////////////////////////
		$('#updateModal').on('hide.bs.modal',function(){
			$('#u_writer').val("");	
			$('#u_subject').val("");	
			$('#u_mail').val("");	
			$('#u_password').val("");	
			$('#u_content').val("");	
		});
		

		
	});
</script>
<style>



/*     #btngroup1 {
       width : 90%;
       text-align : center;
       float : left;
       margin-top : 20px
    }
    #btngroup2{
       text-align : right;
       margin-top : 20px;
    }
    #btngroup1 button{
       margin : 3px;
       padding : 3px;
       width : 30px;
    }
  	 */
  	
  	

.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 15px;
    width: 100%;
    border: 2px double lightgray;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

.active, .accordion:hover {
    background-color: #58ACFA;
}

.accordion:after {
    content: '\002B';
    color: #777;
    font-weight: bold;
    float: right;
    margin-left: 5px;
}

.active:after {
    content: "\2212";
}

.panel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
    margin : 0px;
}
#btngroup2 {
		text-align: right;
		margin-top : 20px;
		margin-right : 20px;
		
}
#btngroup1{
 text-align : center;
}	
#btngroup1 button {
		margin: 3px;
		padding: 3px;
		width: 50px;
	}

  	
  
  
  
</style>

</head>
<body>

<!-- 게시판 list출력  -->
<div id="accordionList">

</div>

<!-- 페이지 네비게이션 버튼 출력  -->
<div id="btngroup1">
</div>

<div class='divevent' id='btngroup2'>
	<button name="write" class="action" data-toggle="modal" data-target="#writeModal">글쓰기</button>
</div>
  
 


<!------------------------- writeModal 글쓰기폼 ----------------------------->
  <div class="modal fade" id="writeModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">글쓰기</h4>
        </div>
        <div class="modal-body">
         <form id="writeForm">
			<div>
				<label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
				<input type="text" id="w_subject"  name="subject" class="text ui-widget-content ui-corner-all"/>
			</div>
			<div>
				<label for="writer" class="header">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label>
				<input type="text" id="w_writer" name="writer"  class="text ui-widget-content ui-corner-all"/>
			</div>
			<div>
				<label for="mail" class="header">메&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</label>
				<input type="text" id="w_mail" name="mail" class="text ui-widget-content ui-corner-all"/>
			</div>
			<div>
				<label for="password" class="header">비밀&nbsp;번호</label>
				<input type="password" id="w_password" name="password" class="text ui-widget-content ui-corner-all"/>
			</div>
			<div>
				<label for="content" class="w_header">본&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문</label>
				<br />
				<textarea rows="10" name="content" cols="50" id="w_content" class="text ui-widget-content ui-corner-all"></textarea>
			</div>
	     <button id="w_submit" type="button" data-dismiss="modal" class="btn btn-default btn-success"><span class="glyphicon glyphicon-off"></span> 확인</button>
	     </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
   </div>
  </div>
 <!------------- 삭제  deleteModal  폼--------------------->
 <div class="modal fade" id="deleteModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">글 삭제</h4>
        </div>
        <div class="modal-body">
          <form id="deleteForm" >
			<fieldset>
				<div>
				   <input type="hidden" name="seq" id="d_seq">
					<label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
					<input type="text" id="d_subject" class="text ui-widget-content ui-corner-all" readonly="readonly"/>
				</div>
				<div>
					<label for="password" class="header">비밀&nbsp;번호</label>
					<input type="password" id="d_password" class="text ui-widget-content ui-corner-all"/>
				</div>
			</fieldset>
			<button id="d_submit" type="button" data-dismiss="modal" class="btn btn-default btn-success"><span class="glyphicon glyphicon-off"></span> 확인</button>
		  </form>
		</div>
	  </div>
	</div>
 </div>
 
 <!---------- updateModal 수정폼 ---------------->
  <div class="modal fade" id="updateModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">글 수정</h4>
        </div>
        <div class="modal-body">
         <form id="updateForm" >
		<div>
			<label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
			<input type="text" id="u_subject"  name="subject" class="text ui-widget-content ui-corner-all"/>
			<input type="hidden" name="seq" id="u_seq">
		</div>
		<div>
			<label for="writer" class="header">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label>
			<input type="text" id="u_writer" name="writer"  class="text ui-widget-content ui-corner-all"/>
		</div>
		<div>
			<label for="mail" class="header">메&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</label>
			<input type="text" id="u_mail" name="mail" class="text ui-widget-content ui-corner-all"/>
		</div>
		<div>
			<label for="password" class="header">비밀&nbsp;번호</label>
			<input type="password" id="u_password" name="password" class="text ui-widget-content ui-corner-all"/>
		</div>
		<div>
			<label for="content" class="u_header">본&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문</label>
			<br />
			<textarea rows="10" name="content" cols="50" id="u_content" class="text ui-widget-content ui-corner-all"></textarea>
		</div>
		<button id="u_submit" type="button" data-dismiss="modal" class="btn btn-default btn-success"><span class="glyphicon glyphicon-off"></span> 확인</button>
	    </form>
        </div>
        <div class="modal-footer">
          
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
   </div>
  </div>







</body>
</html>