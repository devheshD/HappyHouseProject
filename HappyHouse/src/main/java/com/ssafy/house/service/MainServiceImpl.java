package com.ssafy.house.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.house.dto.AptDealDto;
import com.ssafy.house.dto.AptInfoDto;
import com.ssafy.house.dto.SidoCodeDto;
import com.ssafy.house.dto.SidoGugunCodeDto;
import com.ssafy.house.repository.MainRepository;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainRepository mainRepository;

	@Override
	public List<SidoCodeDto> getSido() throws Exception {
		return mainRepository.getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		return mainRepository.getGugunInSido(sido);
	}

	@Override
	public List<AptInfoDto> getDongInGugun(String gugun) throws Exception {
		return mainRepository.getDongInGugun(gugun);
	}

	@Override
	public List<AptInfoDto> getAptInDong(String dong) throws Exception {
		return mainRepository.getAptInDong(dong);
	}
	
	@Override
	public List<AptDealDto> getInfoInApt(String aptName) throws Exception {
		return mainRepository.getInfoInApt(aptName);
	}
}
