package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.entity.User;
import com.spring.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoder passwordEnoceder;
	
	@Override
	public void addUser(User user) {
		user.setPassword(this.passwordEnoceder.encode(user.getPassword()));
		this.userRepository.save(user);
	}
	
	@Override
	public User getUserByUsername(String username) {
		return this.userRepository.findByUsername(username);
	}
	
	
}
