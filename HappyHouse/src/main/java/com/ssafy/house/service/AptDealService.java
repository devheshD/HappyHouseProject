package com.ssafy.house.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.house.dto.AptDealDto;
import com.ssafy.house.util.PageNavigation;

public interface AptDealService {
	public List<AptDealDto> searchAll(Map<String, String> map) throws Exception;
	public List<AptDealDto> searchAptName(Map<String, String> map) throws Exception;
	public List<AptDealDto> searchDong(Map<String, String> map) throws Exception;	
	
	public AptDealDto show(int no) throws SQLException;
	
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
}
