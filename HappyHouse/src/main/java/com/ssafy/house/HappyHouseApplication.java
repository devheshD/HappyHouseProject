package com.ssafy.house;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(value = "com.ssafy.house.repository")
public class HappyHouseApplication {

	public static void main(String[] args) {
		SpringApplication.run(HappyHouseApplication.class, args);
	}

}
