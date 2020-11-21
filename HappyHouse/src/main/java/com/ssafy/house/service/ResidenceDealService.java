package com.ssafy.house.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.house.dto.ResidenceBuyDto;
import com.ssafy.house.dto.ResidenceRentDto;
import com.ssafy.house.util.PageNavigation;

public interface ResidenceDealService {
	public List<ResidenceBuyDto> searchBuy(Map<String, String> map) throws Exception;
	List<ResidenceBuyDto> searchBuyName(Map<String, String> map) throws Exception;
	List<ResidenceBuyDto> searchBuyDongName(Map<String, String> map) throws Exception;
	public ResidenceBuyDto show(int no) throws SQLException;

	public List<ResidenceRentDto> searchRent(Map<String, String> map) throws Exception;
	List<ResidenceRentDto> searchRentName(Map<String, String> map) throws Exception;
	List<ResidenceRentDto> searchRentDongName(Map<String, String> map) throws Exception;
	public ResidenceRentDto showRent(int no) throws SQLException;
	
	public PageNavigation makePageNavigationBuy(Map<String, String> map) throws Exception;
	public PageNavigation makePageNavigationRent(Map<String, String> map) throws Exception;
}
