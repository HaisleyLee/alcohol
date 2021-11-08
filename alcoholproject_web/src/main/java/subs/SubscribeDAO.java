package subs;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import VO.Al_Info_VO;
import VO.MemberVO;
import VO.Subs_Info_VO;
import common.CommonService;

@Repository
public class SubscribeDAO implements SubscribeService{
	@Autowired @Qualifier("hanul") private SqlSession sql;
	@Autowired CommonService common;
	

	@Override
	public List<Al_Info_VO> subs_alcList(int mem_id) {
		List<Al_Info_VO> list = sql.selectList("subscribe.mapper.subs_alcList", mem_id);
		return list;
	}

	@Override
	public int subs_insert(HashMap<String, Object> map) {
		LocalDate date = LocalDate.now();
		int year = date.getYear();
		int month = date.getMonthValue();
		System.out.println("map.keySet() : " + map.keySet());
		System.out.println("map.values() : " + map.values());
		
		//int days = (Integer) map.get("subs_deliverydt");
		int days = Integer.parseInt(map.get("subs_deliverydt").toString());
		//int months = (Integer) map.get("months");
		int months = Integer.parseInt(map.get("months").toString());
		int result = 0;
		
		for (int i = 0; i < months; i++) {
			if(month + i + 1 <= 12) {
				String subs_monthday;
				if(month + i + 1 < 10) {
					subs_monthday = String.valueOf(year)+"-0"+String.valueOf(month + i + 1);
				}else {
					subs_monthday = String.valueOf(year)+"-"+String.valueOf(month + i + 1);
				}
				map.put("subs_monthday", subs_monthday);
				map.put("subs_deliverydt", subs_monthday +"-"+ days);
				System.out.println(subs_monthday);
				result = sql.insert("subscribe.mapper.subs_insert", map);
			}else {
				String subs_monthday;
				if(month + i - 11 < 10) {
					subs_monthday = String.valueOf(year+1)+"-0"+String.valueOf(month + i - 11);
				}else {
					subs_monthday = String.valueOf(year+1)+"-"+String.valueOf(month + i - 11);
				}
				map.put("subs_monthday", subs_monthday);
				map.put("subs_deliverydt", subs_monthday +"-"+ days);
				System.out.println(subs_monthday);
				result = sql.insert("subscribe.mapper.subs_insert", map);
			}
		}
		return result;
	}

	@Override
	public int subs_Chk(String mem_id) {
		int succ = 0;
		System.out.println("구독자판별 subs_Chk : mem_id : " + mem_id);
		succ = sql.selectOne("subscribe.mapper.subs_Chk", Integer.parseInt(mem_id) );
		System.out.println("구독자판별 subs_Chk : succ : " + succ);
		
		if(succ > 0) {
			return 1;
		}else {
			return 0;
		}
	}
}
