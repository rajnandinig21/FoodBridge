<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password | FoodBridge</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/forgot_password.css">
</head>

<body>

<div class="forgot-container">

    <a href="${pageContext.request.contextPath}/login" class="brand">
        Food<span>Bridge</span>
    </a>

    <div class="form-content">
        <div class="icon-circle">↻</div>

        <p class="eyebrow">ACCOUNT RECOVERY</p>
        <h1>Forgot Password?</h1>
        <p class="subtitle">
            No worries! Enter your registered email address
            and we'll help you reset your password.
        </p>

        <form action="${pageContext.request.contextPath}/forgot_password"
              method="post">

            <label for="email">Registered Email Address</label>
            <input type="email"
                   id="email"
                   name="email"
                   placeholder="you@example.com"
                   required>

            <button type="submit">Send OTP</button>
        </form>

        <p class="message">${message}</p>

        <a href="${pageContext.request.contextPath}/login"
           class="back-link">← Back to Login</a>
    </div>

    <footer>Share food, share hope. <span>♥</span></footer>

</div>

</body>
</html>
