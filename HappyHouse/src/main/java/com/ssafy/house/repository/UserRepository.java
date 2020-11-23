package com.ssafy.house.repository;

import java.util.Map;

import com.ssafy.house.dto.UserDto;

public interface UserRepository {
	public UserDto login(Map<String, String> map);
	public void signUp(Map<String, String> map);
	public void modify(Map<String, String> map);
	public void delete(String userId);

}
