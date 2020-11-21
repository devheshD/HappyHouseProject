package com.ssafy.house.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.house.dto.ClinicCoronaDto;
import com.ssafy.house.repository.ClinicRepository;

@Service
public class ClinicServiceImpl implements ClinicService {

	@Autowired
	ClinicRepository repo;
	
	@Override
	public List<ClinicCoronaDto> searchAll(String page) {
		Map map = new HashMap<String, Integer>();
		int curPage = Integer.parseInt(page);
		int sizePerPage = 10;
		int start = (curPage - 1) * sizePerPage;
		map.put("start", start);
		map.put("sizePerPage", sizePerPage);
		
		return repo.searchAll(map);
	}

}
