
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>FoodBridge | Food Donation & Distribution</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

	<header class="navbar">

	    <div class="brand">
	        <div class="brand-icon">F</div>
	        <span>Food<span>Bridge</span></span>
	    </div>

		<div class="nav-links">
		    <a href="#about" class="nav-item">About Us</a>
		    <a href="#contact" class="nav-item">Contact Us</a>
		    <a href="/login" class="nav-login">Login</a>
		    <a href="/register" class="nav-register">Get Started</a>
		</div>

	</header>


<section class="hero">

    <div class="hero-content">

        <div class="hero-label">
            FOOD DONATION & DISTRIBUTION
        </div>

        <h1>
            Food should reach
            <span>people,</span>
            not the bin.
        </h1>

        <p>
            FoodBridge connects food donors with NGOs to make
            surplus food available to communities that need it.
        </p>

        <div class="hero-buttons">

            <a href="/register" class="primary-btn">
                Start Donating
            </a>

            <a href="/login" class="outline-btn">
                Explore Platform →
            </a>

        </div>

        <div class="impact-row">

            <div>
                <strong>500+</strong>
                <small>Meals Shared</small>
            </div>

            <div>
                <strong>100+</strong>
                <small>Donors</small>
            </div>

            <div>
                <strong>50+</strong>
                <small>NGO Partners</small>
            </div>

        </div>

    </div>


    <div class="hero-visual">

        <div class="visual-card main-card">

			<div class="food-image">
			    <img src="${pageContext.request.contextPath}/images/home_image.jpg"
			         alt="Food donation">
			</div>

            <div class="visual-info">

                <div>
                    <small>AVAILABLE DONATION</small>
                    <h3>Fresh Meals</h3>
                </div>

                <div class="status">
                    Available
                </div>

            </div>

            <div class="location">
                📍 Pune, Maharashtra
            </div>

        </div>

        <div class="floating-card">
            <div class="check">✓</div>
            <div>
                <strong>Donation matched</strong>
                <small>Ready for distribution</small>
            </div>
        </div>

    </div>

</section>


<section class="how-section">

    <div class="section-heading">

        <div class="hero-label">HOW IT WORKS</div>

        <h2>One platform. Three simple steps.</h2>

        <p>
            Making food donation easier for everyone.
        </p>

    </div>


    <div class="steps">

        <div class="step-card">
            <div class="step-number">01</div>
            <h3>Donate Food</h3>
            <p>
                Donors add available surplus food and
                pickup details to the platform.
            </p>
        </div>

        <div class="step-card">
            <div class="step-number">02</div>
            <h3>Connect with NGOs</h3>
            <p>
                NGOs discover suitable donations and
                coordinate collection.
            </p>
        </div>

        <div class="step-card">
            <div class="step-number">03</div>
            <h3>Distribute</h3>
            <p>
                Food reaches people and communities
                who need it.
            </p>
        </div>

    </div>

</section>

<section class="about-section" id="about">

    <div class="about-content">

        <div class="hero-label">ABOUT FOODBRIDGE</div>

        <h2>Connecting surplus food with people who need it.</h2>

        <p>
            FoodBridge is a food donation and distribution platform
            that connects food donors with NGOs. Our goal is to reduce
            food wastage and make surplus food available to communities
            in need.
        </p>

        <p>
            Donors can share available food, while NGOs can discover
            donations, coordinate pickups and manage distribution
            through one platform.
        </p>

    </div>

</section>
<section class="contact-section" id="contact">

    <div class="section-heading">

        <div class="hero-label">CONTACT US</div>

        <h2>Let's make a difference together.</h2>

        <p>
            Have a question or want to contribute? Get in touch with us.
        </p>

    </div>

    <div class="contact-info">

        <div>
            <strong>Email</strong>
            <span>foodbridge@gmail.com</span>
        </div>

        <div>
            <strong>Location</strong>
            <span>Pune, Maharashtra</span>
        </div>

        <div>
            <strong>Support</strong>
            <span>Available for donors and NGOs</span>
        </div>

    </div>

</section>
<footer>

    <div class="brand footer-brand">
        <div class="brand-icon">F</div>
        <span>Food<span>Bridge</span></span>
    </div>

    <p>
        Connecting food with those who need it.
    </p>

    <small>© 2026 FoodBridge. All rights reserved.</small>

</footer>

</body>
</html>
