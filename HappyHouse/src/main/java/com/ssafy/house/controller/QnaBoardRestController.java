package com.ssafy.house.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.house.dto.QnaBoardDto;
import com.ssafy.house.service.QnaBoardService;

@RestController
@RequestMapping("/qna")
@CrossOrigin("*")
public class QnaBoardRestController {
	
	@Autowired
	QnaBoardService qservice;
	
	@GetMapping("/board/{no}")
	public QnaBoardDto getQuestion(@PathVariable int no) {
		return qservice.select(no);
	}
	
	@GetMapping("/board")
	public List<QnaBoardDto> getAllQuestion(){
		return qservice.selectAll();
	}
	
	@PostMapping("/board")
	public int registQuestion(@RequestBody QnaBoardDto question) {
		return qservice.insert(question);
	}
	
	@PutMapping("/board/{no}")
	public int updateQuestion(@RequestBody QnaBoardDto question) {
		return qservice.update(question);
	}
	
	@DeleteMapping("/board/{no}")
	public int deleteQuestion(@PathVariable int no) {
		return qservice.delete(no);
	}
	
}
