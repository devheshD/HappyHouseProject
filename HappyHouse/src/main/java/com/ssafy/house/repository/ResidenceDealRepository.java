package com.ssafy.house.repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.house.dto.ResidenceBuyDto;
import com.ssafy.house.dto.ResidenceRentDto;

public interface ResidenceDealRepository {
	public List<ResidenceBuyDto> searchBuy(Map<String, Object> param) throws SQLException, ClassNotFoundException;
	public List<ResidenceBuyDto> searchBuyName(Map<String, Object> param) throws SQLException, ClassNotFoundException;
	public List<ResidenceBuyDto> searchBuyDongName(Map<String, Object> param) throws SQLException, ClassNotFoundException;
	public ResidenceBuyDto show(int no) throws SQLException;
	public int getTotalCountBuy(Map<String, String> map) throws SQLException;
	
	public List<ResidenceRentDto> searchRent(Map<String, Object> param) throws SQLException, ClassNotFoundException;
	public List<ResidenceRentDto> searchRentName(Map<String, Object> param) throws SQLException, ClassNotFoundException;
	public List<ResidenceRentDto> searchRentDongName(Map<String, Object> param) throws SQLException, ClassNotFoundException;
	public ResidenceRentDto showRent(int no) throws SQLException;
	public int getTotalCountRent(Map<String, String> map) throws SQLException;
}
