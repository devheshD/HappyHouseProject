package com.ssafy.house.service;

import java.util.List;

import com.ssafy.house.dto.ClinicCoronaDto;

public interface ClinicService {
	public List<ClinicCoronaDto> searchAll(String page);
}
