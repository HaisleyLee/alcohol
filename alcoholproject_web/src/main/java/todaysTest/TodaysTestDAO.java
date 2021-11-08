package todaysTest;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import VO.Al_Info_VO;
import VO.TodaysTestVO;
import edu.emory.mathcs.backport.java.util.Collections;

@Repository
public class TodaysTestDAO implements TodaysTestService {
	@Autowired @Qualifier("hanul") private SqlSession sql;
	
	@Override
	public List<TodaysTestVO> todaysTest() {
		return sql.selectList("todaystest.mapper.todaystest_list");
	}

	@Override
	public int todaysTestResult(String id, String answer) {
		int result = 0;
		if(answer.equals("1")) {
			result = sql.selectOne("todaystest.mapper.todaystest_result_A", id);
		}else if(answer.equals("2")) {
			result = sql.selectOne("todaystest.mapper.todaystest_result_B", id);
		}else {
			result = 0;
		}
		return result;
	}

	@Override
	public ArrayList<Integer> randomNum(ArrayList<Integer> list) {
		//for (int i = 0; i < 15; i++) {
			Collections.shuffle(list);			
		//}
		return list;
	}

	@Override
	public List<Integer> selectList(ArrayList<Integer> list) {
		return sql.selectList("todaystest.mapper.selectList", list);
	}

	@Override
	public Al_Info_VO al_info_vo(int id) {
		return sql.selectOne("todaystest.mapper.selectOne", id);
	}


	@Override
	public ArrayList<Al_Info_VO> al_info_list(ArrayList<Integer> list) {
		return null;
	}

}
