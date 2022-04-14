<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<div class="container">
		<h1 class="text text-primary">${board.bno }번글 조회중</h1>
		<div class="row">
			<div class="col-md-9">
				<input type = "text" class="form-control" value="제목 : ${board.title }"/>
			</div>
			<div class="col-md-3">
				<input type = "text" class="form-control" value="글쓴이 : ${board.writer }"/>
 			</div>
		</div>
		<input type="text" class="form-control" value="${board.title }"/>
		<textarea rows="10"  class="form-control">${board.content }</textarea>
		<div class="row">
			<div class="col-md-3">쓴 날짜 : </div>
			<div class="col-md-3">${board.regdate }</div>
			<div class="col-md-3">수정날짜 : </div>
			<div class="col-md-3">${board.updatedate }</div>
		</div>
		<a href="/boardList" class="btn btn-success">글목록</a>
		<form action="/boardDelete" method="post">
			<input type="hidden" value="${board.bno }" name="bno"/>
			<input type="submit" value="제출하기">
		</form>
		<form action="/boardUpdateForm" method="post">
			<input type="hidden" value="${board.bno }" name="bno"/>
			<input type="submit" value="수정">
		</form>
	</div>
</body>
</html>