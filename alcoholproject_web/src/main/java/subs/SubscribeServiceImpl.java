package subs;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import VO.Al_Info_VO;
import VO.MemberVO;
import VO.Subs_Info_VO;

@Service
public class SubscribeServiceImpl implements SubscribeService{
	@Autowired private SubscribeDAO dao;
	
	@Override
	public List<Al_Info_VO> subs_alcList(int mem_id) {
		return dao.subs_alcList(mem_id);
	}

	@Override
	public int subs_insert(HashMap<String, Object> map) {
		return dao.subs_insert(map);
	}

	@Override
	public int subs_Chk(String mem_id) {
		return dao.subs_Chk(mem_id);
	}
}
