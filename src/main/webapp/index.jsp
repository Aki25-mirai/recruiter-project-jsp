<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="./resources/js/jquery.min.js">
</script>
<script type="text/javascript" src="./resources/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	 <div class="container spad">

    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-6 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0 offset-3">
            
            <div class="row">
              
              <div class="col-lg-8">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Login To Your Account</h1>
                  </div>
                  <c:if test="${not empty message }">
							<div class="alert alert-danger text-center col-6 offset-2">${message}</div>
				  </c:if>
				<c:url var="login" value="/login"></c:url>
                  <form  action="${login }" method="post">
                    <div class="form-group">
                      <input type="email" class="form-control" name="email" 
                      required autocomplete="email" autofocus placeholder="Enter Email Address">
                    </div>
                    <div class="form-group">
                      <input  type="password" class="form-control " name="password" required 
                      autocomplete="current-password" placeholder="Enter Password">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                         <input class="form-check-input" type="checkbox" name="remember" id="remember">

                            <label class="form-check-label" 
                            for="remember">Remember Me
                            </label>
                      </div>
                    </div>
                    <button type="submit" class="btn btn-block" style="background-color: #A93A33;color:white;">Login
                    </button>
                    </form>
                    
                   
                  <div class="text-center">
                    
                        <a class="btn btn-link" href="#">
                            Forgot Your Password?
                        </a>
                    
                  </div>
                  <div class="text-center">
	                <a class="small" href="#">Have not already member? Join Us Now.</a>
	              </div>
                  
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
</html>
