package com.spring.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.entity.Task;
import com.spring.entity.User;
import com.spring.service.TaskService;
import com.spring.service.UserService;

@Controller
@RequestMapping("/")
@SessionAttributes(names = {"user","username","tasks"})
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private TaskService taskService;
	
	@GetMapping(value = {"home", "/"})
	public ModelAndView home(ModelMap map, Principal principal) {
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("username", principal.getName());
		map.addAttribute("username", principal.getName());		
		
		User user = this.userService.getUserByUsername(principal.getName());
		mv.addObject("user", user);
		map.addAttribute("user", user);
		
		if(user.getRole() != null && user.getRole().equalsIgnoreCase("user")) {
			List<Task> activeTasks = this.taskService.getActiveTasks(user);
			mv.addObject("tasks", activeTasks);
			map.addAttribute("tasks", activeTasks);
		} else {
			List<Task> tasks = this.taskService.getTasks();
			mv.addObject("tasks", tasks);
			map.addAttribute("tasks", tasks);
		}
		
		return mv;
	}

}
