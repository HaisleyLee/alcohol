package todaysTest;

import java.util.ArrayList;
import java.util.List;

import VO.Al_Info_VO;
import VO.TodaysTestVO;

public interface TodaysTestService {
	List<TodaysTestVO> todaysTest();
	int todaysTestResult(String id, String answer);
	ArrayList<Integer> randomNum(ArrayList<Integer> list);
	List<Integer> selectList(ArrayList<Integer> list);
	Al_Info_VO al_info_vo(int id);
	List<Al_Info_VO> al_info_list(ArrayList<Integer> list);
}
