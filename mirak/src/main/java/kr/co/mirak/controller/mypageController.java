package kr.co.mirak.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;
import kr.co.mirak.pay.PayService;

@Controller
public class mypageController {
	@Autowired
	private PayService payService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// 마이페이지 이동
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageview(Model model, HttpSession session) {
		MemberVO member = memberService.getMemberInfo(session);
		System.out.println();
		model.addAttribute("member", member);
		return "member/mypage";
	}
	
	// api 회원정보 수정
	@RequestMapping(value = "/apiMemupdate", method = RequestMethod.POST)
	public String apiMemupdate(MemberVO vo) {
		System.out.println(vo);
		memberService.memupdate(vo);
		return "redirect:/mypage";	
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/memupdate", method = RequestMethod.POST)
	@ResponseBody
	public int memupdate(MemberVO vo, @RequestParam("rawPw") String rawPw) {
		String encodePw = vo.getMem_pw();
		int success = 0;
		if (true == pwEncoder.matches(rawPw, encodePw)) {
			success = memberService.memupdate(vo);
		}
		return success;	
	}
	
	
	// 비밀번호 수정 페이지 이동
	@RequestMapping(value = "/updatePw", method = RequestMethod.GET)
	public String pwUpdate(Model model, HttpSession session) {
		MemberVO member = memberService.getMemberInfo(session);
		model.addAttribute("member", member);
		return "member/updatePw";
	}
		
	// 비밀번호 수정
	@RequestMapping(value = "/updatePw", method = RequestMethod.POST)
	@ResponseBody
	public int updatePw(MemberVO vo, @RequestParam("befo_pw") String befo_pw, @RequestParam("new_pw") String new_pw) {
		System.out.println("비밀번호 수정중.."+vo);
		String encodePw = vo.getMem_pw();
		int success = 0;
		System.out.println("비밀번호 수정중..!"+ "befo_pw: "+befo_pw+ " / encodePw: "+ encodePw);
		
		if (true == pwEncoder.matches(befo_pw, encodePw)) {
			System.out.println("비밀번호 수정중..!"+ befo_pw+ encodePw);
			String encodeNewPw = pwEncoder.encode(new_pw);
			vo.setMem_pw(encodeNewPw);
			System.out.println("비밀번호 수정중..1"+vo);
			success = memberService.pwreset(vo);
			System.out.println("비밀번호 수정중..2"+success);
		}else {
			System.out.println("비밀번호 수정중..모야ㅕ!!");
		}
		return success;
	}

	// 회원탈퇴
	@RequestMapping(value="/memdelete", method = RequestMethod.POST)
	@ResponseBody
	public int memdelete(MemberVO vo, Model model, HttpSession session, @RequestParam("rawPw") String rawPw) {
		String encodePw = vo.getMem_pw();
		System.out.println(vo);
		int success = 0;
			if (true == pwEncoder.matches(rawPw, encodePw)) {
			
			if (payService.getClientPayList(session) == null || payService.getClientPayList(session).size() == 0) {
				success = 1;
				System.out.println("탈퇴진행중..."+ success);
				success = memberService.memdelete(vo);
				session.invalidate();
			}else {
				success = 2;
				System.out.println("결제내역있음."+ success);

			}
		}
		return success;
	}
	
	//api회원탈퇴
	   @RequestMapping(value="/apidelete", method = RequestMethod.POST)
	   @ResponseBody
	   public int apidelete(MemberVO vo , HttpSession session) {
	      int success = 0;
	      success = memberService.memdelete(vo);
	      session.invalidate();
	      return success;
	      
	   }
}