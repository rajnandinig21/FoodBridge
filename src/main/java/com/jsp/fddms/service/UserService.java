package com.jsp.fddms.service;

import com.jsp.fddms.entity.User;

public interface UserService {
	
	String registerUser(User user);
	
	User loginUser(String email,String password);
	
	User updateProfile(User user);
	
	User findByEmail(String email);
	
	User findUserById(int id);

}
