package kr.co.mirak.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

public interface MemberService {
	MemberVO login(MemberVO memberVO);

	List<MemberVO> idfind(MemberVO vo); //

	int idfind_pw(MemberVO vo);

	int pwreset(MemberVO vo);

	int createUser(MemberVO vo);

	int naverinsert(MemberVO vo);

	MemberVO getMemberInfo(HttpSession session);

	int memupdate(MemberVO vo);

	MemberVO getMemberDetail(String mem_id, String mem_isapi);

	int idCheck(String id) throws Exception;
	
	int existIdAndIsApi(@Param("mem_id") String mem_id, @Param("mem_isapi")String mem_isapi);
	
	// 카카오 로그인
//	String getAccessToken(String code);
//	MemberVO getUserInfo(String access_Token);

	String getAccessToken(String code);

	HashMap<String, Object> getUserInfo(String access_Token);

	void kakaoLogout(String access_Token);

	void unlink(String attribute);

	int memdelete(MemberVO vo);

	/* 게시판 총 갯수 */
	public int getTotal(CriteriaM cri);

	List<MemberVO> getListPaging(CriteriaM cri);

	MemberVO adminMemberDetail(MemberVO vo);

	int adminMemberUpdate(MemberVO vo);

	int adminMemberDel(MemberVO vo);
	// 여기까지

}