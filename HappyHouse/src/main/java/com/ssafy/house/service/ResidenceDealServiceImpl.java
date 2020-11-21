package com.ssafy.house.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.house.dto.ResidenceBuyDto;
import com.ssafy.house.dto.ResidenceRentDto;
import com.ssafy.house.repository.ResidenceDealRepository;
import com.ssafy.house.util.PageNavigation;

@Service
public class ResidenceDealServiceImpl implements ResidenceDealService {

	@Autowired
	private ResidenceDealRepository residenceRepo;

	/**
	 * 주택 매매
	 */
	@Override
	public List<ResidenceBuyDto> searchBuy(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		try {
			return residenceRepo.searchBuy(param);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<ResidenceBuyDto> searchBuyName(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		param.put("resName", map.get("resName"));
		try {
			return residenceRepo.searchBuyName(param);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<ResidenceBuyDto> searchBuyDongName(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		param.put("dongName", map.get("dongName"));
		try {
			return residenceRepo.searchBuyDongName(param);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ResidenceBuyDto show(int no) throws SQLException {
		return residenceRepo.show(no);
	}

	public PageNavigation makePageNavigationBuy(Map<String, String> map) throws Exception {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg")); // 현재 페이지 번호
		int sizePerPage = Integer.parseInt(map.get("spp")); // 페이지 글 갯수
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = residenceRepo.getTotalCountBuy(map);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}

	/**
	 * 주택 전월세
	 */
	@Override
	public List<ResidenceRentDto> searchRent(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		try {
			return residenceRepo.searchRent(param);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ResidenceRentDto showRent(int no) throws SQLException {
		return residenceRepo.showRent(no);
	}

	public PageNavigation makePageNavigationRent(Map<String, String> map) throws Exception {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg")); // 현재 페이지 번호
		int sizePerPage = Integer.parseInt(map.get("spp")); // 페이지 글 갯수
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = residenceRepo.getTotalCountRent(map);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}

	@Override
	public List<ResidenceRentDto> searchRentName(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		param.put("resName", map.get("resName"));
		try {
			return residenceRepo.searchRentName(param);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<ResidenceRentDto> searchRentDongName(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		param.put("dongName", map.get("dongName"));
		try {
			return residenceRepo.searchRentDongName(param);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
