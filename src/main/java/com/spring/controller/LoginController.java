package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LoginController {
	
	@GetMapping("login")
	public String login() {
		return "login";
	}

	@GetMapping("logout")
	public String logout() {
		return "logout";
	}

	@GetMapping("signup")
	public String signup() {
		return "signup";
	}
}
