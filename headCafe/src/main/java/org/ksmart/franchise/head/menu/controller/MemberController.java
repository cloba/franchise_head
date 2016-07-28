package org.ksmart.franchise.head.menu.controller;



import org.ksmart.franchise.head.menu.model.MemberCommand;
import org.ksmart.franchise.head.menu.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class MemberController {
	
	@Autowired
	private MemberService memberService; 
	
//	 @RequestMapping(value="/loginSubStaff",method=RequestMethod.POST)
//	   public String loginSubStaff(Model model ,SubStaff subStaff){
//		   System.out.println("SubStaffController의 loginSubStaff실행");
////		   String result = "";
//		   SubStaff reSubStaff = subStaffService.loginSubStaffService(subStaff);
//		   if(reSubStaff == null){
//		   }else{
//			   model.addAttribute("subStaffLogin", reSubStaff);
//		   }
//		   return "redirect:/";
//	   }
	
	@RequestMapping(value="/loginStaff", method=RequestMethod.POST)
	public String loginStaff(Model model, MemberCommand memberCommand){
		System.out.println("MemberController의 loginStaff실행");
		
		memberService.loginStaffService(memberCommand);
		return "redirect:/";
		
	}
}
