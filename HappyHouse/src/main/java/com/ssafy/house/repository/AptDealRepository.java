package com.ssafy.house.repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.house.dto.AptDealDto;


public interface AptDealRepository {
	public abstract List<AptDealDto> searchAll(Map<String, Object> param) throws ClassNotFoundException, SQLException;
	public List<AptDealDto> searchAptName(Map<String, Object> param) throws SQLException, ClassNotFoundException;
	public List<AptDealDto> searchDongName(Map<String, Object> param) throws SQLException, ClassNotFoundException;

	public AptDealDto show(int no) throws SQLException;
	
	public int getTotalCount(Map<String, String> map) throws SQLException;
}
