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
</head>
<body>
<body class="bg-gradient-primary">

	<div class="container">

        <!-- Outer Row -->
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
                                        <h1
											class="h4 text-gray-900 mb-4">로그인</h1>
                                    </div>
                                    <form role="form" class="user" action="/login" method="post">
                                    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
                                        <div class="form-group">
                                            <input type="text"	class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="아이디" name = "username" required>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="비밀번호" name = "password" required>
                                        </div>
                                        <div class="checkbox">
									<label> <input name="remember-me" type="checkbox">자동 로그인
									</label>
								</div>
                                        <button type="submit" class="btn btn-primary" value="로그인">로그인</button>
                                        &nbsp &nbsp &nbsp 
                                        <c:if test = "${error != null }" >
                                        	<script type="text/javascript">
                                        	alert ('${error}')
                                        	</script>
                                        </c:if>
                                         <a href="/member/register" class="btn btn-primary btn-user btn-block"> 계정생성 </a>
                                        <hr>
                                    </form>
                                    <hr>
                                    <button type="button" class="btn btn-primary" value="테스트">테스트</button>
                                    <div class="text-center">
                                        <a class="small" href="#"><p onclick = "alert('관리자에게 문의하세요')">비밀번호 찾기</p></a>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
</body>
<script type="text/javascript" src="/resources/js/login.js"></script>

<script>
$(document).ready(function(){
	  var formObj = $("form[role='form']");
	  
	  //$("button[type='submit']").on("click", function(e){
	  $("button[type='button']").on("click", function(e){
	    
	    e.preventDefault();
	    
	    console.log("submit clicked");
	    
	    var username = $("input[name='username']");
	    var password = $("input[name='password']");
	    
	    var login = {
	    	username : username.val(),
	    	password : password.val(),
	    }
	    
	    check.check(login, function(result){
	    	alert(result);
	    
	    });
	    
	  });
	
});
</script>
</html>