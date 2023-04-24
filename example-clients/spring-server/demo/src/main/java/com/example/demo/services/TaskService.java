package com.example.demo.services;

import java.util.ArrayList;
import java.util.List;

import com.example.demo.domain.Task;
import com.example.demo.repositories.TaskRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaskService {
    @Autowired
    TaskRepository taskRepository;

    public Task createTask(Task task) {
      return taskRepository.save(task);
    }
    public List<Task> getTasks() {
      List<Task> tasks = new ArrayList<Task>();
      taskRepository.findAll().forEach(tasks::add);
      return tasks;
    }
    public Task updateTask(Task task) {
      return taskRepository.save(task);
    }
    public void deleteTask(Long id) {
      taskRepository.deleteById(id);
    }
}
