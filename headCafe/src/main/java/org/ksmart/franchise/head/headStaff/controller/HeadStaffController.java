package org.ksmart.franchise.head.headStaff.controller;


import java.util.List;
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
@SessionAttributes("headStaffLogin")
public class HeadStaffController {
	
	@ModelAttribute("headStaffLogin")
	public HeadStaffLogin headStaffLogin(){
		return new HeadStaffLogin();
	}
	
	@Autowired
	private HeadStaffService headStaffService;
	private String resignIdentify = ""; 
	
	//로그아웃 메서드
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(SessionStatus sessionStatus){
		
		sessionStatus.setComplete();
		
		return "/home";
	}
	
	//본사직원 로그인 메서드  
	@RequestMapping(value="/loginStaff", method=RequestMethod.POST)
	public String loginStaff(Model model, @ModelAttribute HeadStaffLogin headStaffLogin){
		System.out.println("HeadStaffController의 loginStaff실행");
		headStaffService.loginStaffService(headStaffLogin);
	//	System.out.println("메서드 성공");
		
		if(headStaffLogin == null ){
			System.out.println("로그인 실패");
		}else{
			
			System.out.println("로그인 완료");
			model.addAttribute("headStaffLogin", headStaffLogin);
		}
		
	//	System.out.println("headStaff" +headStaff.getHeadStaffId());
	//	System.out.println("headStaffLogin :"+headStaffLogin.getHeadStaffId());
		return "/home";   //(로그인 못 했다는 메서지와 함께) 로그인창 다시보여줘야함
		
	}
	
	//회원가입 form을 보여주는 메서드
	@RequestMapping(value="/addHeadStaff", method=RequestMethod.GET)
	public String addHeadStaff(){
		System.out.println("HeadStaffController의 GET 메서드");

		return "/headStaff/AddHeadStaff";
	}
	
	// AddHeadStaff.jsp의 form에서 넘어오는 데이터를 받아서 처리하는 메서드
	@RequestMapping(value="/addHeadStaff", method=RequestMethod.POST)
	public String addHeadStaff1(HeadStaffCommand headStaffCommand, Model model){
		//1. form에서 보낸 데이터가 담긴 headStaff 객체를 매개변수로 하는 메서드를 호출합니당
		headStaffService.addHeadStaff(headStaffCommand);
		//2. insert후에 받은 PK값이 담긴 headStaffCommand 객체를 view로 보냅니당
		model.addAttribute("headStaffCommand", headStaffCommand);
		//System.out.println("headStaffId 확잉: "+headStaffCommand.getHeadStaffId());
		
		return "/headStaff/AddHeadStaff";
	}
	
	
	//본사 직원리스트 보는 메서드(박종무 0722) 
	@RequestMapping(value="/viewHeadStaffList", method=RequestMethod.GET)
	public String ViewHeadStaffList(Model model, HeadStaffSearch headStaffSearch, HeadStaff headStaff) {
		System.out.println("HeadStaffController의 ViewHeadStaffList메서드 ");
		System.out.println("SearchHeadStaffInfo :"+headStaffSearch.getSearchHeadStaffInfo());
		System.out.println("SearchHeadStaffKey :"+headStaffSearch.getSearchHeadStaffKey());
		resignIdentify = "N";
		headStaff.setResignIdentify(resignIdentify);
		  
		List<Object> list =  headStaffService.headStaffListService(headStaff, headStaffSearch);
		System.out.println("getSearchHeadStaffKey :"+headStaffSearch.getSearchHeadStaffKey());
	
		System.out.println("list.size:"+ list.size());
		System.out.println("ResignIdentify()"+headStaff.getResignIdentify());
		model.addAttribute("list", list);
	    
		return "/headStaff/ViewHeadStaffList";
	}
	
	  //본사 직원 디테일보는 메서드
	  @RequestMapping(value="/headStaffDetail", method=RequestMethod.GET)
	  public String ViewHeadStaffDetail(Model model, String headStaffId ){
		  System.out.println("HeadStaffController의 ViewHeadStaffDetail메서드 ");
		  HeadStaff headStaff = headStaffService.headStaffDetail(headStaffId);
		  model.addAttribute("headStaff", headStaff);
		  
		return "/headStaff/ViewHeadStaffDetail";
	  }
	  
	  //본사직원 정보 수정 폼불러내는 메서드
	  @RequestMapping(value="/modifyFormHeadStaff", method=RequestMethod.GET)
	  public String ModifyFormHeadStaff(Model model, String headStaffId){
		  System.out.println("HeadStaffController의 ModifyFormHeadStaff메서드 ");
		  HeadStaff headStaff =headStaffService.headStaffDetail(headStaffId); 
	//	  System.out.println("headStaff.HeadStaffId"+headStaff.getHeadStaffId());
		  model.addAttribute("headStaff", headStaff);
		
		return "/headStaff/ViewHeadStaffModifyForm";
		  
	  }
	  
	  //본사직원 정보 수정 처리하는 메서드
	  @RequestMapping(value="/modifyHeadStaff", method=RequestMethod.POST)
	  public String ModifyHeadStaff(Model model, HeadStaff headStaff){
		  System.out.println("HeadStaffController의 ModifyHeadStaff메서드 ");
		  headStaffService.modifyHeadStaff(headStaff);
		  System.out.println("HeadStaffId() :"+headStaff.getHeadStaffId());
		  String headStaffId = headStaff.getHeadStaffId();
		 return "redirect:/headStaffDetail?headStaffId="+headStaffId;
		 		/*"/headStaffDetail?headStaffId="+headStaffId;*/
		  
	  }
	  
	  //퇴사자 조회하는 메서드
	  @RequestMapping(value="/viewResignStaffList", method=RequestMethod.GET)
	  public String viewResignStaffList(Model model, HeadStaffSearch headStaffSearch, HeadStaff headStaff){
		  System.out.println("HeadStaffController의 viewResignStaffList메서드 ");
		  resignIdentify = "Y";
		  headStaff.setResignIdentify(resignIdentify);
		  List<Object> list =  headStaffService.headStaffListService(headStaff, headStaffSearch);
		  model.addAttribute("list", list);
		  System.out.println(headStaff.getResignIdentify());
		  return "/headStaff/ViewHeadStaffList";
	  }
	  
	  //퇴사 등록 하는 메서드
	  @RequestMapping(value="/addResignStaff", method=RequestMethod.GET)
	  public String addResignStaff(Model model, HeadStaff headStaff){
		  System.out.println("HeadStaffController의 addResignStaff메서드 ");
		  System.out.println(headStaff.getHeadStaffId());
		  headStaffService.addResignStaffService(headStaff);
		  
		  return "redirect:/viewResignStaffList";
	  }
}