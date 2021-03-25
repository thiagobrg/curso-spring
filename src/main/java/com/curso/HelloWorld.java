package com.curso;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorld {
	
	@GetMapping(value = "/")
	public String getMethodName() {
		return new String("Hello World!!");
	}


}
