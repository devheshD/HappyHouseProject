package com.ssafy.house.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.house.dto.ClinicCoronaDto;
import com.ssafy.house.service.ClinicService;

@Controller
@RequestMapping("/clinic")
public class ClinicController {

	@Autowired
	ClinicService service;
	
	@GetMapping("/corona")
	public String main(@RequestParam String page, Model model) {
		List<ClinicCoronaDto> list = service.searchAll(page);
		
		model.addAttribute("coronaClinicList", list);
		
		return "clinic/corona";
	}
	
}
