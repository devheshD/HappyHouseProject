package com.ssafy.house.repository;

import java.util.List;

import com.ssafy.house.dto.AptDealDto;
import com.ssafy.house.dto.AptInfoDto;
import com.ssafy.house.dto.SidoCodeDto;
import com.ssafy.house.dto.SidoGugunCodeDto;

public interface MainRepository {
	List<SidoCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<AptInfoDto> getDongInGugun(String gugun) throws Exception;
	List<AptInfoDto> getAptInDong(String dong) throws Exception;
	List<AptDealDto> getInfoInApt(String aptName) throws Exception;
}
