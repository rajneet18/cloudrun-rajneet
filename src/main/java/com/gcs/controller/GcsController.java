package com.gcs.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GcsController {
	@GetMapping("/test")
	public String getAllUserData() {
		return "success !!!";
	}
}
