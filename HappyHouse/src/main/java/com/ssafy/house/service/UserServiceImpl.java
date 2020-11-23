package com.ssafy.house.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.house.dto.UserDto;
import com.ssafy.house.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository repo;
	
	@Override
	public UserDto login(Map<String, String> map) {
		UserDto userDto = repo.login(map);
		
		return userDto;
	}

	@Override
	public void signUp(Map<String, String> map) {
		repo.signUp(map);
	}

}
