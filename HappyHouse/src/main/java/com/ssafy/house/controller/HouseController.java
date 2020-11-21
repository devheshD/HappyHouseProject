package com.ssafy.house.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.house.dto.AptDealDto;
import com.ssafy.house.dto.ResidenceBuyDto;
import com.ssafy.house.dto.ResidenceRentDto;
import com.ssafy.house.service.AptDealService;
import com.ssafy.house.service.ResidenceDealService;
import com.ssafy.house.util.PageNavigation;

@Controller
@RequestMapping("/house")
public class HouseController {

	@Autowired
	private AptDealService aptDealService;

	@Autowired
	private ResidenceDealService residenceDealService;
	
	/**
	 * Apt Information
	 */
	// initial list
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String goAptSearch(Model model, @RequestParam Map<String, String> map) {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "10");// sizePerPage
		
		try {
			List<AptDealDto> list = aptDealService.searchAll(map);
			PageNavigation pageNavigation = aptDealService.makePageNavigation(map);
			model.addAttribute("deals", list);
			model.addAttribute("navigation", pageNavigation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "house/apt";
	}
	
	// 
	@RequestMapping(value = "/searchAptName", method = RequestMethod.GET)
	public String goAptSearchAptName(Model model, @RequestParam Map<String, String> map, HttpServletRequest request) {
		String aptName = request.getParameter("word");
		System.out.println("아파트 이름 : " + aptName);
		String spp = map.get("spp");
		map.put("aptName", "%" + aptName + "%");
		map.put("spp", spp != null ? spp : "10");// sizePerPage
		try {
			List<AptDealDto> list = aptDealService.searchAptName(map);
			PageNavigation pageNavigation = aptDealService.makePageNavigation(map);
			model.addAttribute("deals", list);
			model.addAttribute("navigation", pageNavigation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "house/apt";
	}
	
	@RequestMapping(value = "/searchDongName", method = RequestMethod.GET)
	public String searchDong(Model model, @RequestParam Map<String, String> map, HttpServletRequest request){		
		String dongName = request.getParameter("word");
		String spp = map.get("spp");
		map.put("dongName", "%" + dongName + "%");
		map.put("spp", spp != null ? spp : "10");
		try {			
			List<AptDealDto> list = aptDealService.searchDong(map);
			PageNavigation pageNavigation = aptDealService.makePageNavigation(map);
			model.addAttribute("deals", list);
			model.addAttribute("navigation", pageNavigation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "house/apt";
	}
	
	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public String show(HttpServletRequest request){
		int dealno = Integer.parseInt(request.getParameter("no"));
		try {
			AptDealDto house = aptDealService.show(dealno);
			HttpSession session = request.getSession();
			session.setAttribute("deal", house);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "상세정보 조회 중 문제가 발생했습니다.");
		}
		return "house/aptDetail";
	}
	
	/**
	 * residence Information
	 */
	@RequestMapping(value = "/searchRes", method = RequestMethod.GET)
	public String goResSearch(Model model, @RequestParam Map<String, String> map) {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "10");// sizePerPage
		try {
			List<ResidenceBuyDto> list = residenceDealService.searchBuy(map);
			PageNavigation pageNavigation = residenceDealService.makePageNavigationBuy(map);
			
			model.addAttribute("type", "buy");
			model.addAttribute("deals", list);
			model.addAttribute("navigation", pageNavigation);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러발생");
		}
		return "house/searchResList";
	}
	
	@RequestMapping(value = "/searchResName", method = RequestMethod.GET)
	public String goResSearchResName(Model model, @RequestParam Map<String, String> map, HttpServletRequest request) {
		String resName = request.getParameter("word");
		System.out.println("주택 이름 : " + resName);
		String spp = map.get("spp");
		map.put("resName", "%" + resName + "%");
		map.put("spp", spp != null ? spp : "10");// sizePerPage
		try {
			List<ResidenceBuyDto> list = residenceDealService.searchBuyName(map);
			PageNavigation pageNavigation = residenceDealService.makePageNavigationBuy(map);
			model.addAttribute("type", "buy");
			model.addAttribute("deals", list);
			model.addAttribute("navigation", pageNavigation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "house/searchResList";
	}
	
	@RequestMapping(value = "/searchResDongName", method = RequestMethod.GET)
	public String goResSearchResDongName(Model model, @RequestParam Map<String, String> map, HttpServletRequest request) {
		String dongName = request.getParameter("word");
		System.out.println("동 주택 이름 : " + dongName);
		String spp = map.get("spp");
		map.put("dongName", "%" + dongName + "%");
		map.put("spp", spp != null ? spp : "10");// sizePerPage
		try {
			List<ResidenceBuyDto> list = residenceDealService.searchBuyDongName(map);
			PageNavigation pageNavigation = residenceDealService.makePageNavigationRent(map);
			model.addAttribute("type", "buy");
			model.addAttribute("deals", list);
			model.addAttribute("navigation", pageNavigation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "house/searchResList";
	}
	
	
	@RequestMapping(value = "/searchRent", method = RequestMethod.GET)
	public String goRentSearch(Model model, @RequestParam Map<String, String> map) {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "10");// sizePerPage
		try {
			List<ResidenceRentDto> list = residenceDealService.searchRent(map);
			PageNavigation pageNavigation = residenceDealService.makePageNavigationRent(map);
			model.addAttribute("type", "rent");
			model.addAttribute("rents", list);
			model.addAttribute("navigationRent", pageNavigation);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러발생");
		}

		return "house/searchResList";
	}
	
	@RequestMapping(value = "/showDetailDeal", method = RequestMethod.GET)
	public String showDeal(HttpServletRequest request){
		int dealno = Integer.parseInt(request.getParameter("no"));
		try {
			ResidenceBuyDto residenceBuy = residenceDealService.show(dealno);
			HttpSession session = request.getSession();
			session.setAttribute("deal", residenceBuy);
			session.setAttribute("check", "buy");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "상세정보 조회 중 문제가 발생했습니다.");
		}
		return "house/showRes";
	}
	
	@RequestMapping(value = "/showDetailRent", method = RequestMethod.GET)
	public String showRent(HttpServletRequest request){
		int rentno = Integer.parseInt(request.getParameter("no"));
		System.out.println("전월세 세부 정보 : " + rentno);
		try {
			ResidenceRentDto residenceRent = residenceDealService.showRent(rentno);
			HttpSession session = request.getSession();
			session.setAttribute("deal", residenceRent);
			session.setAttribute("check", "rent");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "상세정보 조회 중 문제가 발생했습니다.");
		}
		return "house/showRes";
	}
}
