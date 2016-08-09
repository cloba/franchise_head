package org.ksmart.franchise.head.subject.controller;

import java.util.List;

import org.ksmart.franchise.head.subject.model.Subject;
import org.ksmart.franchise.head.subject.service.SubjectService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectService subjectService;
	
	//계정과목 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewSubjectList")
	public String viewSubjectList(Search subjectSearch, Model model){
		System.out.println("SubjectController의 viewSubjectList 메서드 호출");

		List<Subject> subjectList = subjectService.viewSubjectListService(subjectSearch);
		model.addAttribute("subjectList",subjectList);
		model.addAttribute("subjectSearch",subjectSearch);
		
		return "/subject/viewSubjectList";
	}
	
	//계정과목을 추가하는 form으로 이동합니다
	@RequestMapping(value="/addSubject", method=RequestMethod.GET)
	public String addSubjectForm(){
		System.out.println("SubjectController의 addSubjectForm메서드 호출");
		
		return "/subject/addSubject";
	}
	
	//계정과목을 추가하는 head_item form을 제출합니다
	@RequestMapping(value="/addSubject", method=RequestMethod.POST)
	public String addSubject(Subject subject){
		System.out.println("SubjectController의 addSubject 메서드 호출");

		subjectService.addSubjectService(subject);
		
		return "redirect:/viewSubjectList";
	}
}
