package notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImple implements NoticeService {
	@Autowired private NoticeDAO dao;
	
	@Override
	public List<NoticeVO> searchIm() {
		// 중요공지사항 가져오기
		return dao.searchIm();
	}

	@Override
	public NoticePage notice_list(NoticePage page) {
		// 페이지 단위로 공지글 목록 조회
		return dao.notice_list(page);
	}

	@Override
	public NoticeVO detailNotice(int id) {
		// 공지사항 세부내용 조회
		return dao.detailNotice(id);
	}

	@Override
	public List<NoticeVO> getNotice() {
		// 최신 공지사항 10개 list
		return dao.getNotice();
	}

	@Override
	public void notice_read(int id) {
		// 조회수 증가 처리
		dao.notice_read(id);
	}

	@Override
	public void notice_insert(NoticeVO vo) {
		// 신규 공지사항 작성
		dao.notice_insert(vo);
	}

	@Override
	public void notice_update(NoticeVO vo) {
		// 공지사항 수정
		dao.notice_update(vo);
	}

	@Override
	public void notice_reply_insert(NoticeVO vo) {
		// 공지사항 답글 삽입
		dao.notice_reply_insert(vo);
	}

	@Override
	public void notice_delete(int id) {
		// 공지글 삭제
		dao.notice_delete(id);
	}
	
}
