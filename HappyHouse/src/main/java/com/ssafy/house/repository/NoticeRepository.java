package com.ssafy.house.repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.house.dto.NoticeDto;

public interface NoticeRepository {
	public List<NoticeDto> list(Map<String, Object> param) throws SQLException;
	public int getTotalCount(Map<String, String> map) throws SQLException;
	public void write(NoticeDto noticeDto) throws SQLException;
	public void modifyInfo(NoticeDto noticeDto) throws SQLException;
	public void delete(int no) throws SQLException;
	public NoticeDto show(int no) throws SQLException;
}
