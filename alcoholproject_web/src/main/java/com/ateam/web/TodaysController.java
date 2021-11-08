package com.ateam.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import VO.Al_Info_VO;
import VO.TodaysTestVO;
import VO.mst_codeVO;
import edu.emory.mathcs.backport.java.util.Collections;
import fridge.fridgeServiceImpl;
import todaysTest.TodaysTestServiceImpl;


@Controller
public class TodaysController {

	//오늘의 술 심리테스트를 통해서 술을 추천해주는 서비스입니다.
	@Autowired private TodaysTestServiceImpl service;
	@Autowired private fridgeServiceImpl fservice;
	
	
	@RequestMapping(value = "/todays", method = RequestMethod.GET)
	public String sub(HttpSession session, Model model) {
		
		System.out.println("웹 오늘의 술 추천 진입");
		List<TodaysTestVO> list = service.todaysTest();
		System.out.println(list.get(0).getTodays_q());
		
		Collections.shuffle(list);//문제 랜덤
		
		model.addAttribute("list", list);
		
		return "todays/list";
	}
	
	@RequestMapping("/todaysreco")
	public String todaysreco(HttpSession session, Model model, String todaysress, String idqlist) {
		
		System.out.println("테스트 완료 todaysress : " + todaysress);
		//응답자의 선택답리스트
		ArrayList<String> answerList = new ArrayList<String>();
		for (int i = 0; i <todaysress.length(); i++) {
			answerList.add(todaysress.split("")[i]);
		}
		
		System.out.println("테스트 완료 idqlist : " + idqlist);
		//문제의id리스트(고유값)
		ArrayList<String> testIdList = new ArrayList<String>();
		for (int i = 1; i <=todaysress.length(); i++) {
			testIdList.add(idqlist.split("@")[i]);
			System.out.println(idqlist.split("@")[i]+",");
		}
		//비교해서 값 결정//취향 번호 가져오기
		ArrayList<Integer> todaysTaste = new ArrayList<Integer>();//답변
		for (int i = 0; i < testIdList.size(); i++) {
			todaysTaste.add(service.todaysTestResult(testIdList.get(i),answerList.get(i)));
			//비교해서 값 결정
		}
		//통합테이블코드가져오기
		ArrayList<Integer> codeList = new ArrayList<Integer>();
		for(int i = 0; i < 21; i++) {//통합테이블의 코드를 가져오는 것
			codeList.add(0);
		}
		for (Integer list : todaysTaste) {
			for(int i = 0; i < 21; i++) {
				if(i + 1 == list) {
					codeList.set(i, list);
				}
			}
		}
		ArrayList<Integer> resultList = new ArrayList<Integer>();

		resultList = (ArrayList<Integer>) service.selectList(codeList);
		//술목록//술번호//오늘 추천해주는 술 목록//
		
		
		if(resultList.isEmpty()) {
			System.out.println("결과 없음");
		}else {
			
			System.out.println("셔플 전 결과: ");
			for (Integer list : resultList) {
				System.out.print(list + ",");
			}
			
			/* resultList = service.randomNum(resultList); */
			
			System.out.println("셔플 후 결과: ");
			for (Integer list : resultList) {
				System.out.print(list + ",");
			}
			Al_Info_VO al_info_VO = service.al_info_vo(resultList.get(resultList.size()-1));
			try {
				System.out.print("al_info_VO.getAl_imgpath() : " + al_info_VO.getAl_imgpath());
				model.addAttribute("vo", al_info_VO);
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("오류났어용! : todayscontroller : 취향에 맞는 술이 없음요.");
			}
			
			
			Al_Info_VO avo= fservice.al_select(al_info_VO.getAl_id());
			avo.getAl_body();
			avo.getAl_flavor();
			avo.getAl_smell();
			avo.getAl_alcohol_type();
			
			mst_codeVO cvo = fservice.mst_code(Integer.parseInt(avo.getAl_body()));
			String al_body = cvo.getMst_value();
			model.addAttribute("al_body", al_body);
			
			cvo = fservice.mst_code(Integer.parseInt(avo.getAl_flavor()));
			String al_flavor = cvo.getMst_value();
			model.addAttribute("al_flavor", al_flavor);
			
			cvo = fservice.mst_code(Integer.parseInt(avo.getAl_smell()));
			String al_smell = cvo.getMst_value();
			model.addAttribute("al_smell", al_smell);
			
			cvo = fservice.mst_code(Integer.parseInt(avo.getAl_alcohol_type()));
			String al_alcohol_type = cvo.getMst_value();
			model.addAttribute("al_alcohol_type", al_alcohol_type);
			
			
			
		}
		
		return "todays/resultlist";
	}
	
	
	
}
