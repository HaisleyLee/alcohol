package com.ateam.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import VO.Al_Info_VO;
import VO.Subs_Info_VO;
import VO.mem_info_tbVO;
import common.CommonService;
import subs.SubscribeServiceImpl;


@Controller
public class SubsController {

	
	@Autowired private SubscribeServiceImpl service;

	// 주소자동지정
	@Autowired
	private CommonService common;
	
	
	//회원 X : 회원로그인하게 만들기 -> 로그인창 이동
	//jsp에서 세션 검증해서 세션이 없으면 로그인창으로 이동시켜버리기.
	
	
	//회원 O, 구독자 X : 구독신청 페이지 뜨게하기
	//세션을 가져와서.. 세션에 구독 정보 없으면 이게 뜨게 하기 -> /subs
	
	//회원 O, 구독자 O : 구독해서 받은 술 정보 뜨게 하기
	
	@RequestMapping("/subs")
	public String subs(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) {
		String mem_id = "";
		System.out.println("구독하기 탭에 접근");
		try {
				//세션에 값이 있으면
				
				/* session = req.getSession(); */
			try {
				mem_id = Integer.toString( ((mem_info_tbVO)session.getAttribute("loginInfo")).getMem_id() );
				System.out.println("구독하기 누른 회원 idmem_id : " + mem_id);
			} catch (Exception e) {
				return "member/login/login";
			}
				//세션에 담긴 멤버의 이메일정보 가져오기
				
				//구독 회원 판별
				int succ = service.subs_Chk(mem_id);
				System.out.println("섭컨트롤러 : succ : " + succ);
				if(succ == 1) {
					//구독회원이면
					//구독한 정보 보여주기
					System.out.println("구독중인 회원입니다.");
					List<Al_Info_VO> list = sub_alcoloList(Integer.parseInt(mem_id) );
					model.addAttribute("list", list);
					return "subs/list";
				} else {
					System.out.println("구독중인 회원이 아닙니다.");
					//구독회원이 아니면
					//구독창으로 보내기
					return "subs/insert";
				}
				
				
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인중이 아닙니다.");
			//세션이 null이면
			//로그인 하지 않은 사람은 로그인창으로 보내기
			return "member/login/login";
		}
	}
	
	
	//구독 신청시 데이터 넣기
	//@ResponseBody
	@RequestMapping("/subs_insert")
	public String subs_insert(HttpServletRequest request, HttpSession session, Model model) {
		System.out.println("subs_insert 진입");
		int succ = 0;
		
		Subs_Info_VO vo = new Subs_Info_VO();
		
		System.out.println("((mem_info_tbVO)session.getAttribute(\"loginInfo\")).getMem_id()" + ((mem_info_tbVO)session.getAttribute("loginInfo")).getMem_id());
		String mem_id = Integer.toString( ((mem_info_tbVO)session.getAttribute("loginInfo")).getMem_id() );
		
		System.out.println("subs_mem_id : " + mem_id );
		System.out.println("subs_address : " + request.getParameter("subs_address"));
		System.out.println("subs_deliverydt : " + Integer.parseInt(request.getParameter("numberofdate")));
		System.out.println("subs_price : " + (Integer.parseInt(request.getParameter("finalcost")) / Integer.parseInt(request.getParameter("numberofmonths") ) ));
		System.out.println("months : " + Integer.parseInt(request.getParameter("numberofmonths")));
		System.out.println("mem_mame : " + request.getParameter("name"));
		System.out.println("cardnum : " + request.getParameter("cardnum"));
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("subs_mem_id", mem_id);		//멤버 DB아이디 현재 String
		//subs_address String
		map.put("subs_address", request.getParameter("subs_address"));
		//String subs_deliverydt//배송 요청 주소
		map.put("subs_deliverydt", (request.getParameter("numberofdate")));		//배송 요청 날짜
		//int
		map.put("subs_price", (Integer.parseInt(request.getParameter("finalcost")) / Integer.parseInt(request.getParameter("numberofmonths"))) );	//구독 금액
		//subs_monthday : String
		map.put("months", Integer.parseInt(request.getParameter("numberofmonths")));			//구독 신청 개월 수
		
		map.put("mem_mame", request.getParameter("name"));						//멤버 이름
		map.put("cardnum", request.getParameter("cardnum"));						//멤버 카드번호
		
			
		List<Al_Info_VO> list = service.subs_alcList(Integer.parseInt(mem_id));
		model.addAttribute("list", list);
		System.out.println("subs_alcohol1 : " + list.get(0).getAl_id());
		System.out.println("subs_alcohol2 : " + list.get(1).getAl_id());
		map.put("subs_alcohol1", list.get(0).getAl_id() );
		map.put("subs_alcohol2", list.get(1).getAl_id() );
	
		succ = service.subs_insert(map);
		
		/*
		 * try {
		 * 
		 * } catch (Exception e) { succ = 2; }
		 */
		System.out.println("1:성공,2:실패 => " + succ);
		return "subs/insertresult";
	}
	
	

	
	//구독 이용자 다음달 보내줄 술 리스트 출력
	/* @ResponseBody */
	@RequestMapping(value = "/subs_dataLoad", method = {RequestMethod.GET, RequestMethod.POST})
	public void subs_alcList(HttpServletRequest request, HttpServletResponse response, Model model) {
		//멤버 아이디 스프링 내 임의 설정, 세션 유지시 받아와서 수정해야 함
		String mem_id_str = request.getParameter("mem_id");
		String mem_id_strss = request.getAttribute("mem_id")+"";
		System.out.println(mem_id_str);
		int mem_id = Integer.parseInt(mem_id_str);
		//System.out.println(mem_id);
		//멤버 아이디로 취향에 맞는 술 데이터 가져오기
		List<Al_Info_VO> list = service.subs_alcList(mem_id);
		model.addAttribute("list", list);
		System.out.println("첫번째 술 : " + list.get(0).getAl_name());
		System.out.println("두번째 술 : " + list.get(1).getAl_name());
		/* String json = ""; */
		
		//안드로이드와 다른 출력단
//		if(list != null) {
//			Gson gson = new Gson();
//			json = gson.toJson(list);
//		}
//		System.out.println(json);
//		
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=utf-8"); 
//		try { 
//			PrintWriter out =response.getWriter(); 
//			out.print(json.trim()); 
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
	}
	
	
	
	
	public List<Al_Info_VO> sub_alcoloList(int mem_id) {
		List<Al_Info_VO> list = service.subs_alcList(mem_id);
		System.out.println("첫번째 술 : " + list.get(0).getAl_name());
		System.out.println("두번째 술 : " + list.get(1).getAl_name());	
		return list;
	}

}