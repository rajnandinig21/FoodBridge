
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verify OTP | FoodBridge</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/otp.css">
</head>

<body>

<div class="otp-container">

    <a href="${pageContext.request.contextPath}/login" class="brand">
        Food<span>Bridge</span>
    </a>

    <main class="otp-content">

        <div class="icon-circle">✉</div>

        <p class="eyebrow">ACCOUNT VERIFICATION</p>
        <h1>Verify OTP</h1>

        <p class="subtitle">
            Please enter the OTP sent to your registered email
            to continue resetting your password.
        </p>

        <form action="${pageContext.request.contextPath}/verify_otp"
              method="post">

            <label for="otp">Enter OTP</label>
            <input type="text"
                   id="otp"
                   name="otp"
                   placeholder="Enter your OTP"
                   inputmode="numeric"
                   autocomplete="one-time-code"
                   required>

            <button type="submit">Verify OTP</button>
        </form>

        <p class="message">${message}</p>

        <a href="${pageContext.request.contextPath}/login"
           class="back-link">← Back to Login</a>

    </main>

    <footer>Share food, share hope. <span>♥</span></footer>

</div>

</body>
</html>
