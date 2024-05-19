package com.example.ELKDemo;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class DemoController {

	private static final Logger LOG = LogManager.getLogger(DemoController.class);

	@GetMapping(value = "/info")
	public String echoMessage() {
		LOG.log(Level.INFO, "Info Triggered");
		return "Info Triggered";
	}

	@GetMapping(value = "/error")
	public String echoError() {
		LOG.log(Level.ERROR, "Error Triggered");
		return "Error Triggered";
	}
	
	@GetMapping(value = "/warning")
	public String echoWarning() {
		LOG.log(Level.WARN, "Warning Triggered");
		return "Warning Triggered";
	}
	
}
