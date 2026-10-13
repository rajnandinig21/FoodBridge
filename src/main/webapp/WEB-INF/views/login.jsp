<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>FoodBridge | Login</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/login.css">
</head>

<body>

<div class="login-page">

    <!-- LEFT IMAGE SECTION -->
    <div class="login-image">
		  <img src="${pageContext.request.contextPath}/images/login-image.jpg"
		       alt="Food donation">

        <div class="image-overlay">
            <span>FOODBRIDGE</span>

            <h2>Share food.<br>Share hope.</h2>

            <p>
                Connecting surplus food with people and communities
                who need it most.
            </p>
        </div>

    </div>


    <!-- RIGHT LOGIN SECTION -->
    <div class="login-side">

        <div class="login-card">

            <div class="login-brand">
                <div class="brand-icon">F</div>
                <span>Food<span>Bridge</span></span>
            </div>

            <div class="login-heading">
                <h1>Welcome back</h1>
                <p>Login to continue to FoodBridge</p>
            </div>

            <h3 class="message">${message}</h3>

			<form action="${pageContext.request.contextPath}/login" method="post">
                <div class="form-group">
                    <label>Email Address</label>

                    <input type="email"
                           name="email"
                           placeholder="Enter your email"
                           required>
                </div>


                <div class="form-group">
                    <label>Password</label>

                    <input type="password"
                           name="password"
                           placeholder="Enter your password"
                           required>
                </div>


                <div class="forgot">
                    <a href="/forgot_password">Forgot password?</a>
                </div>


                <button type="submit" class="login-btn">
                    Login
                </button>

            </form>


            <div class="register-text">
                Don't have an account?
                <a href="/register">Create an account</a>
            </div>


            <a href="/" class="back-home">
                ← Back to Home
            </a>

        </div>

    </div>

</div>

</body>
</html>