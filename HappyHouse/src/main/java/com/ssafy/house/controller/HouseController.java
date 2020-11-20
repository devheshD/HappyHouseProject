package com.ssafy.house.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/apt")
public class HouseController {

	
	@GetMapping("/apt")
	public String test() {
		System.out.println("들어옵니다.");
		return "apt/apt";
	}
}
