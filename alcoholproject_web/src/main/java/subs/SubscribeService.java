package subs;

import java.util.HashMap;
import java.util.List;

import VO.Al_Info_VO;
import VO.MemberVO;
import VO.Subs_Info_VO;

public interface SubscribeService {
	//int subs_insert(Subs_Info_VO vo);	//새 구독 신청시 DB 입력
	//int subs_insert_card(MemberVO vo);	//새 구독 신청시 카드정보 DB 입력
	List<Al_Info_VO> subs_alcList(int mem_id);	//멤버 아이디 이용해 취향에 맞는 술 데이터 가져오기
	int subs_insert(HashMap<String, Object> map);
	int subs_Chk(String mem_id);
	
}
