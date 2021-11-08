package com.ateam.web;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import VO.mem_info_tbVO;
import member.MemberServiceImpl;

@Controller
public class ChatController {
	
	@Autowired
	private MemberServiceImpl service;
	
	@RequestMapping("/list.chat")
	/*public String chatList(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response, @RequestParam("usernickname") String usernickname) {*/
	public String chatList(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response, @RequestParam(defaultValue = "이영은") String usernickname) {
		System.out.println("usernickname : " + usernickname);
		HashMap<String, String> chatInfo = new HashMap<String, String>();
		mem_info_tbVO mvo = null;
		String imgpath = "";
		String type= "";
		System.out.println("usernickname : " + usernickname);
		/*try {
			 Cookie[] cookies = request.getCookies() ;
			    if(cookies != null){
			        for(int i=0; i < cookies.length; i++){
			            Cookie c = cookies[i] ;
			            // 저장된 쿠키 이름을 가져온다
			            String cName = c.getName();
			            System.out.println("cName : " + cName);
			            // 쿠키값을 가져온다
			            String cValue = c.getValue();
			            System.out.println("cValue : " + cValue);
			            if(cName.equals("usernickname")) {
			            	usernickname = c.getValue();
			            	System.out.println("고객센터 상대방 쿠키 있음 : " + usernickname+ ", "+i+"번째");
			            } else {
			            	System.out.println("고객센터 상대방 쿠키 없음"+ ", "+i+"번째");
			            }
			        }
			    }
		} catch (Exception e) {
			// TODO: handle exception
		}*/
	   
		
		try {
			mvo = (mem_info_tbVO)session.getAttribute("loginInfo");//세션정보가있으면
			if(mvo != null) {
				System.out.println("세션있음. : mvo.getMem_nickname()" + mvo.getMem_nickname());
				type = "회원or관리자";
			}
			
		} catch (Exception e) {
			/* e.printStackTrace(); */
			System.out.println("null이야!");
			System.out.println("세션없음.");
		}
		try {
			if(type.equals("회원or관리자")){
				if(mvo.getMem_nickname().equals("관리자")) {
					//만약에 기존에 답변해주던 사람이 있으면
				    // 쿠키값 가져오기

					try {
						imgpath = service.member_imgpath(usernickname);
						//회원의 프로필사진이 없으면
						if(imgpath == null) {
							imgpath = "https://i.ibb.co/2dmSNz2/333333333333.jpg";
						}
					} catch (Exception e) {
						/* e.printStackTrace(); */
						System.out.println("null이야!");
						//회원의 프로필사진이 없으면
						imgpath = "https://i.ibb.co/2dmSNz2/333333333333.jpg";
					}
					chatInfo.put("id", "술장고 상담원");//회원닉넴
					chatInfo.put("name", "술장고 상담원");//회원닉넴
					chatInfo.put("receiveId", usernickname);
					System.out.println("imgpath : " + imgpath);
					chatInfo.put("imgpath", "https://i.ibb.co/kJGgh83/supporter.jpg");
					chatInfo.put("receiveimgpath", imgpath);
				} else {
					//일반회원
					chatInfo.put("id", mvo.getMem_nickname());//회원닉넴
					chatInfo.put("name", mvo.getMem_nickname());//회원닉넴
					chatInfo.put("receiveId", "술장고 상담원");
					if(service.member_imgpath(usernickname) != null) {
						try {
							imgpath = service.member_imgpath(usernickname);
						} catch (Exception e) {
							e.printStackTrace();
							//회원의 프로필사진이 없으면
							imgpath = "https://i.ibb.co/2dmSNz2/333333333333.jpg";
						}
					} else {
						//회원의 프로필사진이 없으면
						imgpath = "https://i.ibb.co/2dmSNz2/333333333333.jpg";
					}
					
					System.out.println("imgpath : " + imgpath);
					chatInfo.put("imgpath", imgpath);
					chatInfo.put("receiveimgpath", "https://i.ibb.co/kJGgh83/supporter.jpg");
				}
			} else {
				//비회원
				System.out.println("안쪽 비회원문");
				chatInfo.put("id", "게스트");//비회원의 닉넴
				chatInfo.put("name", "게스트");//비회원의 닉넴
				chatInfo.put("receiveId", "술장고 상담원");
				chatInfo.put("imgpath", "https://i.ibb.co/2dmSNz2/333333333333.jpg");
				chatInfo.put("receiveimgpath", "https://i.ibb.co/kJGgh83/supporter.jpg");
			}
			
		} catch (Exception e) {
			/* e.printStackTrace(); */
			System.out.println("null이야!");
			//비회원
			System.out.println("바깥 비회원문");
			chatInfo.put("id", "게스트");//비회원의 닉넴
			chatInfo.put("name", "게스트");//비회원의 닉넴
			chatInfo.put("receiveId", "술장고 상담원");
			chatInfo.put("imgpath", "https://i.ibb.co/2dmSNz2/333333333333.jpg");
			chatInfo.put("receiveimgpath", "https://i.ibb.co/kJGgh83/supporter.jpg");
		}
		model.addAttribute("chatInfo", chatInfo);
		
		return "chat/list";
		
	}	
}