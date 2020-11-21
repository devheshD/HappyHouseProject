package com.ssafy.house.repository;

import java.util.List;
import java.util.Map;

import com.ssafy.house.dto.ClinicCoronaDto;

public interface ClinicRepository {
	public List<ClinicCoronaDto> searchAll(Map<String, Integer> map);

}
