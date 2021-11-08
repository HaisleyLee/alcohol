package member;

import java.util.HashMap;
import java.util.List;

import VO.mem_info_tbVO;

public interface MemberService {
	
	
	boolean member_join(mem_info_tbVO vo);//회원가입시 회원정보 저장하기 위한 메소드.
	mem_info_tbVO member_select(String id);//회원정보조회 -- 마이페이지 연동용
	mem_info_tbVO member_select_email(String email);//회원정보조회 -- 이메일로 조회
	int mem_email_check(String mem_email);//회원정보조회 -- 이메일로 조회
	public mem_info_tbVO emailsearch2(HashMap<String, Object> map);
	public mem_info_tbVO pwsearch2(HashMap<String, Object> map);
	String member_imgpath(String nickname);//프로필사진조회
	mem_info_tbVO member_loginautogetid(int mem_id);//회원정보조회 
	mem_info_tbVO member_login(HashMap<String, Object> map); //로그인을 위한 메소드
	int member_ipdelete(mem_info_tbVO vo); 
	int member_loginauto(HashMap<String, Object> map); //로그인을 위한 메소드
	int member_loginokno(String mem_auto_ip); //로그인을 위한 메소드
	boolean member_update(mem_info_tbVO vo);//회원 정보 수정
	boolean member_delete(String id);//회원 탈퇴
	boolean member_id_check(String id);//회원 가입시 아이디를 체크함
	List<mem_info_tbVO> member_list();//회원리스트보는 메소드
	
	//소셜이메일로 이미 존재하는지 판단해서 알려줄 메소드
	boolean member_social_email_kakao(mem_info_tbVO vo);//boolean으로 T/F//소셜로그인 이메일 존재여부 확인
	boolean member_social_email_naver(mem_info_tbVO vo);//boolean으로 T/F//소셜로그인 이메일 존재여부 확인
	//카카오소셜이메일 회원이 아니면 회원으로 추가//최초 소셜로그인시 회원정보 insert
	boolean member_social_insert_kakao(mem_info_tbVO vo);
	//네이버소셜이메일 회원이 아니면 회원으로 추가//최초 소셜로그인시 회원정보 insert
	boolean member_social_insert_naver(mem_info_tbVO vo);
	//네이버소셜이메일 회원이면 회원정보를 업데이트//소셜로그인시 이력이 있는 경우 회원정보 update
	boolean member_social_update_naver(mem_info_tbVO vo);
	//카카오소셜이메일 회원이면 회원정보를 업데이트//소셜로그인시 이력이 있는 경우 회원정보 update
	boolean member_social_update_kakao(mem_info_tbVO vo);
}