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
	public List<ClinicCoronaDto> searchAll(String page) {
		Map map = new HashMap<String, Integer>();
		int curPage = Integer.parseInt(page);
		int pageCnt = 10;						// 보여줄 게시글의 갯수
		int start = (curPage - 1) * pageCnt;	// 보여줄 게시글의 시작
		map.put("start", start);
		map.put("pageCnt", pageCnt);
		
		return repo.searchAll(map);
	}
	

	@Override
	public List<ClinicCoronaDto> searchHealthCenter(String page, String clinicName) {
		Map map = new HashMap<String, Object>();
		int curPage = Integer.parseInt(page);
		int pageCnt = 10;						// 보여줄 게시글의 갯수
		int start = (curPage - 1) * pageCnt;	// 보여줄 게시글의 시작
		map.put("start", start);
		map.put("pageCnt", pageCnt);
		map.put("clinicName", clinicName);
		
		return repo.searchHealthCenter(map);
	}	


	@Override
	public List<ClinicCoronaDto> searchCity(String page, String city) {
		Map map = new HashMap<String, Object>();
		int curPage = Integer.parseInt(page);
		int pageCnt = 10;						// 보여줄 게시글의 갯수
		int start = (curPage - 1) * pageCnt;	// 보여줄 게시글의 시작
		map.put("start", start);
		map.put("pageCnt", pageCnt);
		map.put("city", city);
		
		return repo.searchCity(map);
	}
	
	@Override
	public ClinicCoronaDto detailPage(String name) {
		return repo.detailPage(name);
	}
	
	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("page"));    // 현재 페이지 번호
		int sizePerPage = naviSize;								// 페이지 글 갯수
		int totalCount = repo.getTotalCount(map);
		
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
