package com.example.springboot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@RestController
//@RequestMapping("/")
public class TodoController {


	private static Logger logger = LoggerFactory.getLogger(TodoController.class);

	public String index() {
		return "Greetings from Spring Boot!";
	}

	private final TodoRepository todoRepository;

	public TodoController(TodoRepository todoRepository) {
		this.todoRepository = todoRepository;
	}


	@RequestMapping("/home")
	public Map<String, Object> home() {
		logger.info("Request '/home' path.");
		final Map<String, Object> model = new HashMap<String, Object>();
		model.put("id", UUID.randomUUID().toString());
		model.put("content", "home");
		return model;
	}


	@PostMapping("/api/v1/todos")
	@ResponseStatus(HttpStatus.CREATED)
	public Todo createTodo(@RequestBody Todo todo) {
		return todoRepository.save(todo);
	}

	@GetMapping("/api/v1/todos")
	public Iterable<Todo> getTodos() {
		return todoRepository.findAll();
	}


	@DeleteMapping("/api/v1/todos/{id}")
	public ResponseEntity<String> delTodos(@PathVariable("id") String id) {
		try {
			Optional<Todo> todoItem = todoRepository.findById(new Long(id));
			if (todoItem.isPresent()) {
				todoRepository.deleteById(new Long(id));
				return new ResponseEntity<>("Deleted", HttpStatus.OK);
			}
			return new ResponseEntity<>("Not found", HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			logger.error("Delete errors: ", e);
			return new ResponseEntity<>("Deletion failed", HttpStatus.NOT_FOUND);
		}
	}

}
