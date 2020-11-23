package com.ssafy.house.service;

import java.util.Map;

import com.ssafy.house.dto.UserDto;

public interface UserService {

	public UserDto login(Map<String, String> map);
}
