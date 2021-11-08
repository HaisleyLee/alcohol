package com.ateam.web;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

//import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import VO.MySubsVO;
import VO.Al_Info_VO;
import VO.fridge_info_tbVO;
import VO.mem_info_tbVO;
import common.CommonService;
import member.MemberServiceImpl;
import mypage.mypageServiceImpl;

@Controller
public class MypageController {

	@Autowired private mypageServiceImpl service;

	// 주소자동지정
	@Autowired
	private CommonService common;
	
	
	@Autowired
	private MemberServiceImpl mservice;
	
	@RequestMapping("mypage")
	public String mypage(HttpSession session, HttpServletRequest request) {

		return "mypage/mypagelist";
	}
	
	// 해당 마이페이지의 내용 띄우기
	@RequestMapping("/mypage/sub")
	public String mypage_list(HttpSession session, @RequestParam(defaultValue = "1") int selvalue, Model model, HttpServletRequest request) {
		// pid는 사이드메뉴 id임.
		System.out.println("사이드메뉴가져오기 elvalue : " + selvalue);
		String url = "mypage/submenupage/";
		mem_info_tbVO mvo = null;
		mem_info_tbVO sessioninfo = null;
		Al_Info_VO avo = null;
		fridge_info_tbVO fvo = null;
		int mem_id = 0;
		try {
			sessioninfo = (mem_info_tbVO) session.getAttribute("loginInfo");
			System.out.println("마이페이지 진입한 사람 : " + sessioninfo.getMem_nickname()+", "+sessioninfo.getMem_name());
			mem_id = sessioninfo.getMem_id();
			mvo = mservice.member_select_email(sessioninfo.getMem_email());
			mem_id = mvo.getMem_id();
			
		} catch (Exception e) {
			//로그인정보가없는경우
			/* return "redirect:login"; */
		}
		
		System.out.println("mypage_list ; mem_id: " + mem_id);
		System.out.println("mypage_list ; mem_pw: " + mvo.getMem_pw());
		System.out.println("mvo.getMem_social_type(); " + mvo.getMem_social_type());
		System.out.println("mvo.getMem_email; " + mvo.getMem_email());
		System.out.println("mvo.getMem_kakao; " + mvo.getMem_kakao());
		model.addAttribute("mvo",mvo);//회원정보
		if(selvalue == 1) {
			url += "subshistory";//구독내역
			List<MySubsVO> list = service.mySubsAllList(Integer.toString(mem_id));
			model.addAttribute("list",list);//모든 구독정보 가져오기
			
		}else if(selvalue == 2) {
			url += "refund";//구독환불신청
			List<MySubsVO> list = service.mySubsList(Integer.toString(mem_id));
			model.addAttribute("list",list);//환불 안 된 구독정보만 가져오기
			model.addAttribute("mem_id",mem_id);//환불신청자의 id
			
		}else if(selvalue == 3) {
			url += "refundhistory";//취소환불내역
			List<MySubsVO> list = service.mySubsResult(Integer.toString(mem_id));
			model.addAttribute("list",list);//구독정보
			
			
		}else if(selvalue == 4) {
			if( mvo.getMem_social_type() != null ) {
				//소셜회원 회원정보수정
				url += "socialupdate";//회원정보수정
				
			} else {
				//소셜회원이 아닌 일반회원
				url += "update";//회원정보수정
			}
			model.addAttribute("mvo",mvo);//회원정보
			/*
			 * }else if(selvalue == 5) { url += "inq";//문의사항
			 */
		}else if(selvalue == 6) {
			if( mvo.getMem_social_type() != null ) {
				//소셜회원 회원정보수정
				url += "socialdropout";//소셜회원회원탈퇴
				
			} else {
				//소셜회원이 아닌 일반회원
				url += "dropout";//회원탈퇴
			}
			model.addAttribute("mvo",mvo);//회원정보
			
			
		}else if(selvalue == 7) {
			url += "update2";//회원정보수정
		}else if(selvalue == 8) {
			url += "update3";//회원정보수정완료안내창
		}else if(selvalue == 9) {
			url += "socialupdate2";///카카오회원정보수정
		}else if(selvalue == 10) {
			model.addAttribute("mem_id", mem_id);
			
			
			url += "dropout2";//회원탈퇴마지막안내창
		}
		System.out.println(url);
		model.addAttribute("mvo", mvo);
		return url;
	}
	
	
	//passVerifi : 탈퇴요청시 비번 맞는지 검증
	@RequestMapping("/passVerifi")
	public String passVerifi(String inputpw, String mem_pw, HttpSession session, String mem_id, Model model, HttpServletRequest request) {
		
		System.out.println("inputpw : " + inputpw);
		System.out.println("mem_pw" + mem_pw);
		System.out.println("mem_id" + mem_id);
		if(mem_pw.equals(inputpw)) {
			System.out.println("탈퇴요청을 위한 비밀번호가 맞았습니다.");
		} else {
			System.out.println("탈퇴요청을 위한 비밀번호가 틀렸습니다.");
		}
		model.addAttribute("mem_id", mem_id);
		
		int selvalue = 10;
		return mypage2(session, selvalue, model, request);
	}
	//dropout : 탈퇴
	@RequestMapping("/dropout")
	public void dropout(HttpSession session, String mem_id, HttpServletResponse response) throws Exception {
		System.out.println("mem_id" + mem_id);
		
		int result = service.member_delete(Integer.parseInt(mem_id));
		System.out.println("탈퇴결과 result : " + result);
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		if(result == 1) {
			// 이때 contentType을 먼저하지 않으면, 한글이 깨질 수 있습니다.
			out.println("<script>alert('회원정보가 탈퇴되었습니다.');location.replace('http://221.156.48.92:8081/alcoholweb');</script>"); 
			out.flush();
			session.invalidate(); // 세션 전체를 날려버림
		} else {
			//중간에러로 다시 되돌림
			out.println("<script>alert('탈퇴 에러.');</script>"); 
			out.flush();
		}
	}
	
	//socialdropout : 소셜 회원 탈퇴
	@RequestMapping("/socialdropout")
	public String socialdropout(HttpSession session, String mem_id, HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
		
		System.out.println("mem_id : " + mem_id);
		
		model.addAttribute("mem_id", mem_id);
		
		int selvalue = 10;
		return mypage2(session, selvalue, model, request);
	}
	
	
	
	
	//환불신청내역보여주기
	 
	@ResponseBody @RequestMapping(value = "/subsRefund") 
	public String mySubsRefund(HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model) {
		System.out.println("mySubsRefund 진입"); 
		String url = "mypage/submenupage/subshistory";
		mem_info_tbVO mvo = null;
		int mem_id = 0;
		try {
			mvo = (mem_info_tbVO) session.getAttribute("loginInfo");
			System.out.println("환불완료 후 다시 갱신해서 보여주기위해 접근한 회원: " + mvo.getMem_nickname()+", "+mvo.getMem_name());
			mem_id = mvo.getMem_id();
		} catch (Exception e) {
			//로그인정보가없는경우
			//return "redirect:login";
		}
		System.out.println("mypage_list ; mem_id: " + mem_id);
		
		List<MySubsVO> list = service.mySubsAllList(Integer.toString(mem_id));
		model.addAttribute("list",list);//모든 구독정보 가져오기
		return "redirect:"+url;
	}
	
	
	/*
	 * //구독전체내역보기
	 * 
	 * @ResponseBody @RequestMapping(value = "/my.subsDetail") public String
	 * mySubsList(HttpServletResponse response, HttpServletRequest request, Model
	 * model) { String mem_id = request.getParameter("mem_id");
	 * System.out.println("mySubsList 진입, "+"mem_id: " + mem_id);
	 * 
	 * List<MySubsVO> list = service.mySubsAllList(mem_id);
	 * 
	 * model.addAttribute("list",list); return ""; }
	 */
	
	//환불접근?
	/* @ResponseBody */ 
	@RequestMapping(value = "/refundgo")
	public String refundgo(HttpServletRequest request, HttpServletResponse response, Model mod, ModelMap model, String mem_id, HttpSession session) throws Exception {
		System.out.println("refundgo까지 옴");
		System.out.println("환불신청자id mem_id : " + mem_id);
		List<MySubsVO> resultList = new ArrayList<MySubsVO>();	//DB 저장결과 성공 여부 판단
		List<String> refundmonth = new ArrayList<String>();//취소신청한 연월 담을 리스트
		try{
			for(int i = 0; i < request.getParameterValues("selectedrefund").length ; i++){
				System.out.println(request.getParameterValues("selectedrefund")[i]);
				refundmonth.add(request.getParameterValues("selectedrefund")[i]);
			}
		} catch(Exception e){
			e.printStackTrace();
			System.out.println("환불 중 에러남");
		}
		resultList = service.mySubsUpdate(refundmonth, mem_id);
		/* HttpSession session, int selvalue, Model model, HttpServletRequest request */
		int selvalue = 2;
		return mypage2(session, selvalue, mod, request);
	}
	 @ResponseBody
	 @RequestMapping("mypage2") 
	 public String mypage2(HttpSession session, int selvalue, Model model, HttpServletRequest request) {
		 	int mem_id = 0;
			mem_info_tbVO mvo = null;
			try {
				mvo = (mem_info_tbVO) session.getAttribute("loginInfo");
				System.out.println("회원정보수정 진입한 사람 : " + mvo.getMem_nickname()+", "+mvo.getMem_name());
				mem_id = mvo.getMem_id();
			} catch (Exception e) {
				//로그인정보가없는경우
				//return "redirect:login";
			}
			
		model.addAttribute("mvo",mvo);
		model.addAttribute("mem_id",mem_id);
		 model.addAttribute("selvalue",selvalue); 
	 return "mypage/mypagelist"; 
	 }
	
	
	//회원정보수정
	/* @ResponseBody */ 
	@RequestMapping("/update")
	public String update(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("회원정보수정-비밀번호일치 update");
		
		/* 회원정보가 존재하므로 수정창으로 이동시킴 */
		int selvalue = 7;
		return mypage2(session, selvalue, model, request);
	}
	
	//회원정보수정 값 저장
	/* @ResponseBody */ 
	@RequestMapping("/update2")
	public String update2(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model, mem_info_tbVO vo, MultipartFile file) {
		System.out.println("회원정보수정 진행 update2 : " + vo.getMem_nickname());
		
		// 첨부파일이 있다면
		if (!file.isEmpty()) {
			vo.setMem_profile_imgname(file.getOriginalFilename());

			// common.fileUpload(HttpSession, MultipartFile, "저장할 경로");
			vo.setMem_profile_imgpath(common.fileUpload(session, file, "board"));
		}
		//작성자가 작성한 수정정보 가져왔는지 확인 : vo
		System.out.println("vo.getMem_email() : " + vo.getMem_email());
		System.out.println("vo.getMem_name()" + vo.getMem_name());
		System.out.println("vo.getMem_gender()" + vo.getMem_gender());
		System.out.println("vo.getMem_phone()" + vo.getMem_phone());
		System.out.println("vo.getMem_address()" + vo.getMem_address());
		System.out.println("vo.getMem_post()" + vo.getMem_post());
		System.out.println("vo.getMem_id() : " + vo.getMem_id());
		System.out.println("vo.getMem_pw()" + vo.getMem_pw());
		System.out.println("vo.getMem_nickname()" + vo.getMem_nickname());
		System.out.println("vo.getMem_profile_imgname()" + vo.getMem_profile_imgname());
		System.out.println("vo.getMem_profile_imgpath()" + vo.getMem_profile_imgpath());
		//작성자의 수정전 정보 가져오기 : mvo
		mem_info_tbVO mvo = service.selectid(vo.getMem_id());
		
		if(vo.getMem_name().equals("")) {
			vo.setMem_name(mvo.getMem_name());
		}
		if(vo.getMem_gender().equals("")) {
			vo.setMem_gender(mvo.getMem_gender());
		}
		if(vo.getMem_phone().equals("")) {
			vo.setMem_phone(mvo.getMem_phone());
		}
		if(vo.getMem_address().equals("")) {
			vo.setMem_address(mvo.getMem_address());
		}
		if(vo.getMem_post().equals("")) {
			vo.setMem_post(mvo.getMem_post());
		}
		if(vo.getMem_pw().equals("")) {
			vo.setMem_pw(mvo.getMem_pw());
		}
		if(vo.getMem_birth().equals("")) {
			vo.setMem_birth(mvo.getMem_birth());
		}
		if(vo.getMem_nickname().equals("")) {
			vo.setMem_nickname(mvo.getMem_nickname());
		}
		if(vo.getMem_profile_imgpath() == null) {
			vo.setMem_profile_imgpath(mvo.getMem_profile_imgpath());
		}
		if(vo.getMem_profile_imgname() == null) {
			vo.setMem_profile_imgname(mvo.getMem_profile_imgname());
		}
		int result = service.meminfoupdate(vo);
		System.out.println("회원정보수정 후 결과 : " + result);
		if(result == 1) {
			System.out.println("회원정보수정 성공했습니다");
			session.setAttribute("loginInfo", vo);
			session.setAttribute("mem_profile_imgpath", vo.getMem_profile_imgpath());
		}
		
		/* 회원정보가 존재하므로 수정창으로 이동시킴 */
		int selvalue = 8;
		
		
		return mypage2(session, selvalue, model, request);
	}
	
	
	//소셜카카오회원정보수정
	/* @ResponseBody */ 
	@RequestMapping("/socialupdate")
	public String socialupdate(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("[소셜]회원정보수정-비밀번호일치 update");
		
		/* 회원정보가 존재하므로 수정창으로 이동시킴 */
		int selvalue = 9;
		return mypage2(session, selvalue, model, request);
	}
	//회원정보수정 값 저장
	/* @ResponseBody */ 
	@RequestMapping("/socialupdate2")
	public String socialupdate2(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model, mem_info_tbVO vo, MultipartFile file) {
		System.out.println("[소셜]회원정보수정 진행 update2 : " + vo.getMem_nickname());
		
		// 첨부파일이 있다면
		if (!file.isEmpty()) {
			vo.setMem_profile_imgname(file.getOriginalFilename());
			
			// common.fileUpload(HttpSession, MultipartFile, "저장할 경로");
			vo.setMem_profile_imgpath(common.fileUpload(session, file, "board"));
		}
		//작성자가 작성한 수정정보 가져왔는지 확인 : vo
		try {
			System.out.println("vo.getMem_id() : " + vo.getMem_id());
			System.out.println("vo.getMem_kakao_id() : " + vo.getMem_kakao_id());
			System.out.println("vo.getMem_email() : " + vo.getMem_email());
			System.out.println("vo.getMem_name()" + vo.getMem_name());
			System.out.println("vo.getMem_gender()" + vo.getMem_gender());
			System.out.println("vo.getMem_phone()" + vo.getMem_phone());
			System.out.println("vo.getMem_address()" + vo.getMem_address());
			System.out.println("vo.getMem_post()" + vo.getMem_post());
			System.out.println("vo.getMem_nickname()" + vo.getMem_nickname());
			System.out.println("vo.getMem_body()" + vo.getMem_body());//취향
			System.out.println("vo.getMem_alcohol_bv()" + vo.getMem_alcohol_bv());//취향
			System.out.println("vo.getMem_alcohol_type()" + vo.getMem_alcohol_type());//취향
			System.out.println("vo.getMem_flavor()" + vo.getMem_flavor());//취향
			System.out.println("vo.getMem_smell()" + vo.getMem_smell());//취향
			System.out.println("vo.getMem_profile_imgname()" + vo.getMem_profile_imgname());
			System.out.println("vo.getMem_profile_imgpath()" + vo.getMem_profile_imgpath());
		} catch (Exception e) {
			e.printStackTrace();
		}

		//작성자의 수정전 정보 가져오기 : mvo
		mem_info_tbVO mvo = mservice.member_select_email(vo.getMem_email());
		//소셜로그인은 카카오의 id값을 email컬럼에 갖고있다.
		System.out.println(" mvo.getMem_profile_imgpath() : " + mvo.getMem_profile_imgpath());
		
		if(vo.getMem_name() == null) {
			if(mvo.getMem_name() != null) {
				System.out.println("mvo.getMem_name() : " + mvo.getMem_name());
				vo.setMem_name(mvo.getMem_name());
			}
		}
		if(vo.getMem_gender() == null) {
			if(mvo.getMem_gender() != null) {
				System.out.println("mvo.getMem_gender() : " + mvo.getMem_gender());
				vo.setMem_gender(mvo.getMem_gender());
			}
		}
		if(vo.getMem_phone() == null) {
			if(mvo.getMem_phone() != null) {
				System.out.println("mvo.getMem_phone() : " + mvo.getMem_phone());

				vo.setMem_phone(mvo.getMem_phone());
			}
		}
		if(vo.getMem_address() == null) {
			if(mvo.getMem_address() != null) {
				System.out.println("mvo.getMem_address() : " + mvo.getMem_address());

				vo.setMem_address(mvo.getMem_address());
			}
		}
		if(vo.getMem_post() == null) {
			if(mvo.getMem_post() != null) {
				System.out.println("mvo.getMem_post() : " + mvo.getMem_post());

				vo.setMem_post(mvo.getMem_post());
			}
		}
		if(vo.getMem_birth() == null) {
			if(mvo.getMem_birth() != null) {
				System.out.println("mvo.getMem_birth() : " + mvo.getMem_birth());

				vo.setMem_birth(mvo.getMem_birth());
			}
		}
		if(vo.getMem_nickname() == null) {
			if(mvo.getMem_nickname() != null) {
				System.out.println("mvo.getMem_nickname() : " + mvo.getMem_nickname());

				vo.setMem_nickname(mvo.getMem_nickname());
			}
		}
		if(vo.getMem_profile_imgpath() == null) {
			if(mvo.getMem_profile_imgpath() != null) {
				System.out.println("mvo.getMem_profile_imgpath() : " + mvo.getMem_profile_imgpath());
				vo.setMem_profile_imgpath(mvo.getMem_profile_imgpath());
			}
		}
		if(vo.getMem_profile_imgname() == null) {
			vo.setMem_profile_imgname("kakao");
		}
		
		int result = service.socialmeminfoupdate(vo);//소셜회원 회원정보수정
		System.out.println("회원정보수정 후 결과 : " + result);
		if(result == 1) {
			System.out.println("회원정보수정 성공했습니다");
			session.setAttribute("loginInfo", vo);
			session.setAttribute("mem_profile_imgpath", vo.getMem_profile_imgpath());
		}
		
		/* 회원정보가 존재하므로 수정창으로 이동시킴 */
		int selvalue = 8;
		
		
		return mypage2(session, selvalue, model, request);
	}
	
	
	
}
