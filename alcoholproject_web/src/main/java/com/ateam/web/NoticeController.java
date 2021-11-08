package com.ateam.web;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import notice.NoticePage;
import notice.NoticeServiceImple;
import notice.NoticeVO;

@Controller
public class NoticeController {
	@Autowired NoticeServiceImple service;
	@Autowired private NoticePage page;	//페이지 세팅을 위한 값
	
	/*공지사항 클릭 시 전체 목록 화면*/
	@RequestMapping("notice")
	public String notice(HttpSession session, Model model, @RequestParam(defaultValue = "1") int curPage , String search, String keyword) {
		/* session.setAttribute("category", "notice"); */
		
		//중요공지사항만 가져오기
		List<NoticeVO> list = service.searchIm();
		model.addAttribute("list", list);
		
		//페이지 설정
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		
		model.addAttribute("page", service.notice_list(page));
		return "notice/list";
	}
	
	/*공지사항 세부내용 보기*/
	@RequestMapping("view.notice")
	public String viewnotice(Model model, int id) {
		//조회수 증가처리 -> 먼저 되지 않으면 조회 한 후 증가함.
		service.notice_read(id);
		
		//페이지 관련 정보
		model.addAttribute("page", page);
		//세부사항 검색해서 오기
		model.addAttribute("vo", service.detailNotice(id));
		
		//최신 게시물 15개만 검색해서 가져오기
		model.addAttribute("recent", service.getNotice());
		
		//엔터처리
		model.addAttribute("crlf", "\r\n");		
		return "notice/detail";
	}
	
	/*신규 공지 사항 작성*/
	@RequestMapping("new.notice")
	public String newnotice() {
		//화면 전환
		return "notice/new";
	}
	
	@Autowired private CommonService common;
	
	/*파일 다운로드 처리*/
	@RequestMapping("download.no")
	public void downloadno(int id, HttpSession session, HttpServletResponse response) {
		NoticeVO vo = service.detailNotice(id);
		common.fileDownload(session, vo.getFilepath(), vo.getFilename(), response);
	}
	
	/*새 공지사항 삽입*/
	@RequestMapping("insert.notice")
	public String insertnotice(NoticeVO vo, MultipartFile file, HttpSession session, String important) {
		//전체 공지사항 부분 변경
		try {
			if(important.equals("on")) {
				vo.setImportant("Y");
			}
		} catch (Exception e) {
			vo.setImportant("N");
		}
		//파일처리 : 첨부된 파일이 있다면, 데이터 객체에 파일 정보를 담아야한다.
		if(!file.isEmpty()) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.fileUpload(session, file, "notice"));
		}
		
		service.notice_insert(vo);
		
		return "redirect:notice";
	}
	
	/*공지사항 수정*/
	@RequestMapping("modify.notice")
	public String modifynotice(Model model, int id) {
		//공지글의 정보를 조회해서 수정 화면에 출력 -> 조회해온 정보를 model에 담는 것만 해야함
		NoticeVO vo = service.detailNotice(id);
		model.addAttribute("vo", vo);
		
		return "notice/modify";
	}
	
	/*공지사항 수정 완료 후 redirect*/
	@RequestMapping("update.notice")
	public String updatenotice(NoticeVO vo, HttpSession session, String attach
			, /* @RequestParam(value="file") */ MultipartFile file, String important) {
		//전체 공지사항 부분 변경
		try {
			if(important.equals("on")) {
				vo.setImportant("Y");
			}
		} catch (Exception e) {
			vo.setImportant("N");
		}
		
		//파일 처리
		NoticeVO notice = service.detailNotice(vo.getId());
		String uuid = session.getServletContext().getRealPath("resources") 
						+ "/" + notice.getFilepath();
		
		if( file.isEmpty() ) {
			//파일을 첨부하지 않은 경우
			//원래 첨부파일이 있었고 그걸 그대로 사용하는 경우
			if( !attach.isEmpty() ) {
				vo.setFilename( notice.getFilename() );
				vo.setFilepath( notice.getFilepath() );
			}else{
			//원래부터 첨부하지 않았고 수정시도 첨부하지 않은 경우
			//원래 첨부된 파일이 있었는데 삭제한 경우 - 원래의 파일을 물리적영역에서 삭제
				if( notice.getFilename()!=null ) {
					File f = new File(uuid);
					if( f.exists() ) f.delete();
				}
			}
		}else {
			//파일을 첨부한 경우
			//원래 첨부파일이 없었는데 수정시 첨부한 경우
			//원래 첨부파일이 있었고 수정시 바꿔서 첨부한 경우 - 원래의 파일을 물리적영역에서 삭제
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath( common.fileUpload(session, file, "notice") );
		
			if( notice.getFilename() !=null ) {
				File f = new File( uuid );
				if( f.exists() ) f.delete();
			}
		}
		
		//수정 화면에서 변경 입력한 정보를 DB에 저장한 후 상세화면으로 연결한다
		service.notice_update(vo);
		return "redirect:view.notice?id="+vo.getId();
	}
	
	/*답글 쓰기*/
	@RequestMapping("reply.notice")
	public String replynotice(int id, Model model) {
		//답글의 step은 선처리가 필요하다 : 원글과 동일한 root인 글에 대해 원글의 step보다 더 큰 step인 글은 먼저 step + 1을 한다
		//원글의 정보를 조회해 답글 쓰기 화면에 사용
		model.addAttribute("vo", service.detailNotice(id));
		return "notice/reply";	
	}
	
	/*공지사항 답글 처리*/
	@RequestMapping("reply_insert.notice")
	public String reply_insertnotice(NoticeVO vo ,String important, MultipartFile file, HttpSession session) {
		//전체 공지 사항으로 선택했는지 아닌지 여부 판단
		try {
			if(important.equals("on")) {
				vo.setImportant("Y");
			}
		} catch (Exception e) {
			vo.setImportant("N");
		}
		//파일처리 : 첨부된 파일이 있다면, 데이터 객체에 파일 정보를 담아야한다.
		if(!file.isEmpty()) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.fileUpload(session, file, "notice"));
		}
		
		service.notice_reply_insert(vo);
		return "redirect:notice";
	}
	
	/*공지글 삭제 처리*/
	@RequestMapping("delete.notice")
	public String deletenotice(int id, HttpSession session) {
		//글을 삭제 했다면 글에 첨부된 파일 또한 삭제 해야한다.
		NoticeVO vo = service.detailNotice(id);
		if(vo.getFilename() != null) {
			File file = new File(session.getServletContext().getRealPath("resources") + "/" + vo.getFilepath());
			if( file.exists() ) file.delete();
		}
		
		//게시글 삭제 처리
		service.notice_delete(id);
		return "redirect:notice";
	}
	
}
