package com.ssafy.house.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.house.dto.QnaBoardDto;
import com.ssafy.house.repository.QnaBoardRepo;

@Service
public class QnaBoardServiceImpl implements QnaBoardService{

	@Autowired
	QnaBoardRepo repo;
	
	@Override
	public QnaBoardDto select(int noq) {
		return repo.select(noq);
	}

	@Override
	public List<QnaBoardDto> selectByUser(String writer) {
		return repo.selectByUser(writer);
	}

	@Override
	public List<QnaBoardDto> selectByTitle(String word) {
		return repo.selectByTitle(word);
	}

	@Override
	public List<QnaBoardDto> selectAll() {
		return repo.selectAll();
	}

	@Override
	public int update(QnaBoardDto question) {
		return repo.update(question);
	}

	@Override
	public int delete(int noq) {
		return repo.delete(noq);
	}

	@Override
	public int insert(QnaBoardDto question) {
		return repo.insert(question);
	}

}
