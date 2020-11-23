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

import com.ssafy.house.dto.NoticeDto;
import com.ssafy.house.dto.UserDto;
import com.ssafy.house.service.NoticeService;
import com.ssafy.house.util.PageNavigation;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	// 공지사항 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String goSearchAll(Model model, @RequestParam Map<String, String> map) {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "10");// sizePerPage

		try {
			List<NoticeDto> list = noticeService.list(map);
			PageNavigation pageNavigation = noticeService.makePageNavigation(map);
			model.addAttribute("list", list);
			model.addAttribute("navigation", pageNavigation);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러발생");
		}
		return "notice/list";
	}

	// 글작성 페이지로 이동
	@RequestMapping(value = "/mvwrite", method = RequestMethod.GET)
	public String goWrite() {
		return "notice/write";
	}

	// 글작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String doWrite(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDto memberDto = (UserDto) session.getAttribute("userDto");
		NoticeDto noticeDto = new NoticeDto();
		if (memberDto != null) {
			noticeDto.setId(request.getParameter("id"));
			noticeDto.setTitle(request.getParameter("title"));
			noticeDto.setContent(request.getParameter("content"));
			System.out.println(noticeDto);
			try {
				noticeService.write(noticeDto);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("에러발생");
			}
		} else {
			System.out.println("에러발생");
		}
		return "/notice/writesuccess";
	}

	// 글 보기
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

	// 글수정 페이지로 이동
	@RequestMapping(value = "/mvmodify", method = RequestMethod.GET)
	public String moveModify(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDto memberDto = (UserDto) session.getAttribute("userDto");
		session.setAttribute("userDto", memberDto);
		
		return "/notice/modify";
	}

	// 글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		NoticeDto noticeDto = new NoticeDto();
		UserDto memberDto = (UserDto) session.getAttribute("userDto");
		noticeDto.setId(memberDto.getId());
		noticeDto.setTitle(request.getParameter("title"));
		noticeDto.setContent(request.getParameter("content"));
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

	// 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request) {
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
