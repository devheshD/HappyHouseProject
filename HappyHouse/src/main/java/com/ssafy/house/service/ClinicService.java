package com.ssafy.house.service;

import java.util.List;
import java.util.Map;

import com.ssafy.house.dto.ClinicCoronaDto;
import com.ssafy.house.util.PageNavigation;

public interface ClinicService {
	public List<ClinicCoronaDto> searchAll(String page);
	public List<ClinicCoronaDto> searchHealthCenter(String page, String word);
	public List<ClinicCoronaDto> searchCity(String page, String word);
	public PageNavigation makePageNavigation(Map<String, String> map);

}
