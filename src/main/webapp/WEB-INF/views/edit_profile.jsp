
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile | FoodBridge</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/edit_profile.css">
</head>
<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/donor_dashboard"
       class="brand">Food<span>Bridge</span></a>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/donor_dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/profile">My Profile</a>
        <a href="${pageContext.request.contextPath}/my_donations">My Donations</a>
        <a href="${pageContext.request.contextPath}/pickup_requests">Pickup Requests</a>
        <a href="${pageContext.request.contextPath}/logout" class="logout">Logout</a>
    </div>
</nav>

<main class="page-container">
    <div class="page-heading">
        <p class="eyebrow">YOUR ACCOUNT</p>
        <h1>Edit Profile</h1>
        <p>Keep your contact information up to date.</p>
    </div>

    <form action="${pageContext.request.contextPath}/update_profile"
          method="post" class="profile-form">

        <input type="hidden" name="id" value="${user.id}">
        <input type="hidden" name="role" value="${user.role}">

        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name"
                   value="${user.name}" required>
        </div>

        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email"
                   value="${user.email}" required>
        </div>

        <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone"
                   value="${user.phone}" required>
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <textarea id="address" name="address"
                      rows="4" required>${user.address}</textarea>
        </div>

        <div class="form-actions">
            <a href="${pageContext.request.contextPath}/profile"
               class="cancel-btn">Cancel</a>
            <button type="submit" class="update-btn">Update Profile</button>
        </div>
    </form>
</main>

</body>
</html>
