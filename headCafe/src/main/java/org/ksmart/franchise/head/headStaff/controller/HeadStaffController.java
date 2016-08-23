package org.ksmart.franchise.head.headStaff.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.headStaff.model.HeadStaff;
import org.ksmart.franchise.head.headStaff.model.HeadStaffCommand;
import org.ksmart.franchise.head.headStaff.model.HeadStaffLogin;
import org.ksmart.franchise.head.headStaff.model.HeadStaffSearch;
import org.ksmart.franchise.head.headStaff.service.HeadStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes("login")
public class HeadStaffController {
	
	@ModelAttribute("login")
	public HeadStaffLogin headStaffLogin(){
		return new HeadStaffLogin();
	}
	
	@Autowired
	private HeadStaffService headStaffService;
	private String resignIdentify = ""; 
	Logger log = Logger.getLogger(this.getClass());
	
	//로그인 페이지로 이동 메서드
	@RequestMapping(value="/login.go")
	public String logIn(){
		
		log.debug("logIn메서드..");
		
		return "/headStaff/login";
	}
	
	
	//로그아웃 메서드
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(SessionStatus sessionStatus){
		log.debug("HeadStaffController의 logout실행");
		sessionStatus.setComplete();
		return "redirect:/";
	}
	
	//본사직원 로그인 메서드  
	@RequestMapping(value="/loginAction.go", method=RequestMethod.POST)
	public String loginStaff(Model model, @ModelAttribute HeadStaffLogin login){
		log.debug("HeadStaffController의 loginStaff실행");
		String re = null;
		String result = headStaffService.loginStaffService(login);
		
		if(result == "fail" ){
			model.addAttribute("result", "fail");
			log.debug("로그인 실패");
			re = "/headStaff/login";
		}else if(result == "success"){
			log.debug("로그인 완료");
			model.addAttribute("login", login);
			re = "/index";
		}
		return re;   //(로그인 못 했다는 메서지와 함께) 로그인창 다시보여줘야함
	}
	
	//회원가입 form을 보여주는 메서드
	@RequestMapping(value="/addHeadStaff.do", method=RequestMethod.GET)
	public String addHeadStaff(){
		log.debug("HeadStaffController의 GET 메서드");

		return "/headStaff/AddHeadStaff";
	}
	
	// 회원가입 form에서 넘어오는 데이터를 받아서 처리하는 메서드
	@RequestMapping(value="/addHeadStaff.do", method=RequestMethod.POST)
	public String addHeadStaff1(HeadStaffCommand headStaffCommand, Model model){
		//1. form에서 보낸 데이터가 담긴 headStaff 객체를 매개변수로 하는 메서드를 호출합니당
		headStaffService.addHeadStaff(headStaffCommand);
		//2. insert후에 받은 PK값이 담긴 headStaffCommand 객체를 view로 보냅니당
		model.addAttribute("headStaffCommand", headStaffCommand);
		//log.debug("headStaffId 확인: "+headStaffCommand.getHeadStaffId());
		
		return "redirect:/viewHeadStaffList.do";
	
	}
	
	
	//본사 직원리스트 보는 메서드(박종무 0722) 
	@RequestMapping(value="/viewHeadStaffList.do")
	public String ViewHeadStaffList(Model model, HeadStaffSearch headStaffSearch, HeadStaff headStaff) {
		log.debug("HeadStaffController의 ViewHeadStaffList메서드 ");
	//	log.debug("SearchHeadStaffInfo :"+headStaffSearch.getSearchHeadStaffInfo());
	//	log.debug("SearchHeadStaffKey :"+headStaffSearch.getSearchHeadStaffKey());
	//	log.debug("login:::::::::::::::"+login.toString());
		resignIdentify = "N";
		headStaff.setResignIdentify(resignIdentify);
		  
		List<Object> list =  headStaffService.headStaffListService(headStaff, headStaffSearch);
	//	log.debug("getSearchHeadStaffKey :"+headStaffSearch.getSearchHeadStaffKey());
	
	//	log.debug("list.size:"+ list.size());
	//	log.debug("ResignIdentify()"+headStaff.getResignIdentify());
		model.addAttribute("list", list);
	    
		return "/headStaff/ViewHeadStaffList";
	}
	
	  //본사 직원 디테일보는 메서드
	  @RequestMapping(value="/headStaffDetail.do", method=RequestMethod.GET)
	  public String ViewHeadStaffDetail(Model model, String headStaffId ){
		  log.debug("HeadStaffController의 ViewHeadStaffDetail메서드 ");
		  HeadStaff headStaff = headStaffService.headStaffDetail(headStaffId);
		  model.addAttribute("headStaff", headStaff);
		  
		return "/headStaff/ViewHeadStaffDetail";
	  }
	  
	  //본사직원 정보 수정 폼불러내는 메서드
	  @RequestMapping(value="/modifyFormHeadStaff.do", method=RequestMethod.GET)
	  public String ModifyFormHeadStaff(Model model, String headStaffId){
		  log.debug("HeadStaffController의 ModifyFormHeadStaff메서드 ");
		  HeadStaff headStaff =headStaffService.headStaffDetail(headStaffId); 
	//	 log.debug("headStaff.HeadStaffId"+headStaff.getHeadStaffId());
		  model.addAttribute("headStaff", headStaff);
		
		return "/headStaff/ViewHeadStaffModifyForm";
		  
	  }
	  
	  //본사직원 정보 수정 처리하는 메서드
	  @RequestMapping(value="/modifyHeadStaff.do", method=RequestMethod.POST)
	  public String ModifyHeadStaff(Model model, HeadStaff headStaff){
		  log.debug("HeadStaffController의 ModifyHeadStaff메서드 ");
		  headStaffService.modifyHeadStaff(headStaff);
		  log.debug("HeadStaffId() :"+headStaff.getHeadStaffId());
		  String headStaffId = headStaff.getHeadStaffId();
		 return "redirect:/headStaffDetail.do?headStaffId="+headStaffId;
		 		/*"/headStaffDetail?headStaffId="+headStaffId;*/
		  
	  }
	  
	  //퇴사자 조회하는 메서드
	  @RequestMapping(value="/viewResignStaffList.do", method=RequestMethod.GET)
	  public String viewResignStaffList(Model model, HeadStaffSearch headStaffSearch, HeadStaff headStaff){
		  log.debug("HeadStaffController의 viewResignStaffList메서드 ");
		  resignIdentify = "Y";
		  headStaff.setResignIdentify(resignIdentify);
		  List<Object> list =  headStaffService.headStaffListService(headStaff, headStaffSearch);
		  model.addAttribute("list", list);
	//	  log.debug(headStaff.getResignIdentify());
		  return "/headStaff/ViewHeadStaffList";
	  }
	  
	  //퇴사 등록 하는 메서드
	  @RequestMapping(value="/addResignStaff.do", method=RequestMethod.GET)
	  public String addResignStaff(Model model, HeadStaff headStaff){
		  log.debug("HeadStaffController의 addResignStaff메서드 ");
	//	  log.debug(headStaff.getHeadStaffId());
		  headStaffService.addResignStaffService(headStaff);
		  
		  return "redirect:/viewResignStaffList.do";
	  }
}