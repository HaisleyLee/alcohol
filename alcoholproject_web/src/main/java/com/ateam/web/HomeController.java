package com.ateam.web;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import VO.mem_info_tbVO;
import common.CommonService;
import member.MemberServiceImpl;


@Controller
public class HomeController {
	
	@Autowired
	private MemberServiceImpl service;

	// 주소자동지정
	@Autowired
	private CommonService common;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		/*
		 * mem_info_tbVO mvo = (mem_info_tbVO)session.getAttribute("loginInfo");
		 * System.out.println("홈 mvo.getMem_email() : " + mvo.getMem_email());
		 */
		/*String mem_auto_ip = "";
		mem_info_tbVO vo = null;
		int mem_id = 0;
		try {
			// local host의 InetAddress 객체 가져오기
			InetAddress loopbackAddress = InetAddress.getLoopbackAddress();
			System.out.println("loopbackAddress : " + loopbackAddress.toString());

			InetAddress inad = InetAddress.getLocalHost();
			 comname / ip주소
			mem_auto_ip = inad.toString();
			System.out.println("getLocalHost : " + inad.toString());
			System.out.println("hostAddress : " + inad.getHostAddress());
			System.out.println("hostName : " + inad.getHostName());
			System.out.println("canonicalHostName : " + inad.getCanonicalHostName());
			System.out.println("isSiteLocalAddress : " + inad.isSiteLocalAddress());
			System.out.println("isLinkLocalAddress : " + inad.isLinkLocalAddress());
			System.out.println("isReachable : " + inad.isReachable(10));

			byte[] byteArr = inad.getAddress();
			for (byte b : byteArr) {
				System.out.println("byte : " + b);
			}

			InetAddress[] inetArr = InetAddress.getAllByName("localhost");
			for (InetAddress i : inetArr) {
				System.out.println("inetArr : " + i);
			}
			try {
				mem_id = service.member_loginokno(mem_auto_ip);
				System.out.println(mem_id);
			} catch (Exception e) {
				e.printStackTrace();
				mem_id = 0;
			}
				if(mem_id > 0) {
					vo = service.member_loginautogetid(mem_id);
					session.setAttribute("loginInfo", vo);
				}
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		
		return "home";
	}
	


	@RequestMapping("/error")
	public String error(HttpServletRequest request, Model model) {
		Throwable exception = (Throwable) request.getAttribute("javax.servlet.error.exception");
		StringBuffer msg = new StringBuffer();
		while (exception != null) {
			msg.append("<p>").append(exception.getMessage()).append("</p>");
			exception = exception.getCause();
		}
		model.addAttribute("msg", msg.toString());
		
		int code = (Integer)request.getAttribute("javax.servlet.error.status_code");
		
		return "error/" + (code == 404? "404" : "default");
		
	}

}
