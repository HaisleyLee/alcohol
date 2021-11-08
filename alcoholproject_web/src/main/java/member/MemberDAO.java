package member;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import VO.mem_info_tbVO;

@Repository //DAO는 @Repository로 어노테이션줌
public class MemberDAO implements MemberService {
	//@Inject
    // Inject어노테이션이 없으면 sqlSession은 null상태이지만
    // Inject어노테이션이 있으면 외부에서 객체를 주입시켜주게 된다. 
    // try catch문, finally문, 객체를 close할 필요가 없어졌다.
	
	@Autowired @Qualifier("hanul") private SqlSession sql;
	
    
	
	@Override
	public boolean member_join(mem_info_tbVO vo) {
		//마이바티스는 실패시 0 or -1가 나온다
		//성공시 1
		//밑 리턴값은 sql실행 후 성공시 1이면 true라는 뜻
		return sql.insert("member.mapper.insert", vo) > 0 ? true : false;
	}

	@Override
	public mem_info_tbVO member_select(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public mem_info_tbVO emailsearch2(HashMap<String, Object> map) {
		return sql.selectOne("member.mapper.emailsearch2", map);
	}
	@Override
	public mem_info_tbVO pwsearch2(HashMap<String, Object> map) {
		return sql.selectOne("member.mapper.pwsearch2", map);
	}
	
	@Override
	public int mem_email_check(String mem_email) {
		return sql.selectOne("member.mapper.mem_email_check", mem_email);
	}
	@Override
	public mem_info_tbVO member_select_email(String email) {
		return sql.selectOne("member.mapper.member_select_email", email);
	}

	@Override
	public String member_imgpath(String nickname) {
		String imgpath;
		String[] imgpathlist;
		try {
			imgpathlist = sql.selectOne("member.mapper.member_imgpath", nickname);
			imgpath = imgpathlist[0];
		} catch (Exception e) {
			imgpath = sql.selectOne("member.mapper.member_imgpath", nickname);
		}
		return imgpath;
	}
	
	@Override
	public mem_info_tbVO member_loginautogetid(int mem_id) {
		return sql.selectOne("member.mapper.member_loginautogetid", mem_id);
	}

	@Override
	public mem_info_tbVO member_login(HashMap<String, Object> map) {

		return sql.selectOne("member.mapper.member_login", map);
	}
	@Override
	public int member_loginauto(HashMap<String, Object> map) {
		
		return sql.update("member.mapper.member_loginauto", map);
	}
	@Override
	public int member_loginokno(String mem_auto_ip) {
		
		int member_loginoknoresult;
		try {
			member_loginoknoresult = sql.selectOne("member.mapper.member_loginokno", mem_auto_ip);
		} catch (Exception e) {
			member_loginoknoresult = 0;
		}
		System.out.println("member_loginoknoresult : " + member_loginoknoresult);
		
				
		return member_loginoknoresult;
	}
	@Override
	public int member_ipdelete(mem_info_tbVO vo) {
		
		return sql.update("member.mapper.member_ipdelete", vo);
	}

	@Override
	public boolean member_update(mem_info_tbVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean member_delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean member_id_check(String id) {
		
		return (Integer) sql.selectOne("member_id_check", id) == 0 ? false : true ;
	}

	@Override
	public List<mem_info_tbVO> member_list() {
		// TODO Auto-generated method stub
		return null;
	}
	//소셜이메일로 이미 존재하는지 판단해서 알려줄 메소드
	//boolean으로 T/F//소셜로그인 이메일 존재여부 확인
	@Override
	public boolean member_social_email_kakao(mem_info_tbVO vo) {
		int result = (Integer)sql.selectOne("member.mapper.member_social_email_kakao", vo);
		System.out.println("카카오로그인 검증 : 새회원인지 기존회원인지 : member_social_email_kakao : " + result);
		//반환되는 값은 숫자 : 0 or 1
		return result == 0 ? false : true ;
	}
	@Override
	public boolean member_social_email_naver(mem_info_tbVO vo) {
		
		//반환되는 값은 숫자 : 0 or 1
		return (Integer)sql.selectOne("member.mapper.member_social_email_naver", vo) == 0 ? false : true ;
	}
	//카카오소셜이메일 회원이 아니면 회원으로 추가//최초 소셜로그인시 회원정보 insert
	@Override
	public boolean member_social_insert_kakao(mem_info_tbVO vo) {
		
		return (Integer)sql.insert("member.mapper.member_social_insert_kakao", vo) == 1 ? true : false;
	}
	//소셜이메일 회원이 아니면 회원으로 추가//최초 소셜로그인시 회원정보 insert
	@Override
	public boolean member_social_insert_naver(mem_info_tbVO vo) {
		
		return (Integer)sql.insert("member.mapper.member_social_insert_naver", vo) == 1 ? true : false;
	}
	//소셜이메일 회원이면 회원정보를 업데이트//소셜로그인시 이력이 있는 경우 회원정보 update
	@Override
	public boolean member_social_update_naver(mem_info_tbVO vo) {

		return (Integer)sql.update("member.mapper.member_social_update_naver", vo) == 1 ? true : false;
	}
	//소셜이메일 회원이면 회원정보를 업데이트//소셜로그인시 이력이 있는 경우 회원정보 update
	@Override
	public boolean member_social_update_kakao(mem_info_tbVO vo) {
		
		
		System.out.println(vo.getSocial_email());
		System.out.println(vo.getMem_kakao_nickname());
		
		
		return (Integer)sql.update("member.mapper.member_social_update_kakao", vo) == 1 ? true : false;
	}


	
}