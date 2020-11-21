package com.ssafy.house.repository;

import java.util.List;
import java.util.Map;

import com.ssafy.house.dto.ClinicCoronaDto;
import com.ssafy.house.util.PageNavigation;

public interface ClinicRepository {
	public List<ClinicCoronaDto> searchAll(Map<String, Integer> map);
	public int getTotalCount();
}
