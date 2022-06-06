<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href="/resources/CSS/bootstrap.min.css" type = "text/css">
<link rel = "stylesheet" href="/resources/CSS/bootstrap.css" type = "text/css">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/login.js"></script>
</head>
<body>
<body class="bg-gradient-primary">
<%-- <c:if test="${check == 1 }">
	<div class="alert alert-dismissible alert-light">
  		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  		<strong>이미 가입된 아이디 입니다.</strong>
	</div>
</c:if> --%>
    <div class="container">

        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                       <span id = "mainLogoSpan"><a class="navbar-brand" href="#" id = "mainLogo">StarWorks</a></span>
                            <div class="col-lg-6">
                                <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">계정신청</h1>
                            </div>
                            <form role="form" class="user" action="/member/register" method="post">
                            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="ID" name = "id" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName" placeholder="사번" name= "e_no" required>
                                    </div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="이름" name = "name" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName" placeholder="전화번호" name= "phone_number" required>
                                    </div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="비밀번호" name = "pass" required onchange = "check_pw()">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="비밀번호 확인" required onchange = "check_pw()">&nbsp;<span id="check"></span>
                                    </div>
                                </div>
                                <br>
                          <button type="submit"	class="btn btn-primary" value="계정신청">계정신청</button>
                                <hr>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="/login">이미 계정이 있으신가요? 로그인하러가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>