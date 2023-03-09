package kr.co.mirak.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mirak.HomeController;
import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Controller
public class mypageController {
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//마이페이지 이동
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageview(Model model, HttpSession session) {
		System.out.println("마이페이지로 이동..");
		MemberVO member = memberService.getMemberInfo(session);
	    model.addAttribute("member", member);
		return "member/mypage";
	}

	// 회원정보 수정
	@RequestMapping(value = "/memupdate", method = RequestMethod.POST)
	public String memupdate(MemberVO vo , Model model){
		memberService.memupdate(vo);
		System.out.println("회원정보 수정 완료...");
		return "redirect:mypage";
	}
	
	// 회원탈퇴
	@RequestMapping("/memdelete")
	public String memdelete(MemberVO vo, Model model) {
		System.out.println(vo);
		memberService.memdelete(vo);
		System.out.println("회원탈퇴 성공!");
		return "redirect:/logout";
	}
}










