package com.uc.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		//esta clase inicia el tomcat, no se debe tocar!
		SpringApplication.run(Application.class, args);
	}

}
