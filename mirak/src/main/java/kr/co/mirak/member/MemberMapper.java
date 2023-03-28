package kr.co.mirak.member;

import java.util.List;


public interface MemberMapper {
	MemberVO login(MemberVO vo);

	MemberVO idfind(MemberVO vo);
	
	MemberVO idfind_pw(MemberVO vo);
	
	int pwreset(MemberVO vo);
	
	int createUser(MemberVO vo);
	
	int naverinsert(MemberVO vo);
	
	int memupdate(MemberVO vo);
	
	int memdelete(MemberVO vo);
	
	MemberVO getMemberInfo(String mem_code);
	
	int idCheck(String id);
	
	/* 게시판 총 갯수 */
    public int getTotal(CriteriaM cri);
    
    /* 게시판 목록(페이징 적용) */
    public List<MemberVO> getListPaging(CriteriaM cri);
    MemberVO adminMemberDetail(MemberVO vo);
    int adminMemberDel(MemberVO vo);
	int adminMemberUpdate(MemberVO vo);

	


}
