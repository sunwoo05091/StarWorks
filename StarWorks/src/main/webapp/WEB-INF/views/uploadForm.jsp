<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- method="post" 매핑이 되어있어야 한다. -->
<form action="uploadFormAction" method="post" enctype="multipart/form-data">

<!-- 파일을 여러 개 올릴 수 있도록하는 코드 -->
<input type='file' name='uploadFile' multiple>

<button>Submit</button>

</form>

</body>
</html>