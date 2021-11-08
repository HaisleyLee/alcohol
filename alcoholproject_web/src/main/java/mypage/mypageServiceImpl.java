package mypage;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import VO.MySubsVO;
import VO.mem_info_tbVO;


@Service
public class mypageServiceImpl implements mypageService {
	@Autowired private mypageDAO dao;
	
	@Override
	public int member_delete(int mem_id) {
		
		return dao.member_delete(mem_id);
	}


	@Override
	public List<MySubsVO> mySubsList(String id) {
		return dao.mySubsList(id);
	}

	@Override
	public List<MySubsVO> mySubsUpdate(List<String> list, String id) {
		return dao.mySubsUpdate(list, id);
	}

	@Override
	public List<MySubsVO> mySubsResult(String id) {
		return dao.mySubsResult(id);
	}

	@Override
	public List<MySubsVO> mySubsAllList(String id) {
		return dao.mySubsAllList(id);
	}
	
	@Override
	public int meminfoupdate (mem_info_tbVO vo) {
		return dao.meminfoupdate(vo);
	}
	@Override
	public int socialmeminfoupdate (mem_info_tbVO vo) {
		return dao.socialmeminfoupdate(vo);
	}
	@Override
	public mem_info_tbVO selectid (int id) {
		return dao.selectid(id);
	}

	

}//class
