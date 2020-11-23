package com.ssafy.house.service;

import java.util.Map;

import com.ssafy.house.dto.UserDto;

public interface UserService {
	public UserDto login(Map<String, String> map);
	public void signUp(Map<String, String> map);
	public void modify(Map<String, String> map);
	public void delete(String userId);
}
