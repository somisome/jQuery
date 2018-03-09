/**
 * 
 */

var board = {}; //board객체
//readServer 함수 정의
var readServer = function(cpage){                                                                                                                                                  
	//게시판의 내용 가져오기;                                                                                                                                                                
	$.ajax({                                                                                                                                                                       
		url : '/jquerypro/BoardList', //서블릿 파일                                                                                                             
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
		            + v.seq + '" name="delete" class="action">삭제</button></p>'                                                     
		            + "<hr/>";                                                                                                                                                     
		        code += "<p>" + v.content + "</p>"                                                                                                                                 
	            code += '</div>';                                                                                                                                                  
			})                                                                                                                                                                     
			                                                                                                                                                                       
			                                                                                                                                                                       
			                                                                                                                                                                       
			$('#accordionList').empty();                                                                                                                                           
			$('#accordionList').append(code);                                                                                                                                      
			//setting();                                                                                                                                                           
			/* }) */                                                                                                                                                               
//			$('#accordion').accordion();                                                                                                                                           
	                                                                                                                                                                               
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
////////////////writeServer, function//////////////
var writeServer = function(){
	//입력한 모든 값을 가져온다.
	$.ajax({
		
		url: '/jquerypro/BoardWrite',
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
var viewServer=function(seq){
	$.ajax({
		url:'/jquerypro/DetailView',
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
////////////////////////////////////////////////////////////////
var updateServer = function(cpage){
	$.ajax({
		url:'/jquerypro/BoardUpdate',
		type:'post',
		data:$('#updateForm').serialize(),
		dataType:'json',
		success: function(res){
			alert(res.flag);
			readServer(cpage);
		},
		error: function(xhr){
			alert("상태:"+xhr.status);
		}
		
	});
}
////////////////////////////////////////////////////////////////////////
deleteServer = function(cpage, seq){
	$.ajax({
		url:'/jquerypro/BoardDelete',
		type:'get',
		data:{"seqno":seq},
		dataType:'json',
		success:function(res){
			alert(res.flag);
			readServer(cpage);
		},
		error:function(xhr){
			alert("상태: "+xhr.status);
		}
	})
}
                                                                                                                                                                                   