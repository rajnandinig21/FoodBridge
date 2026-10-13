<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>FoodBridge | My Profile</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/profile.css">

</head>

<body>

<div class="profile-page">

    <!-- SIDEBAR -->

    <aside class="sidebar">

        <div class="brand">
            <div class="brand-icon">F</div>
            <span>Food<span>Bridge</span></span>
        </div>

        <div class="sidebar-label">MY ACCOUNT</div>

        <nav>

            <a href="${pageContext.request.contextPath}/${sessionScope.user.role == 'NGO' ? 'ngo_dashboard' : 'donor_dashboard'}" class="nav-item">
                <span>⌂</span>
                Dashboard
            </a>

            <a href="/profile" class="nav-item active">
                <span>👤</span>
                My Profile
            </a>

            <a href="/logout" class="nav-item">
                <span>↪</span>
                Logout
            </a>

        </nav>

    </aside>


    <!-- MAIN CONTENT -->

    <main class="main-content">

        <div class="page-heading">

            <p>ACCOUNT</p>

            <h1>My Profile</h1>

            <span>
                View your FoodBridge account information.
            </span>

        </div>


        <!-- PROFILE CARD -->

        <section class="profile-card">

            <div class="profile-top">

                <div class="avatar">
                    ${user.name.substring(0,1)}
                </div>

                <div class="profile-name">

                    <h2>${user.name}</h2>

                    <p>${user.role}</p>

                </div>

                <a href="/edit_profile" class="edit-btn">
                    Edit Profile
                </a>

            </div>


            <div class="divider"></div>


            <div class="profile-details">

                <div class="detail">

                    <label>Full Name</label>

                    <p>${user.name}</p>

                </div>


                <div class="detail">

                    <label>Email Address</label>

                    <p>${user.email}</p>

                </div>


                <div class="detail">

                    <label>Role</label>

                    <p>${user.role}</p>

                </div>


                <div class="detail">

                    <label>Phone Number</label>

                    <p>${user.phone}</p>

                </div>


                <div class="detail address-detail">

                    <label>Address</label>

                    <p>${user.address}</p>

                </div>

            </div>

        </section>

    </main>

</div>

</body>

</html>