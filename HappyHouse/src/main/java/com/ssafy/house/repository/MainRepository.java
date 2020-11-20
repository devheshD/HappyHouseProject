package com.ssafy.house.repository;

import java.util.List;

import com.ssafy.house.dto.HouseInfoDto;
import com.ssafy.house.dto.SidoCodeDto;
import com.ssafy.house.dto.SidoGugunCodeDto;

public interface MainRepository {
	List<SidoCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	List<HouseInfoDto> getAptInDong(String dong) throws Exception;
}
