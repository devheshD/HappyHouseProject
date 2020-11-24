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
	// 아파트 거래가 목록
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

	// 아파트 이름으로 검색
	@RequestMapping(value = "/searchAptName", method = RequestMethod.GET)
	public String goAptSearchAptName(Model model, @RequestParam Map<String, String> map, HttpServletRequest request) {
		String aptName = request.getParameter("word");
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

	// 동 이름으로 검색
	@RequestMapping(value = "/searchDongName", method = RequestMethod.GET)
	public String searchDong(Model model, @RequestParam Map<String, String> map, HttpServletRequest request) {
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

	// 아파트 상세보기
	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public String show(HttpServletRequest request) {
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
	 * residence Deal Information
	 */
	// 주택 매매 정보
	@RequestMapping(value = "/searchDeal", method = RequestMethod.GET)
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
		return "house/residence";
	}

	// 주택 매매 상세보기
	@RequestMapping(value = "/showDeal", method = RequestMethod.GET)
	public String showDeal(HttpServletRequest request) {
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
		return "house/residenceDetail";
	}

	// 빌딩 이름으로 주택 매매 검색
	@RequestMapping(value = "/searchDealBdName", method = RequestMethod.GET)
	public String goResSearchDealDbName(Model model, @RequestParam Map<String, String> map, HttpServletRequest request) {
		String resName = request.getParameter("word");
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
		return "house/residence";
	}

	// 동 이름으로 주택 매매 검색
	@RequestMapping(value = "/searchDealDongName", method = RequestMethod.GET)
	public String goResSearchDealDongName(Model model, @RequestParam Map<String, String> map,
			HttpServletRequest request) {
		String dongName = request.getParameter("word");
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
		return "house/residence";
	}

	/**
	 * residence Rent Information
	 */
	// 주택 전월세 목록
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

		return "house/residence";
	}

	// 주택 전월세 상세보기
	@RequestMapping(value = "/showRent", method = RequestMethod.GET)
	public String showRent(HttpServletRequest request) {
		int rentno = Integer.parseInt(request.getParameter("no"));
		try {
			ResidenceRentDto residenceRent = residenceDealService.showRent(rentno);
			HttpSession session = request.getSession();
			session.setAttribute("deal", residenceRent);
			session.setAttribute("check", "rent");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "상세정보 조회 중 문제가 발생했습니다.");
		}
		return "house/residenceDetail";
	}

	// 빌딩 이름으로 주택 전월세 검색
	@RequestMapping(value = "/searchRentBdName", method = RequestMethod.GET)
	public String goResSearchRentDbName(Model model, @RequestParam Map<String, String> map, HttpServletRequest request) {
		String resName = request.getParameter("word");
		String spp = map.get("spp");
		map.put("resName", "%" + resName + "%");
		map.put("spp", spp != null ? spp : "10");// sizePerPage
		try {
			List<ResidenceRentDto> list = residenceDealService.searchRentName(map);
			PageNavigation pageNavigation = residenceDealService.makePageNavigationRent(map);
			model.addAttribute("type", "rent");
			model.addAttribute("rents", list);
			model.addAttribute("navigation", pageNavigation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "house/residence";
	}

	// 동 이름으로 주택 전월세 검색
	@RequestMapping(value = "/searchRentDongName", method = RequestMethod.GET)
	public String goResSearchRentDongName(Model model, @RequestParam Map<String, String> map,
			HttpServletRequest request) {
		String dongName = request.getParameter("word");
		String spp = map.get("spp");
		map.put("dongName", "%" + dongName + "%");
		map.put("spp", spp != null ? spp : "10");// sizePerPage
		try {
			List<ResidenceRentDto> list = residenceDealService.searchRentDongName(map);
			PageNavigation pageNavigation = residenceDealService.makePageNavigationRent(map);
			model.addAttribute("type", "rent");
			model.addAttribute("rents", list);
			model.addAttribute("navigation", pageNavigation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "house/residence";
	}
}
