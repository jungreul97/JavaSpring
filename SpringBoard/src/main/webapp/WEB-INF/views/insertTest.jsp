<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
	#modDiv{
		width : 300px;
		heigth : 100px;
		background-color : aqua;
		position : absolute;
		top : 50%;
		left : 50%;
		margin-top:-50px%;
		margin-left:-150px;
		padding:10px;
		z-index:1000;	
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
</head>
<body>

	<h2>Ajax 댓글 등록 테스트</h2>
	<!--  댓글이 추가될 공간 -->
	<ul id = "replies">
	
	</ul>
	
	<!--  댓글 작성  공간-->
	<div>
		<div>
			댓글 글쓴이 <input type="text" name="replyer" id="newReplyWriter">
		</div>
		<div>
			댓글 내용 <input type="text" name="reply" id="newReplyText"> 
		</div>
		<button id="replyAddBtn">댓글 추가</button>
	</div>
	
	<div id = "modDiv" style = "display:none;">
		<div class = "modal-title">
		</div>
		<div>
			<input type = "text" id = "reply">
		</div>
		<div>
			<button type = "button" id = "replyModBtn">Modify</button>
			<button type = "button" id = "replyDelBtn">Delete</button>
			<button type = "button" id = "closeBtn">Close</button>
		</div>
	</div>
	
	<!-- jquery cdn 가져오기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- 스크립트 태그로 자바스크립트 요청 확인 -->
	<script>
		var bno = 82;
		
		// 전체 댓글 가져오기
		function getAllList(){
			// $.getJSON은 입력한 주소에 get방식으로 요청을 넣습니다.
						// 주소   			  // 콜백함수 주소 요청으로 얻어온 json을 어떻게 처리할지
			$.getJSON("/replies/all/" + bno, function(data){
				// 문자열을 이용해 태그를 생성하거나 끼워넣을 수 있으므로
				// 빈 문자열을 만들어놓고 거기에 댓글정보를 저장해 화면에 전송
				let str = "";
				
				// 데이터를 제대로 들고왔는지 디버깅
				console.log(data);
				
				// 들고 온 데이터를 반복해서 출력하기
				//$(JSON형식데이터).each => 내부 JSON을 향상된 for문 형식으로 처리합니다.
				// 역시 내부에 콜백함수(로직이 실행되었을때 추가로 실행할 구문을 정의하기위해 파라미터로 넣는 함수)
				// 를 이용해 data를 하나하나 향상된 for문형식으로 처리할때 실행구문을 적을 수 있습니다.
				$(data).each(function(){
					// 하나하나 반복되는 각 데이터는 this라는 키워드로 표현됩니다.
					//console.log("----------------");
					//console.log(this);
					str += "<li data-rno='" + this.rno + "' class='replyLi'>"
						+ this.rno + ":" + this.reply
						+ "<button>수정/삭제</button></li>";
				});
				// #replies사이에 끼워넣을수있도록 console.log()로 디버깅
				console.log(str);
				$("#replies").html(str);			
			});
		}
		
		getAllList(); // 댓글 전체 들고와서 #replies에 심어주는 로직 실험
		
		$("#replyAddBtn").on("click", function(){
			
			// 폼이 없기때문에, input태그 내에 입력된 요소를 가져와야 합니다.
			// 버튼을 누르는 시점에, 글쓴이와 내용 내부에 적힌 문자열을 변수에 저장합니다. 
			var replyer = $("#newReplyWriter").val();
			var reply = $("#newReplyText").val();
			
			// $.ajax({내용물}); 이 기본형태
			$.ajax({
				type : 'post',
				url : '/replies',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					bno : bno,
					replyer : replyer,
					reply : reply
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						getAllList(); // 댓글 등록 성공시, 다시 목록 갱신
						
						// 폼 태그 비우기.
						replyer = $("#newReplyWriter").val("");
						reply = $("#newReplyText").val("");
					}
				}
			});		
		});
		
		//이벤트 위임
		$("#replies").on("click",".replyLi button", function(){
			var replytag = $(this).parent();
			
			var rno = replytag.attr("data-rno");
			var reply = replytag.text();
			
			$(".modal-title").html(rno);
			$("#reply").val(reply);
			$("#modDiv").show("slow");
		});
		
		$("#closeBtn").on("click", function(){
			$("#modDiv").hide("slow");
		});
		
		$("#replyDelBtn").on("click",function(){
			let rno = $(".modal-title").html();
			
			$.ajax({
				type : 'delete',
				url : '/replies/' + rno,
				header : {
					"X-HTTPMethod-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result){
					console.log("result : "+result);
					if(result == "SUCCESS"){
						alert("삭제 되었습니다.");
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			});
		});
		
		$("#replyModBtn").on("click",function(){
			let rno = $(".modal-title").html();
			let reply = $("#reply").val();
			
			$.ajax({
				type : 'put',
				url : '/replies/' + rno,
				header : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				contentType : "application/json",
				dataType:'text'
				data : JSON.stringfy({reply:reply}),
				success : function(result){
					console.log("result : "+result);
					if(result == "SUCCESS"){
						alert("수정 되었습니다.");
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			});
		});
	</script>
</body>
</html>