package mypage;

import java.util.List;

import VO.MySubsVO;
import VO.mem_info_tbVO;

public interface mypageService {
	public int member_delete(int mem_id);
	List<MySubsVO> mySubsList(String id);
	List<MySubsVO> mySubsAllList(String id);
	List<MySubsVO> mySubsUpdate(List<String> list, String id);
	List<MySubsVO> mySubsResult(String id);
	public int meminfoupdate(mem_info_tbVO vo);
	public int socialmeminfoupdate(mem_info_tbVO vo);
	public mem_info_tbVO selectid(int id);
	

}//interface
