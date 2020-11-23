package com.ssafy.house.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.house.dto.AptDealDto;
import com.ssafy.house.dto.AptInfoDto;
import com.ssafy.house.dto.SidoCodeDto;
import com.ssafy.house.dto.SidoGugunCodeDto;
import com.ssafy.house.service.MainService;
import com.ssafy.house.service.MainServiceImpl;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private MainService mainService;

	// Main 페이지 Mapping
	@GetMapping("/")
	public String index() {
		return "index";
	}

	// Main 페이지 지도 정보 ajax통신
	@GetMapping("/map")
	public void mapping(Model model, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String act = request.getParameter("act");
		// 시도 목록 가져오기
		if ("sido".equals(act)) {
			PrintWriter out = response.getWriter();
			List<SidoCodeDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = mainService.getSido();
				for (SidoCodeDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("sido_code", dto.getSidoCode()); // {'sido_code' : '11'}
					obj.put("sido_name", dto.getSidoName()); // {'sido_code' : '11', 'sido_name' : '서울'}
					arr.add(obj);
				}

			} catch (Exception e) {
				arr = new JSONArray();
				JSONObject obj = new JSONObject();
				obj.put("message_code", "-1");
				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}
		// 구군 목록 가져오기
		else if ("gugun".equals(act)) {
			String sido = request.getParameter("sido");
			PrintWriter out = response.getWriter();
			List<SidoGugunCodeDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = mainService.getGugunInSido(sido);
				for (SidoGugunCodeDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("gugun_code", dto.getGugunCode());
					obj.put("gugun_name", dto.getGugunName());
					arr.add(obj);
				}
			} catch (Exception e) {
				arr = new JSONArray();
				JSONObject obj = new JSONObject();
				obj.put("message_code", "-1");
				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}
		// 읍면동 가져오기
		else if ("dong".equals(act)) {
			String gugun = request.getParameter("gugun");
			PrintWriter out = response.getWriter();
			List<AptInfoDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = mainService.getDongInGugun(gugun);
				for (AptInfoDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("code", dto.getCode());
					obj.put("dong", dto.getDong());
					arr.add(obj);
				}
			} catch (Exception e) {
				arr = new JSONArray();
				JSONObject obj = new JSONObject();
				obj.put("message_code", "-1");
				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}
		// 아파트 목록 가져오기
		else if ("apt".equals(act)) {
			String dong = request.getParameter("dong");
			PrintWriter out = response.getWriter();
			List<AptInfoDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = mainService.getAptInDong(dong);
				for (AptInfoDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("no", dto.getNo());
					obj.put("dong", dto.getDong());
					obj.put("aptName", dto.getAptName());
					obj.put("code", dto.getCode());
					obj.put("jibun", dto.getJibun());
					obj.put("dealAmount", dto.getDealAmount());
					obj.put("area", dto.getArea());
					arr.add(obj);
				}
			} catch (Exception e) {
				arr = new JSONArray();
				JSONObject obj = new JSONObject();
				obj.put("message_code", "-1");
				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		} // End of if-else
			// apt
		else if ("aptInfo".equals(act)) {
			String aptName = request.getParameter("aptName");
			System.out.println(aptName);
			PrintWriter out = response.getWriter();
			List<AptDealDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = mainService.getInfoInApt(aptName);
				for (AptDealDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("dealAmount", dto.getDealAmount());
					obj.put("buildYear", dto.getBuildYear());
					obj.put("area", dto.getArea());
					obj.put("floor", dto.getFloor());
					obj.put("dealYear", dto.getDealYear());
					obj.put("dealMonth", dto.getDealMonth());
					obj.put("dealDay", dto.getDealDay());

					arr.add(obj);
				}
			} catch (Exception e) {
				arr = new JSONArray();
				JSONObject obj = new JSONObject();
				obj.put("message_code", "-1");
				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		} // aptInfo
	}

}
