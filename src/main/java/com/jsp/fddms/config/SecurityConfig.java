
package com.jsp.fddms.config;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;

@Configuration
public class SecurityConfig {

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService(JdbcTemplate jdbcTemplate) {
        return email -> {
            List<Map<String, Object>> users = jdbcTemplate.queryForList(
                "SELECT email, password, role FROM users WHERE email = ?",
                email
            );

            if (users.isEmpty()) {
                throw new UsernameNotFoundException("User not found");
            }

            Map<String, Object> user = users.get(0);
            String role = String.valueOf(user.get("role"))
                                .toUpperCase()
                                .replace("ROLE_", "");

            return User.withUsername(String.valueOf(user.get("email")))
                    .password(String.valueOf(user.get("password")))
                    .authorities(new SimpleGrantedAuthority("ROLE_" + role))
                    .build();
        };
    }




@Bean
public SecurityFilterChain securityFilterChain(
        HttpSecurity http) throws Exception {

    http
        .csrf(csrf -> csrf.disable())

.authorizeHttpRequests(auth -> auth
		.requestMatchers(
			    "/", "/error", "/login", "/register",
			    "/login_success", "/access-denied",
			    "/css/**", "/js/**", "/images/**",
			    "/uploads/**", "/forgot_password",
			    "/verify_otp", "/reset_password"
			).permitAll()

    // Donor-only pages and actions
    .requestMatchers(
        "/donor_dashboard", "/add_donation",
        "/my_donations", "/edit_donation",
        "/update_donation", "/delete_donation",
        "/pickup_requests", "/accept_request",
        "/reject_request"
    ).hasRole("DONOR")

    // NGO-only pages and actions
    .requestMatchers(
        "/ngo_dashboard", "/available_donations",
        "/accepted_donations", "/request_donation",
        "/track_donations", "/complete_pickup",
        "/rejected_donations"
    ).hasRole("NGO")

    // Shared pages for both roles
    .requestMatchers(
        "/profile", "/edit_profile", "/update_profile"
    ).hasAnyRole("DONOR", "NGO")

    .anyRequest().permitAll()
)

.exceptionHandling(exception -> exception
	    .accessDeniedHandler((request, response, accessDeniedException) -> {
	        response.setStatus(HttpStatus.FORBIDDEN.value());
	        request.setAttribute(
	            "errorMessage",
	            "Access Denied! You don't have permission to access this page."
	        );
	        request.getRequestDispatcher("/access-denied")
	               .forward(request, response);
	    })
	)
        .formLogin(form -> form
            .loginPage("/login")
            .loginProcessingUrl("/login")
            .usernameParameter("email")
            .passwordParameter("password")
            .failureUrl("/login?error=true")
            .defaultSuccessUrl("/login_success", true)
            .permitAll()
        );

    return http.build();
}



}
