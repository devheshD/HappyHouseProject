package com.ssafy.house.service;

import java.util.List;
import java.util.Map;

import com.ssafy.house.dto.ClinicCoronaDto;
import com.ssafy.house.dto.ClinicHospitalDto;
import com.ssafy.house.util.PageNavigation;

public interface ClinicService {
	public List<ClinicCoronaDto> healthCenterAll(String page);
	public List<ClinicCoronaDto> searchHealthCenterName(String page, String word);
	public List<ClinicCoronaDto> searchHealthCenterCity(String page, String word);
	public ClinicCoronaDto detailHealthCenterPage(String name);
	
	public List<ClinicHospitalDto> hospitalAll(String page);
	public List<ClinicHospitalDto> searchHospitalName(String page, String word);
	public List<ClinicHospitalDto> searchHospitalGugun(String page, String word);
	public ClinicHospitalDto detailHospitalPage(String name);

	public PageNavigation makePageNavigation(Map<String, String> map, String name);
}
