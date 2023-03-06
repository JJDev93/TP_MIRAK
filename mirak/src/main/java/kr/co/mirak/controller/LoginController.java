package kr.co.mirak.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.mirak.HomeController;
import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;


@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView(@ModelAttribute("memver") MemberVO vo) {
		System.out.println("로그인 화면으로 이동...");
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) {
		String memid = memberService.login();
		if(memid == null || memid.equals("")) {
//			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
			System.out.println(vo.getMem_id());
		}
		if (memid != null) {
			System.out.println("dd");
			session.setAttribute("mem_id", memid);
			System.out.println("0");
			return "index";
		} else {
			System.out.println("d");
			return "member/login";
		}
	}
}












