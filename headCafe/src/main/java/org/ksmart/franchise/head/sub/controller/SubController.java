package org.ksmart.franchise.head.sub.controller;

import java.util.List;

import org.ksmart.franchise.head.item.model.HeadLogin;
import org.ksmart.franchise.head.item.model.Item;
import org.ksmart.franchise.head.item.model.ItemCommand;
import org.ksmart.franchise.head.sub.model.Sub;
import org.ksmart.franchise.head.sub.model.SubCommand;
import org.ksmart.franchise.head.sub.service.SubService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SubController {
	
	@Autowired
	private SubService subService;
	
	// 가맹 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewSubList")
	public String viewSubList(Search subSearch, Model model){
		System.out.println("SubController의 viewSubList 메서드 호출");

		List<Sub> subList = subService.viewSubListService(subSearch);
		model.addAttribute("subList",subList);
		model.addAttribute("subSearch",subSearch);
		
		return "/sub/viewSubList";
	}
	
	//가맹의 상세내용를 보여줍니다
	@RequestMapping(value="/viewSubDetail")
	public String viewSubDetail(String subCode, Model model){
		System.out.println("SubController의 viewSubDetail 메서드 호출");

		Sub sub= subService.getSubDetailService(subCode);
		model.addAttribute("sub", sub);
		
		return "/sub/viewSubDetail";
	}
	
	//가맹을 추가하는 form으로 이동합니다
	@RequestMapping(value="/addSub", method=RequestMethod.GET)
	public String addSubForm(){
		System.out.println("SubController의 addSubForm메서드 호출");
		
		return "/sub/addSub";
	}
	
	//가맹을 추가하는 head_item form을 제출합니다
	@RequestMapping(value="/addSub", method=RequestMethod.POST)
	public String addSub(SubCommand subCommand){
		System.out.println("SubController의 addSub 메서드 호출");

		subService.addSubService(subCommand);
		
		return "redirect:/viewSubList";
	}
	
	// 가맹정보를 수정하는 수정 form으로 이동합니다
	@RequestMapping(value="/modifySub", method=RequestMethod.GET)
	public String modifySubForm(String subCode, Model model){
		System.out.println("SubController의 modifySubForm 메서드 호출");
		
		Sub sub = subService.getSubDetailService(subCode);
		model.addAttribute(sub);
		System.out.println(sub.getSubParcelAddr()+" <========subParcelAddr");
		
		
		return "/sub/modifySub";
	}
	
	// 가맹 정보를 수정합니다
	@RequestMapping(value="/modifySub", method=RequestMethod.POST)
	public String modifyItem(SubCommand subCommand){
		System.out.println("SubController의 modifyItem 메서드 호출");
		
		subService.modifySubService(subCommand);
		
		return "redirect:/viewSubDetail?subCode="+subCommand.getSubCode();
	}
}
