package com.jsp.fddms.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jsp.fddms.entity.User;
import com.jsp.fddms.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public String registerUser(User user) {
		if(userRepo.existsByEmail(user.getEmail())) {
			return "Email Already Exists";
		}
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		userRepo.save(user);
		
		return "Registration Successful";
	}

	@Override
	public User loginUser(String email, String password) {
		Optional<User> optional = userRepo.findByEmail(email);
		if(optional.isPresent()) {
			User user = optional.get();
			if(passwordEncoder.matches(password, user.getPassword())) {
				return user;
			}
		}
		return null;
	}

	@Override
	public User updateProfile(User user) {
		return userRepo.save(user);
	}

	@Override
	public User findByEmail(String email) {
		return userRepo.findByEmail(email).orElse(null);
	}

	@Override
	public User findUserById(int id) {
	    return userRepo.findById(id).orElse(null);
	}
}
