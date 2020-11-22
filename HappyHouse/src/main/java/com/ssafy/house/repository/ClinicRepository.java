package com.ssafy.house.repository;

import java.util.List;
import java.util.Map;

import com.ssafy.house.dto.ClinicCoronaDto;
import com.ssafy.house.dto.ClinicHospitalDto;
import com.ssafy.house.util.PageNavigation;

public interface ClinicRepository {
	public List<ClinicCoronaDto> healthCenterAll(Map<String, Integer> map);
	public List<ClinicCoronaDto> searchHealthCenterName(Map<String, String> map);
	public List<ClinicCoronaDto> searchHealthCenterCity(Map<String, String> map);
	public ClinicCoronaDto detailHealthCenterPage(String name);
	public int getHealthCenterTotalCount(Map<String, String> map);
	
	public List<ClinicHospitalDto> hospitalAll(Map<String, Integer> map);
	public List<ClinicHospitalDto> searchHospitalName(Map<String, String> map);
	public List<ClinicHospitalDto> searchHospitalGugun(Map<String, String> map);
	public ClinicHospitalDto detailHospitalPage(String name);
	public int getHospitalTotalCount(Map<String, String> map);

}
