package notice;

import java.util.List;

public interface NoticeService {
	List<NoticeVO> searchIm();	//중요공지사항 가져오기 (important column)
	NoticePage notice_list(NoticePage page);	//페이지 단위로 공지글 목록 조회
	NoticeVO detailNotice(int id);	//공지사항 세부 가져오기
	List<NoticeVO> getNotice();	//최신 게시물 10개만 가져온다. 
	void notice_read(int id);	//조회수 증가
	void notice_insert(NoticeVO vo); //공지사항 신규 작성
	void notice_update(NoticeVO vo);	//공지사항 수정
	void notice_reply_insert(NoticeVO vo);	//공지사항 답글 작성
	void notice_delete(int id);	//공지글 삭제
}
