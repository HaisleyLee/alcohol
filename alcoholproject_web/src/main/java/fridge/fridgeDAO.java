package fridge;


import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import VO.Al_Info_VO;
import VO.fridge_info_tbVO;
import VO.mst_codeVO;

@Repository
public class fridgeDAO implements fridgeService {
	@Autowired @Qualifier("hanul") private SqlSession sql;
	
	@Override
	public List<fridge_info_tbVO> fridge_select(int mem_id) {
		
		return sql.selectList("fri.mapper.selectlist", mem_id);

	}
	@Override
	public Al_Info_VO al_select(int al_id) {
		
		return sql.selectOne("fri.mapper.alselectlist", al_id);
		
	}
	@Override
	public mst_codeVO mst_code(int mst_key) {
		
		return sql.selectOne("fri.mapper.mst_code", mst_key);
	}
}

