
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FoodBridge | Donor Dashboard</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/donor_dashboard.css">
</head>

<body>

<div class="dashboard">

    <!-- Sidebar -->
    <aside class="sidebar">

        <div class="brand">
            <div class="brand-icon">F</div>
            <span>Food<span>Bridge</span></span>
        </div>

        <div class="sidebar-label">DONOR PANEL</div>

        <nav>
            <a href="${pageContext.request.contextPath}/profile" class="nav-item">
                <span>👤</span>
                My Profile
            </a>

            <a href="${pageContext.request.contextPath}/add_donation" class="nav-item active">
                <span>🥗</span>
                Add Donation
            </a>

            <a href="${pageContext.request.contextPath}/my_donations" class="nav-item">
                <span>📋</span>
                My Donations
            </a>

            <a href="${pageContext.request.contextPath}/pickup_requests" class="nav-item">
                <span>📦</span>
                Pickup Requests
            </a>
        </nav>

        <a href="${pageContext.request.contextPath}/logout" class="logout">
            <span>↪</span>
            Logout
        </a>

    </aside>

    <!-- Main Content -->
    <main class="main-content">

        <header class="topbar">
            <div>
                <p class="welcome-small">DONOR DASHBOARD</p>
                <h1>Welcome, ${user.name}</h1>
            </div>

            <div class="profile-circle">
                ${user.name.substring(0,1)}
            </div>
        </header>

        <!-- Welcome Banner -->
        <section class="welcome-card">
            <div class="welcome-content">
                <p class="eyebrow">SHARE FOOD, SHARE HOPE</p>

                <h2>
                    Your extra food<br>
                    can make a difference.
                </h2>

                <p>
                    Donate surplus food, manage your donations
                    and respond to pickup requests in one place.
                </p>

                <a href="${pageContext.request.contextPath}/add_donation"
                   class="primary-btn">
                    Add a Donation →
                </a>
            </div>

            <div class="welcome-symbol">🥗</div>
        </section>

        <!-- Quick Access -->
        <section class="section">
            <div class="section-heading">
                <h2>Quick Access</h2>
                <p>Manage your food donation activities</p>
            </div>

            <div class="cards">

                <a href="${pageContext.request.contextPath}/add_donation"
                   class="dashboard-card">
                    <div class="card-icon coral">🥗</div>
                    <h3>Add Donation</h3>
                    <p>Share surplus food with people in need.</p>
                    <span class="card-link">Donate food →</span>
                </a>

                <a href="${pageContext.request.contextPath}/my_donations"
                   class="dashboard-card">
                    <div class="card-icon green">📋</div>
                    <h3>My Donations</h3>
                    <p>View and manage your submitted donations.</p>
                    <span class="card-link">View donations →</span>
                </a>

                <a href="${pageContext.request.contextPath}/pickup_requests"
                   class="dashboard-card">
                    <div class="card-icon light-coral">📦</div>
                    <h3>Pickup Requests</h3>
                    <p>Check requests received from NGOs.</p>
                    <span class="card-link">View requests →</span>
                </a>

                <a href="${pageContext.request.contextPath}/profile"
                   class="dashboard-card">
                    <div class="card-icon light-green">👤</div>
                    <h3>My Profile</h3>
                    <p>View and update your donor information.</p>
                    <span class="card-link">View profile →</span>
                </a>

            </div>
        </section>

    </main>
</div>

</body>
</html>
