package com.ssafy.house.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.house.dto.UserDto;
import com.ssafy.house.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService service;
	
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		UserDto userDto = service.login(map);
		
		if (userDto != null) {
			session.setAttribute("userDto", userDto);
			return "redirect:/";
		} else {
			model.addAttribute("msg", "아이디와 패스워드를 확인해주세요.");
			return "index";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@PostMapping("/signUp")
	public String signUp(@RequestParam Map<String, String> map) {
		String phone = map.get("tel1") + "-" + map.get("tel2") + "-" + map.get("tel3");
		map.put("phone", phone);
		service.signUp(map);

		return "redirect:/";
	}
	
	@PostMapping("/modify")
	public String modify(@RequestParam Map<String, String> map, HttpSession session) {
		String phone = map.get("tel1") + "-" + map.get("tel2") + "-" + map.get("tel3");
		map.put("phone", phone);
		service.modify(map);
		// 재로그인을 위한 세션 초기화
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/delete")
	public String delete(String userid, HttpSession session) {
		service.delete(userid);
	
		session.invalidate();
		
		return "redirect:/";
	}
}
