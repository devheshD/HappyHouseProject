package com.ssafy.house.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.house.dto.NoticeDto;
import com.ssafy.house.util.PageNavigation;

public interface NoticeService {
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
	public List<NoticeDto> list(Map<String, String> map) throws Exception;
	
	public void write(NoticeDto noticeDto) throws Exception;
	public NoticeDto show(int no) throws SQLException;
	public void modifyInfo(NoticeDto noticeDto) throws SQLException;
	public void delete(int no) throws SQLException;
	public NoticeDto getInfo(int no) throws SQLException;
}
