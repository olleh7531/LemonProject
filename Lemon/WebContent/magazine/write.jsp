<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../assets/css/magazine/table.css" rel="stylesheet" type="text/css" media="screen">  
</head>
<body>
<form action="./magazineBoardWriteAction.bo" method="post" enctype="multipart/form-data">
<table class="type09">
    <thead>
    <tr>
        <th scope="cols">제목</th>
        <td><input type="text" name="subject"></td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">내용</th>
        <td><textarea rows="10" cols="20" name="content"></textarea></td>
    </tr>
    <tr>
        <th scope="row">파일 첨부</th>
        <td><input type="file" name="file"></td>
    </tr>
    </tbody>
</table>
<input type="submit" value="글쓰기">
<input type="reset" value="다시쓰기">
<input type="button" value="글목록" onclick="">    
</form>


</body>
</html>