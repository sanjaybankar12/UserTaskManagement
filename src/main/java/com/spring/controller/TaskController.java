package com.spring.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.entity.Task;
import com.spring.entity.User;
import com.spring.service.TaskService;

@Controller
@RequestMapping("/task")
@SessionAttributes(names = {"user","username","tasks"})
public class TaskController {
	
	@Autowired
	private TaskService taskService;
	
	@GetMapping()
	public ModelAndView getTasks() {
		ModelAndView mv = new ModelAndView("home");		
		List<Task> tasks = this.taskService.getTasks();
		mv.addObject("tasks", tasks);
		
		return mv;
	}

	
	@PutMapping("/{id}")
	@ResponseBody
	@ResponseStatus(code = HttpStatus.OK)
	public Map<String,String> updateTaskStatus(@PathVariable("id") int taskId) {		
		return this.taskService.updateTaskStatus(taskId);				
	}
	
	@PostMapping("/save")
	public ModelAndView addTask(ModelMap map, Task task) {		
		User user = (User)map.getAttribute("user");
		task.setUser(user);
		this.taskService.addTask(task);
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("username", map.getAttribute("username"));
		mv.addObject("user", user);
		mv.addObject("tasks", map.getAttribute("tasks"));

		return mv;
	}
	
	@GetMapping("/add")
	public ModelAndView getTaskForm(ModelMap map) {		
		ModelAndView mv = new ModelAndView("addtask");
		mv.addObject("username", map.getAttribute("username"));

		return mv;
	}

}
