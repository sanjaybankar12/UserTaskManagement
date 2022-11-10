package com.spring.service;

import com.spring.entity.User;

public interface UserService {

	void addUser(User user);

	User getUserByUsername(String username);

}
