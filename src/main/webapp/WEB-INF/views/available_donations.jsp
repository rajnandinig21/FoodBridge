
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Donations | FDDMS</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/available_donations.css">
</head>
<body class="available-page">

    <nav class="main-navbar">
        <a href="/ngo_dashboard" class="brand">
            <span class="brand-icon">F</span>
            <span>FoodBridge</span>
        </a>

        <div class="nav-links">
            <a href="/ngo_dashboard">Dashboard</a>
            
            <a href="/accepted_donations">Accepted Donations</a>
            <a href="/track_donations">Track Donations</a>
        </div>

        <a href="/logout" class="nav-profile">Home↗</a>
    </nav>

    <main class="donations-container">

        <section class="donations-hero">
            <div class="hero-content">
                <span class="eyebrow">FOOD DESERVES A SECOND CHANCE</span>

                <h1>Good food.<br>
                    <span>Greater impact.</span>
                </h1>

                <p>
                    Discover available food donations and help deliver
                    fresh meals to people who need them.
                </p>

                <div class="hero-note">
                    <span class="hero-dot"></span>
                    Every pickup makes a difference.
                </div>
            </div>

            <div class="hero-decoration">
                <div class="hero-circle circle-one"></div>
                <div class="hero-circle circle-two"></div>
                <div class="hero-stat">
                    <span class="stat-icon">♡</span>
                    <div>
                        <strong>Share more.</strong>
                        <small>Waste less.</small>
                    </div>
                </div>
                <span class="floating-leaf leaf-one">✳</span>
                <span class="floating-leaf leaf-two">✦</span>
            </div>
        </section>

        <section class="search-section">
            <div class="section-heading">
                <div>
                    <span class="eyebrow">FIND YOUR NEXT PICKUP</span>
                    <h2>Explore donations</h2>
                    <p>Find food that matches your community's needs.</p>
                </div>
                <span class="explore-label">Made for sharing ♡</span>
            </div>

            <form action="/search_donations" method="get" class="filter-form">
                <div class="search-field">
                    <span class="search-icon">⌕</span>
                    <input type="text" name="keyword"
                           placeholder="Search food, description or address">
                </div>

                <select name="foodCategory">
                    <option value="">All Categories</option>
                    <option value="Cooked Food">Cooked Food</option>
                    <option value="Raw Food">Raw Food</option>
                    <option value="Packaged Food">Packaged Food</option>
                    <option value="Beverages">Beverages</option>
                </select>

                <select name="foodType">
                    <option value="">All Food Types</option>
                    <option value="Veg">Veg</option>
                    <option value="Non-Veg">Non-Veg</option>
                </select>

                <select name="donorType">
                    <option value="">All Donors</option>
                    <option value="Individual">Individual</option>
                    <option value="Restaurant">Restaurant</option>
                    <option value="Hotel">Hotel</option>
                    <option value="Organization">Organization</option>
                    <option value="Other">Other</option>
                </select>

                <button type="submit" class="btn-primary">Find Food ↗</button>
                <a href="/available_donations" class="clear-link">Reset</a>
            </form>
        </section>

        <section class="donation-section">
            <div class="results-heading">
                <h2>Waiting to be shared <span>✳</span></h2>
                <p>Choose a donation to see more details.</p>
            </div>

            <div class="donation-grid">
                <c:forEach var="d" items="${donations}">

                    <article class="donation-card">

                        <div class="donation-image-wrap">
                            <c:choose>
                                <c:when test="${not empty d.photoPath}">
                                    <img src="${pageContext.request.contextPath}/uploads/${d.photoPath}"
                                         alt="${d.foodName}" class="donation-image">
                                </c:when>
                                <c:otherwise>
                                    <div class="food-placeholder">
                                        <span>♡</span>
                                        <small>Food worth sharing</small>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            <span class="category-badge">${d.foodCategory}</span>
                        </div>

                        <div class="donation-card-body">

                            <div class="food-heading">
                                <h3>${d.foodName}</h3>
                                <span class="food-type">${d.foodType}</span>
                            </div>

                            <div class="food-meta">
                                <div class="meta-item">
                                    <span class="meta-icon">▤</span>
                                    <div>
                                        <small>Quantity</small>
                                        <strong>${d.quantity}</strong>
                                    </div>
                                </div>

                                <div class="meta-item">
                                    <span class="meta-icon">◷</span>
                                    <div>
                                        <small>Expiry date</small>
                                        <strong>${d.expiryDate}</strong>
                                    </div>
                                </div>
                            </div>

                            <div class="card-actions">
                                <a href="/donation_details?id=${d.id}"
                                   class="btn-outline">View Details ↗</a>

                                <c:set var="alreadyRequested" value="false"/>

                                <c:forEach var="r" items="${requests}">
                                    <c:if test="${r.donation.id == d.id && r.status == 'PENDING'}">
                                        <c:set var="alreadyRequested" value="true"/>
                                    </c:if>
                                </c:forEach>

                                <c:choose>
                                    <c:when test="${alreadyRequested}">
                                        <span class="pending-badge">Request Pending</span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/request_donation?id=${d.id}"
                                           class="btn-coral">Request Pickup</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                        </div>
                    </article>

                </c:forEach>
            </div>

            <c:if test="${empty donations}">
                <div class="empty-state">
                    <span class="empty-icon">♡</span>
                    <h3>No donations found just yet</h3>
                    <p>Try changing your search filters or check back soon.</p>
                    <a href="/available_donations" class="btn-primary">
                        Explore All Donations
                    </a>
                </div>
            </c:if>
        </section>

        <footer class="page-footer">
            <a href="/ngo_dashboard">← Back to Dashboard</a>
            <span>FoodBridge · Good food, shared with care.</span>
        </footer>

    </main>
</body>
</html>

