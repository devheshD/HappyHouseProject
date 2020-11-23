package com.ssafy.house.controller;

import java.sql.SQLException;
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

import com.ssafy.house.dto.MemberDto;
import com.ssafy.house.dto.NoticeDto;
import com.ssafy.house.service.NoticeService;
import com.ssafy.house.util.PageNavigation;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String goSearchAll(Model model, @RequestParam Map<String, String> map) {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "10");// sizePerPage
		try {
			List<NoticeDto> list = noticeService.list(map);
			PageNavigation pageNavigation = noticeService.makePageNavigation(map);
			model.addAttribute("list", list);
			model.addAttribute("navigation", pageNavigation);

			System.out.println("공지 이동");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러발생");
		}
		return "notice/list";
	}

	@RequestMapping(value = "/sitemap", method = RequestMethod.GET)
	public String goSitemap() {
		return "notice/sitemap";
	}

	@RequestMapping(value = "/mvwrite", method = RequestMethod.GET)
	public String goWrite() {
		return "notice/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String doWrite(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		NoticeDto noticeDto = new NoticeDto();
		if (memberDto != null) {
			noticeDto.setId(request.getParameter("id"));
			noticeDto.setTitle(request.getParameter("title"));
			noticeDto.setContent(request.getParameter("content"));
			try {
				noticeService.write(noticeDto);
				session = request.getSession();
				session.setAttribute("list", noticeDto);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("에러발생");
			}
		} else {
			System.out.println("에러발생");
		}
		return "/notice/writesuccess";
	}

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public String show(Model model, HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		HttpSession session = request.getSession();
		NoticeDto noticeDto;
		try {
			noticeDto = noticeService.show(no);
			session.setAttribute("list", noticeDto);
			model.addAttribute("list", noticeDto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("처리중 에러가 발생");
			return "error/error";
		}
		return "/notice/show";
	}

	@RequestMapping(value = "/mvmodify", method = RequestMethod.GET)
	public String moveModify(HttpServletRequest request) {
		int memberNo = Integer.parseInt(request.getParameter("no"));
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		try {
			NoticeDto nDto = new NoticeDto();
			nDto.setId(memberDto.getId());
			nDto = noticeService.getInfo(memberNo);
			session.setAttribute("notice", nDto);
			session.setAttribute("userinfo", memberDto);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("에러발생");
			return "error/error";
		}
		return "/notice/modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyInfo(HttpServletRequest request){
		HttpSession session = request.getSession();
		NoticeDto noticeDto = new NoticeDto();
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		noticeDto.setId(memberDto.getId());
		noticeDto.setTitle(request.getParameter("title"));
		noticeDto.setContent(request.getParameter("content"));
		System.out.println("no : 나와라좀 " + request.getParameter("no"));
		noticeDto.setNo(Integer.parseInt(request.getParameter("no")));
		noticeDto.setRegtime(request.getParameter("regtime"));
		System.out.println(noticeDto);
		try {
			noticeService.modifyInfo(noticeDto);
			noticeDto = noticeService.getInfo(noticeDto.getNo());
			session.setAttribute("list", noticeDto);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "회원정보 수정 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "notice/show";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request){
		int no = Integer.parseInt(request.getParameter("no"));
		try {
			noticeService.delete(no);
			HttpSession session = request.getSession();
			session.removeAttribute("list");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "공지사항 삭제 중 문제가 발생했습니다.");
		}
		return "notice/deletesuccess";
	}
}
