package fridge;

import java.util.List;

import VO.Al_Info_VO;
import VO.fridge_info_tbVO;
import VO.mst_codeVO;

public interface fridgeService {
	public List<fridge_info_tbVO> fridge_select(int mem_id);
	public Al_Info_VO al_select(int al_id);
	public mst_codeVO mst_code(int mst_key);
}//interface
