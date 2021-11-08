package com.ateam.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import VO.Al_Info_VO;
import VO.fridge_info_tbVO;
import VO.mem_info_tbVO;
import VO.mst_codeVO;
import fridge.fridgeServiceImpl;


@Controller
public class MyalcoholController {
	
	@Autowired private fridgeServiceImpl service;

	//내 술장고 안 술 데이터를 가져와서 보여주는 란입니다.
	
	@RequestMapping(value = "/myalcohol", method = RequestMethod.GET)
	public String myalcohol(HttpSession session, Model model) {
		int mem_id = 0;
		try {
			mem_info_tbVO mvo = (mem_info_tbVO) session.getAttribute("loginInfo");
			System.out.println("내 술 정보 진입한 사람 : " + mvo.getMem_nickname()+", "+mvo.getMem_name() + ", " +mvo.getMem_id() );
			
			mem_id = mvo.getMem_id();
		} catch (Exception e) {
			/* 로그인정보가 없는 경우 로그인창으로 이동시킴 */
			return "redirect:login";
		}
			try {
				List<fridge_info_tbVO> list = service.fridge_select(mem_id);
				
				System.out.println(list.get(0).getFridge_al_id());
				
				List<Al_Info_VO> al_list = (List<Al_Info_VO>) new ArrayList<Al_Info_VO>();
				
				for (int i = 0 ; i < list.size(); i++) {
					Al_Info_VO avo = service.al_select(list.get(i).getFridge_al_id());
					al_list.add(avo);
				}
				System.out.println("첫번째 술 : " + al_list.get(0).getAl_name());
				System.out.println("첫번째 술 : " + al_list.get(0).getAl_id());
				
				model.addAttribute("list", al_list);
				model.addAttribute("alcheck", "T");
				
				return "myalcohol/list";
			} catch (Exception e) {
				/* 술장고 내 술이 없을 때 안내 페이지*/
				model.addAttribute("alcheck", "F");
				
				return "myalcohol/list";
			}
		
	}
	
	@RequestMapping(value = "/myalcoholdetail", method = RequestMethod.GET)
	public String myalcoholdeltail(HttpSession session, Model model, int al_id) {
		/* System.out.println("al_id : " + al_id); */
		
		Al_Info_VO avo= service.al_select(al_id);
		avo.getAl_body();
		avo.getAl_flavor();
		avo.getAl_smell();
		avo.getAl_alcohol_type();
		
		mst_codeVO cvo = service.mst_code(Integer.parseInt(avo.getAl_body()));
		String al_body = cvo.getMst_value();
		model.addAttribute("al_body", al_body);
		
		cvo = service.mst_code(Integer.parseInt(avo.getAl_flavor()));
		String al_flavor = cvo.getMst_value();
		model.addAttribute("al_flavor", al_flavor);
		
		cvo = service.mst_code(Integer.parseInt(avo.getAl_smell()));
		String al_smell = cvo.getMst_value();
		model.addAttribute("al_smell", al_smell);
		
		cvo = service.mst_code(Integer.parseInt(avo.getAl_alcohol_type()));
		String al_alcohol_type = cvo.getMst_value();
		model.addAttribute("al_alcohol_type", al_alcohol_type);
		
		model.addAttribute("alcheck", "T");
		System.out.println("avo.getAl_name() : " + avo.getAl_name());
		model.addAttribute("avo",avo);
		
		return "myalcohol/detail";
	}
}
