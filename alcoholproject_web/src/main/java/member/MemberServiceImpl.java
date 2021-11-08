package member;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import VO.mem_info_tbVO;


@Service//@Service로 어노테이션
public class MemberServiceImpl implements MemberService {
	
	@Autowired private MemberDAO dao;
	//실제작업은 MemberDAO에서 한다.
	//MemberServiceImpl은 중간역할임.

	
	
	@Override
	public boolean member_join(mem_info_tbVO vo) {
		
		return dao.member_join(vo);
	}

	@Override
	public mem_info_tbVO member_select(String id) {
		return dao.member_select(id);
	}
	@Override
	public mem_info_tbVO emailsearch2(HashMap<String, Object> map) {
		return dao.emailsearch2(map);
	}
	@Override
	public mem_info_tbVO pwsearch2(HashMap<String, Object> map) {
		return dao.pwsearch2(map);
	}
	@Override
	public int mem_email_check(String mem_email) {
		return dao.mem_email_check(mem_email);
	}
	@Override
	public mem_info_tbVO member_select_email(String email) {
		
		
		return dao.member_select_email(email);
	}
	
	@Override
	public String member_imgpath(String nickname) {
		
		return dao.member_imgpath(nickname);
	}
	@Override
	public mem_info_tbVO member_loginautogetid(int mem_id) {
		
		
		return dao.member_loginautogetid(mem_id);
	}

	@Override
	public mem_info_tbVO member_login(HashMap<String, Object> map) {
		
		return dao.member_login(map);
	}
	@Override
	public int member_loginauto(HashMap<String, Object> map) {
		
		return dao.member_loginauto(map);
	}
	@Override
	public int member_loginokno(String mem_auto_ip) {
		
		return dao.member_loginokno(mem_auto_ip);
	}
	@Override
	public int member_ipdelete(mem_info_tbVO vo) {
		
		return dao.member_ipdelete(vo);
	}

	@Override
	public boolean member_update(mem_info_tbVO vo) {
		
		return dao.member_update(vo);
	}

	@Override
	public boolean member_delete(String id) {
		
		return dao.member_delete(id);
	}

	@Override
	public boolean member_id_check(String id) {
		
		return dao.member_id_check(id);
	}

	@Override
	public List<mem_info_tbVO> member_list() {
		
		return dao.member_list();
	}

	//메소드오버라이딩
	//소셜이메일로 이미 존재하는지 판단해서 알려줄 메소드
	//boolean으로 T/F//소셜로그인 이메일 존재여부 확인
	@Override
	public boolean member_social_email_kakao(mem_info_tbVO vo) {
		
		return dao.member_social_email_kakao(vo);
	}
	@Override
	public boolean member_social_email_naver(mem_info_tbVO vo) {
		
		return dao.member_social_email_naver(vo);
	}
	//메소드오버라이딩
	//카카오소셜이메일 회원이 아니면 회원으로 추가//최초 소셜로그인시 회원정보 insert
	@Override
	public boolean member_social_insert_kakao(mem_info_tbVO vo) {
		
		return dao.member_social_insert_kakao(vo);
	}
	//소셜이메일 회원이 아니면 회원으로 추가//최초 소셜로그인시 회원정보 insert
	@Override
	public boolean member_social_insert_naver(mem_info_tbVO vo) {
		
		return dao.member_social_insert_naver(vo);
	}
	//메소드오버라이딩
	//소셜이메일 회원이면 회원정보를 업데이트//소셜로그인시 이력이 있는 경우 회원정보 update
	@Override
	public boolean member_social_update_naver(mem_info_tbVO vo) {
		
		return dao.member_social_update_naver(vo);
	}
	//카카오소셜이메일 회원이면 회원정보를 업데이트//소셜로그인시 이력이 있는 경우 회원정보 update
	@Override
	public boolean member_social_update_kakao(mem_info_tbVO vo) {
		
		return dao.member_social_update_kakao(vo);
	}
	
	
}
