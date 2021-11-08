package VO;

public class notice_info_tbVO {
	
	  int notice_id           ;//          number,                           --공지글 테이블pk키/ pk키
	  String notice_title        ;//          varchar2(500) not null,                    --공지 제목
	  String notice_content      ;//          varchar2(4000) not null,                   -- 공지 내용
	  int notice_writer       ;//          number not null,                           -- 공지 작성자 id
	  String notice_writedate    ;//          date default sysdate,             --공지 작성일
	  int notice_readcnt      ;//          number default 0,                           --공지 조회수
	  String notice_filename     ;//          varchar2(500),                    --공지에 포함된 공지 사진파일이름
	  String notice_filepath     ;//          varchar2(500),                    --공지에 포함된 공지 사진파일경로
	  int notice_root         ;//          number,                          -- root : 공지 댓글용 루트
	  int notice_step         ;//          number default 0,                 -- step : 공지 댓글용 스텝
	  int notice_indent       ;//          number default 0,                 -- indent : 공지 댓글용 인덴트
	  String notice_important    ;//          varchar2(10),               
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(int notice_writer) {
		this.notice_writer = notice_writer;
	}
	public String getNotice_writedate() {
		return notice_writedate;
	}
	public void setNotice_writedate(String notice_writedate) {
		this.notice_writedate = notice_writedate;
	}
	public int getNotice_readcnt() {
		return notice_readcnt;
	}
	public void setNotice_readcnt(int notice_readcnt) {
		this.notice_readcnt = notice_readcnt;
	}
	public String getNotice_filename() {
		return notice_filename;
	}
	public void setNotice_filename(String notice_filename) {
		this.notice_filename = notice_filename;
	}
	public String getNotice_filepath() {
		return notice_filepath;
	}
	public void setNotice_filepath(String notice_filepath) {
		this.notice_filepath = notice_filepath;
	}
	public int getNotice_root() {
		return notice_root;
	}
	public void setNotice_root(int notice_root) {
		this.notice_root = notice_root;
	}
	public int getNotice_step() {
		return notice_step;
	}
	public void setNotice_step(int notice_step) {
		this.notice_step = notice_step;
	}
	public int getNotice_indent() {
		return notice_indent;
	}
	public void setNotice_indent(int notice_indent) {
		this.notice_indent = notice_indent;
	}
	public String getNotice_important() {
		return notice_important;
	}
	public void setNotice_important(String notice_important) {
		this.notice_important = notice_important;
	}
	  
	  
	  
}
