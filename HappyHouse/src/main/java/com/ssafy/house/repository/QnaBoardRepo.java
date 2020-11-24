package com.ssafy.house.repository;

import java.util.List;

import com.ssafy.house.dto.QnaBoardDto;

public interface QnaBoardRepo {
	public QnaBoardDto select(int no);
	public List<QnaBoardDto> selectByUser(String writer);
	public List<QnaBoardDto> selectByTitle(String word);
	public List<QnaBoardDto> selectAll();
	public int update(QnaBoardDto question);
	public int delete(int no);
	public int insert(QnaBoardDto question);
}
