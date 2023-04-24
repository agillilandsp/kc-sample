package com.example.demo.repositories;

import com.example.demo.domain.Task;

import org.springframework.data.repository.CrudRepository;

public interface TaskRepository extends CrudRepository<Task, Long> {
    
}
