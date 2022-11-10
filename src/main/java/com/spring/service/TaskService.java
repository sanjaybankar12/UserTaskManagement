package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.entity.Task;
import com.spring.entity.User;

public interface TaskService {

	List<Task> getTasks();

	List<Task> getActiveTasks(User user);

	void addTask(Task task);

	Map<String,String> updateTaskStatus(int taskId);

}
