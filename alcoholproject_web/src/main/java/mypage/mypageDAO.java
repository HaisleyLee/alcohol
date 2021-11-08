package mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import VO.MySubsVO;
import VO.mem_info_tbVO;


@Repository
public class mypageDAO implements mypageService {
	@Autowired @Qualifier("hanul") private SqlSession sql;
	
	@Override
	public int member_delete(int mem_id) {
		System.out.println("회원탈퇴 dao mem_id : "+ mem_id);
		return sql.delete("member.mapper.delete", mem_id);
	}
	
	
	@Override
	public List<MySubsVO> mySubsList(String id) {	//구독 환불된(subs_refund = 'T'인) 데이터를 제외하고 검색한 데이터 값
		//서버에 실제 데이터 추가되면 사용
		return sql.selectList("mySubsList", id);
		
		//서버 테이블에 자료 추가되기 전까지 임의로 자료값 삽입해서 사용
//		List<MySubsVO> list = new ArrayList<MySubsVO>();
//		for (int i = 0; i < 12; i++) {
//			MySubsVO vo = new MySubsVO();
//			vo.setMonth("2021/"+(i+1));
//			vo.setAl_List("술 이름1, 술 이름2, 술 이름3");
//			vo.setPrice_state("30000");
//			list.add(vo);
//			//System.out.println(i+"번데이터: "+vo.month);
//		}//임의 자료 12개 삽입
//		return list;
	}

	@Override
	public List<MySubsVO> mySubsUpdate(List<String> list, String id) {
		List<MySubsVO> resultList = new ArrayList<MySubsVO>();
		//서버에 실제 데이터 추가되면 사용
		System.out.println("DAO에서접근 환불신청자의 id : " + id);
		for (String refundmonth : list) {
			System.out.println("환불신청한 연월내역 refundmonth : " + refundmonth);
		}
		int result = 0;
		for (int i = 0; i < list.size(); i++) {
			MySubsVO vo = new MySubsVO();
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("subs_monthday", list.get(i));
			result = sql.update("mySubsUpdate", map);
			System.out.println("바뀐 갯수 result : " + result);
			if(result == 1) {
				vo.setPrice_state("1");	// DB 업데이트 성공
			}else {
				vo.setPrice_state("0");	// DB 업데이트 실패
			}
			resultList.add(vo);
		}
		 
		return resultList;
	}

	@Override
	public List<MySubsVO> mySubsResult(String id) {
		return sql.selectList("mysubs.mapper.mySubsResult", id);
	}

	@Override
	public List<MySubsVO> mySubsAllList(String id) {	//구독 환불된(subs_refund = 'T'인) 데이터를 포함한 모든 데이터 값
		return sql.selectList("mysubs.mapper.mySubsAllList", id);
	}
	
	
	
	@Override
	public int meminfoupdate (mem_info_tbVO vo) {
		return sql.update("member.mapper.meminfoupdate",vo);
	}
	@Override
	public int socialmeminfoupdate (mem_info_tbVO vo) {
		return sql.update("member.mapper.socialmeminfoupdate",vo);
	}
	
	
	
	@Override
	public mem_info_tbVO selectid (int id) {
		return sql.selectOne("member.mapper.selectid",id);
	}
	
	
}
