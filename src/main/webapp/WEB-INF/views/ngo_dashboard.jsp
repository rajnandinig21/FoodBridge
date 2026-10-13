<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>FoodBridge | NGO Dashboard</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/ngo_dashboard.css">
</head>

<body>

<div class="dashboard">

    <!-- Sidebar -->
    <aside class="sidebar">

        <div class="brand">
            <div class="brand-icon">F</div>
            <span>Food<span>Bridge</span></span>
        </div>

        <div class="sidebar-label">NGO PANEL</div>

        <nav>
            <a href="/profile" class="nav-item">
                <span>👤</span>
                My Profile
            </a>

            <a href="/available_donations" class="nav-item active">
                <span>🍱</span>
                Available Donations
            </a>
			<a href="/accepted_donations" class="nav-item">
			     <span>🍲</span>
			    Accepted Donations
			</a>


            <a href="/track_donations" class="nav-item">
                <span>📦</span>
                Track Donations
            </a>

            <a href="/rejected_donations" class="nav-item">
                <span>↩</span>
                Rejected Donations
            </a>
        </nav>

        <a href="/logout" class="logout">
            <span>↪</span>
            Logout
        </a>

    </aside>


    <!-- Main Content -->
    <main class="main-content">

        <header class="topbar">

            <div>
                <p class="welcome-small">NGO DASHBOARD</p>
                <h1>Welcome, ${user.name}</h1>
            </div>

            <div class="profile-circle">
                ${user.name.substring(0,1)}
            </div>

        </header>


        <!-- Welcome Banner -->
        <section class="welcome-card">

            <div class="welcome-content">
                <p class="eyebrow">MAKE A DIFFERENCE</p>

                <h2>
                    Help turn surplus food<br>
                    into meaningful meals.
                </h2>

                <p>
                    Find available food donations, manage your requests
                    and track your donations from one place.
                </p>

                <a href="/available_donations" class="primary-btn">
                    View Available Donations →
                </a>
            </div>

            <div class="welcome-symbol">
                🍲
            </div>

        </section>


        <!-- Dashboard Cards -->
        <section class="section">

            <div class="section-heading">
                <h2>Quick Access</h2>
                <p>Manage your NGO activities</p>
            </div>

            <div class="cards">

                <a href="/available_donations" class="dashboard-card">

                    <div class="card-icon coral">
                        🍱
                    </div>

                    <h3>Available Donations</h3>

                    <p>
                        Browse food donations available
                        for your NGO.
                    </p>

                    <span class="card-link">
                        Explore donations →
                    </span>

                </a>


                <a href="/track_donations" class="dashboard-card">

                    <div class="card-icon green">
                        📦
                    </div>

                    <h3>Track Donations</h3>

                    <p>
                        Check the status of your accepted
                        food donations.
                    </p>

                    <span class="card-link">
                        Track donations →
                    </span>

                </a>


                <a href="/rejected_donations" class="dashboard-card">

                    <div class="card-icon light-coral">
                        ↩
                    </div>

                    <h3>Rejected Donations</h3>

                    <p>
                        View donations that were rejected
                        or unavailable.
                    </p>

                    <span class="card-link">
                        View records →
                    </span>

                </a>


                <a href="/profile" class="dashboard-card">

                    <div class="card-icon light-green">
                        👤
                    </div>

                    <h3>My Profile</h3>

                    <p>
                        View and manage your NGO profile
                        information.
                    </p>

                    <span class="card-link">
                        View profile →
                    </span>

                </a>

            </div>

        </section>

    </main>

</div>

</body>
</html>