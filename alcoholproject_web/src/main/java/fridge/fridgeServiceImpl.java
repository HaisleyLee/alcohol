package fridge;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import VO.Al_Info_VO;
import VO.fridge_info_tbVO;
import VO.mst_codeVO;

@Service
public class fridgeServiceImpl implements fridgeService {
	@Autowired private fridgeDAO dao;
	
	@Override
	public List<fridge_info_tbVO> fridge_select(int mem_id) {
		
		return dao.fridge_select(mem_id);
	}
	@Override
	public Al_Info_VO al_select(int al_id) {
		
		return dao.al_select(al_id);
	}
	@Override
	public mst_codeVO mst_code(int mst_key) {
		
		return dao.mst_code(mst_key);
	}

	

}//class
