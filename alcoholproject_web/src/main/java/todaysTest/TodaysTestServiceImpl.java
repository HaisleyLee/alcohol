package todaysTest;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import VO.Al_Info_VO;
import VO.TodaysTestVO;

@Service
public class TodaysTestServiceImpl implements TodaysTestService {
	@Autowired private TodaysTestDAO dao;
	
	@Override
	public List<TodaysTestVO> todaysTest() {
		return dao.todaysTest();
	}

	@Override
	public int todaysTestResult(String id, String answer) {
		return dao.todaysTestResult(id, answer);
	}

	@Override
	public ArrayList<Integer> randomNum(ArrayList<Integer> list) {
		return dao.randomNum(list);
	}

	@Override
	public List<Integer> selectList(ArrayList<Integer> list) {
		return dao.selectList(list);
	}

	@Override
	public Al_Info_VO al_info_vo(int id) {
		return dao.al_info_vo(id);
	}

	@Override
	public ArrayList<Al_Info_VO> al_info_list(ArrayList<Integer> list) {
		// TODO Auto-generated method stub
		return null;
	}


}
