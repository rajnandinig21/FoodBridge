<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>FoodBridge | Register</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/register.css">

</head>

<body>

<div class="register-page">

    <div class="register-card">

        <!-- BRAND -->

        <div class="register-brand">

            <div class="brand-icon">F</div>

            <span>Food<span>Bridge</span></span>

        </div>


        <!-- HEADING -->

        <div class="register-heading">

            <h1>Create an account</h1>

            <p>Join FoodBridge and make a difference</p>

        </div>


        <h3 class="message">${message}</h3>


        <!-- FORM -->

        <form action="/register" method="post">

            <div class="form-row">

                <div class="form-group">

                    <label>Name</label>

                    <input type="text"
                           name="name"
                           placeholder="Enter full name"
                           required>

                </div>


                <div class="form-group">

                    <label>Phone No.</label>

                    <input type="text"
                           name="phone"
                           placeholder="Enter phone number"
                           required>

                </div>

            </div>


            <div class="form-group">

                <label>Email Address</label>

                <input type="email"
                       name="email"
                       placeholder="Enter correct email"
                       required>

            </div>


            <div class="form-group">

                <label>Password</label>

                <input type="password"
                       name="password"
                       placeholder="Enter strong password"
                       required>

            </div>


            <div class="form-group">

                <label>Address</label>

                <textarea name="address"
                          placeholder="Enter address here"
                          required></textarea>

            </div>


            <div class="form-group">

                <label>Role</label>

                <select name="role" required>

                    <option value="">Select Role</option>

                    <option value="DONOR">Donor</option>

                    <option value="NGO">NGO</option>

                </select>

            </div>


            <button type="submit" class="register-btn">
                Create Account
            </button>

        </form>


        <div class="login-text">

            Already have an account?

            <a href="/login">Login</a>

        </div>


        <a href="/" class="back-home">
            ← Back to Home
        </a>

    </div>

</div>

</body>

</html>