package com.ssafy.house.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.house.dto.ClinicCoronaDto;
import com.ssafy.house.service.ClinicService;
import com.ssafy.house.util.PageNavigation;

@Controller
@RequestMapping("/clinic")
public class ClinicController {

	@Autowired
	ClinicService service;
	
	@GetMapping("/corona")
	public String corona(@RequestParam String page, Model model) {
		List<ClinicCoronaDto> list = service.searchAll(page);
		// 페이징 처리
		Map map = new HashMap<String, String>();
		map.put("page", page);
		PageNavigation pageNavigation = service.makePageNavigation(map);
		
		model.addAttribute("coronaClinicList", list);
		model.addAttribute("pageNavigation", pageNavigation);
		
		return "clinic/corona";
	}
	
	@GetMapping("/search")
	public String healthCenter(@RequestParam String page, @RequestParam String word,  @RequestParam String keyword, Model model) {
		Map map = new HashMap<String, String>();
		List<ClinicCoronaDto> list = null;
		
		// 보건소 이름으로 검색시
		if (keyword.equals("healthCenterName")) {
			list = service.searchHealthCenter(page, word);
			for (int i = 0; i < list.size();i++) {
				System.out.println(list.get(i).getCity());
			}
		} 
		// 도시로 으로 검색시
		else if (keyword.equals("city")) {
			list = service.searchCity(page, word);
		}
		
		map.put("page", page);
		map.put("searchKeyword", word);
		PageNavigation pageNavigation = service.makePageNavigation(map);
		
		model.addAttribute("pageNavigation", pageNavigation);
		model.addAttribute("coronaClinicList", list);
		
		return "clinic/corona";
	}
	
	@GetMapping("/coronaDetail")
	public String detailPage(@RequestParam String name, Model model) {
		ClinicCoronaDto dto = service.detailPage(name);
		model.addAttribute("detail", dto);
		
		return "clinic/coronaDetail";
	}
	
}
