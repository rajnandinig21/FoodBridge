
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password | FoodBridge</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/reset_password.css">
</head>

<body>

<div class="reset-container">

    <a href="${pageContext.request.contextPath}/login" class="brand">
        Food<span>Bridge</span>
    </a>

    <main class="reset-content">

        <div class="icon-circle">🔒</div>

        <p class="eyebrow">ACCOUNT SECURITY</p>
        <h1>Reset Password</h1>

        <p class="subtitle">
            Create a new password for your account.
            Choose a strong password that you haven't used before.
        </p>

        <form action="${pageContext.request.contextPath}/reset_password"
              method="post">

            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password"
                       id="newPassword"
                       name="newPassword"
                       placeholder="Enter new password"
                       autocomplete="new-password"
                       required>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password"
                       id="confirmPassword"
                       name="confirmPassword"
                       placeholder="Re-enter new password"
                       autocomplete="new-password"
                       required>
            </div>

            <button type="submit">Reset Password</button>
        </form>

        <p class="message">${message}</p>

        <a href="${pageContext.request.contextPath}/login"
           class="back-link">← Back to Login</a>

    </main>

    <footer>Share food, share hope. <span>♥</span></footer>

</div>

</body>
</html>
