package notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO implements NoticeService {
	@Autowired @Qualifier("hanul") private SqlSession sql;

	@Override
	public List<NoticeVO> searchIm() {
		// 중요공지사항 가져오기
		return sql.selectList("notice.mapper.searchIm");
	}

	@Override
	public NoticePage notice_list(NoticePage page) {
		// 페이지 별로 공지사항 처리
		page.setTotalist((Integer) sql.selectOne("notice.mapper.totalList" ,page));
		page.setList((List) sql.selectList("notice.mapper.list", page));
		return page;
	}

	@Override
	public NoticeVO detailNotice(int id) {
		// 공지사항 세부내용 조회
		return sql.selectOne("notice.mapper.detailNotice", id);
	}

	@Override
	public List<NoticeVO> getNotice() {
		// TODO Auto-generated method stub
		return sql.selectList("notice.mapper.getNotice");
	}

	@Override
	public void notice_read(int id) {
		// 조회수 증가처리
		sql.update("notice.mapper.notice_read",id);
	}

	@Override
	public void notice_insert(NoticeVO vo) {
		// 신규 공지사항 작성
		sql.insert("notice.mapper.notice_insert",vo);
	}

	@Override
	public void notice_update(NoticeVO vo) {
		// 공지사항 수정
		sql.update("notice.mapper.notice_update", vo);
	}

	@Override
	public void notice_reply_insert(NoticeVO vo) {
		// 공지사항 답글 삽입
		sql.insert("notice.mapper.notice_reply_insert",vo);
	}

	@Override
	public void notice_delete(int id) {
		// 공지글 삭제
		sql.delete("notice.mapper.notice_delete",id);
	}


}
