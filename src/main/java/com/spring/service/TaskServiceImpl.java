package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.entity.Task;
import com.spring.entity.User;
import com.spring.repository.TaskRepository;

@Service
public class TaskServiceImpl implements TaskService {

	@Autowired
	private TaskRepository taskRepository;
	
	@Override
	public List<Task> getTasks() {
		return this.taskRepository.findAll();
		
	}
	
	@Override
	public List<Task> getActiveTasks(User user) {
		return this.taskRepository.getActiveTasks(user);
		
	}
	
	@Override
	@Transactional(isolation = Isolation.SERIALIZABLE,propagation = Propagation.REQUIRED)
	public void addTask(Task task) {
		this.taskRepository.saveAndFlush(task);
	}

	@Override
	@Transactional(isolation = Isolation.SERIALIZABLE,propagation = Propagation.REQUIRED)
	public Map<String,String> updateTaskStatus(int taskId) {
		Map<String,String> hm = new HashMap<>();
		try {
			this.taskRepository.updateTaskStatus(taskId);
			hm.put("status","success");
		} catch(Exception ex) {
			hm.put("status","error");
		}
		return hm;
	}
}
