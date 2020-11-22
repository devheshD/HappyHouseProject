package com.ssafy.house.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.house.dto.ClinicCoronaDto;
import com.ssafy.house.repository.ClinicRepository;
import com.ssafy.house.util.PageNavigation;

@Service
public class ClinicServiceImpl implements ClinicService {

	@Autowired
	ClinicRepository repo;
	
	@Override
	public List<ClinicCoronaDto> healthCenterAll(String page) {
		Map map = new HashMap<String, Integer>();
		int curPage = Integer.parseInt(page);
		int pageCnt = 10;						// 보여줄 게시글의 갯수
		int start = (curPage - 1) * pageCnt;	// 보여줄 게시글의 시작
		map.put("start", start);
		map.put("pageCnt", pageCnt);
		
		return repo.healthCenterAll(map);
	}
	

	@Override
	public List<ClinicCoronaDto> searchHealthCenterName(String page, String clinicName) {
		Map map = new HashMap<String, Object>();
		int curPage = Integer.parseInt(page);
		int pageCnt = 10;						// 보여줄 게시글의 갯수
		int start = (curPage - 1) * pageCnt;	// 보여줄 게시글의 시작
		map.put("start", start);
		map.put("pageCnt", pageCnt);
		map.put("clinicName", clinicName);
		
		return repo.searchHealthCenterName(map);
	}	


	@Override
	public List<ClinicCoronaDto> searchHealthCenterCity(String page, String city) {
		Map map = new HashMap<String, Object>();
		int curPage = Integer.parseInt(page);
		int pageCnt = 10;						// 보여줄 게시글의 갯수
		int start = (curPage - 1) * pageCnt;	// 보여줄 게시글의 시작
		map.put("start", start);
		map.put("pageCnt", pageCnt);
		map.put("city", city);
		
		return repo.searchHealthCenterCity(map);
	}
	
	@Override
	public ClinicCoronaDto detailHealthCenterPage(String name) {
		return repo.detailHealthCenterPage(name);
	}
	
	@Override
	public PageNavigation makePageNavigationHealthCenter(Map<String, String> map) {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("page"));    // 현재 페이지 번호
		int sizePerPage = naviSize;								// 페이지 글 갯수
		int totalCount = repo.getHealthCenterTotalCount(map);
		
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
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




}
