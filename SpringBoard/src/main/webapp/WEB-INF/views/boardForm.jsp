<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/boardInsert" method="post">
		제목 : <input type = "text" name = "title">
		글쓴이 : <input type = "text" name = "writer"><br/>
		본문 : <textarea name="content" rows="20" cols="100"></textarea><br/>
		<input type="submit" value="글쓰기"><input type="reset" value="초기화">
	</form>
</body>
</html>