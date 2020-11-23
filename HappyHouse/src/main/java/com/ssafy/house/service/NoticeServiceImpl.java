package com.ssafy.house.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.house.dto.NoticeDto;
import com.ssafy.house.repository.NoticeRepository;
import com.ssafy.house.util.PageNavigation;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeRepository noticeReop;

	@Override
	public void write(NoticeDto noticeDto) throws Exception {
		if (noticeDto.getTitle() == null || noticeDto.getContent() == null)
			throw new Exception();
		noticeReop.write(noticeDto);
	}

	@Override
	public NoticeDto show(int no) throws SQLException {
		return noticeReop.show(no);
	}

	@Override
	public NoticeDto getInfo(int no) throws SQLException {
		return noticeReop.show(no);
	}
	
	@Override
	public void modifyInfo(NoticeDto noticeDto) throws SQLException {
		noticeReop.modifyInfo(noticeDto);
	}

	@Override
	public void delete(int no) throws SQLException {
		noticeReop.delete(no);
	}

	public PageNavigation makePageNavigation(Map<String, String> map)
			throws Exception {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg"));	// 현재 페이지 번호
		int sizePerPage = Integer.parseInt(map.get("spp"));	// 페이지 글 갯수
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = noticeReop.getTotalCount(map);
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
	public List<NoticeDto> list(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		
		return noticeReop.list(param);
	}
}
