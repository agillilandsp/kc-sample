package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import static org.springframework.web.bind.annotation.RequestMethod.DELETE;
import static org.springframework.web.bind.annotation.RequestMethod.PUT;

import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import com.example.demo.domain.Message;
import com.example.demo.domain.Task;
import com.example.demo.services.TaskService;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin(maxAge = 3600)
@RestController
@RequestMapping("/todo")
public class ToDo {
    @Autowired TaskService taskService;

    @RequestMapping(method = GET, produces="application/json")
    public List<Task> getList() {
        return taskService.getTasks();
    }
    @RequestMapping(method = POST, produces="application/json")
    @ResponseBody
    public Task createTask(@RequestBody Task task) {
        return taskService.createTask(task);
    }


    @RequestMapping(method = DELETE)
    @ResponseBody
    public Message removeTask(@RequestParam Long id) {
        taskService.deleteTask(id);
        return new Message("deleted");
    }

    @RequestMapping(method = PUT)
    @ResponseBody
    public Task updateTask(@RequestBody Task task) {
        return taskService.updateTask(task);
    }
}
