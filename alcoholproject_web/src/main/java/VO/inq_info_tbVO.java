package VO;

public class inq_info_tbVO {
	
	
	 int inq_id          ;//         number,                           --id
	 String inq_title       ;//         varchar2(500) not null,                    --문의글 제목
	 String inq_content     ;//         varchar2(4000) not null,                   --문의글 내용
	 int inq_writer      ;//         number not null,                    --문의글 작성자 id
	 String inq_writedate   ;//         date default sysdate,             --문의글 작성일
	 String inq_filename    ;//         varchar2(500),                    --문의글에 포함한 리뷰사진파일이름
	 String inq_filepath    ;//         varchar2(500),                    --문의글에 포함한 리뷰사진파일경로
	 int inq_root        ;//         number,                           --root : 문의글 댓글용 루트
	 int inq_step        ;//         number default 0,                 --step : 문의글 댓글용 스텝
	 int inq_indent      ;//         number default 0, 
	 
	 
	 
	public int getInq_id() {
		return inq_id;
	}
	public void setInq_id(int inq_id) {
		this.inq_id = inq_id;
	}
	public String getInq_title() {
		return inq_title;
	}
	public void setInq_title(String inq_title) {
		this.inq_title = inq_title;
	}
	public String getInq_content() {
		return inq_content;
	}
	public void setInq_content(String inq_content) {
		this.inq_content = inq_content;
	}
	public int getInq_writer() {
		return inq_writer;
	}
	public void setInq_writer(int inq_writer) {
		this.inq_writer = inq_writer;
	}
	public String getInq_writedate() {
		return inq_writedate;
	}
	public void setInq_writedate(String inq_writedate) {
		this.inq_writedate = inq_writedate;
	}
	public String getInq_filename() {
		return inq_filename;
	}
	public void setInq_filename(String inq_filename) {
		this.inq_filename = inq_filename;
	}
	public String getInq_filepath() {
		return inq_filepath;
	}
	public void setInq_filepath(String inq_filepath) {
		this.inq_filepath = inq_filepath;
	}
	public int getInq_root() {
		return inq_root;
	}
	public void setInq_root(int inq_root) {
		this.inq_root = inq_root;
	}
	public int getInq_step() {
		return inq_step;
	}
	public void setInq_step(int inq_step) {
		this.inq_step = inq_step;
	}
	public int getInq_indent() {
		return inq_indent;
	}
	public void setInq_indent(int inq_indent) {
		this.inq_indent = inq_indent;
	}
	
	 
	 
}
