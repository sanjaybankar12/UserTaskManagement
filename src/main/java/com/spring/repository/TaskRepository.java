package com.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spring.entity.Task;
import com.spring.entity.User;

public interface TaskRepository extends JpaRepository<Task, Integer> {

	@Query("from Task t where t.isActive = true and t.user = :user")
	List<Task> getActiveTasks(@Param(value = "user") User user);

	@Modifying
	@Query("update Task t set t.isActive = true where t.id = :id")
	void updateTaskStatus(@Param(value = "id") int taskId);	
	
}
