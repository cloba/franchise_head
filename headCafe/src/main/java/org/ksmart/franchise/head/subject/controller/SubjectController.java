package org.ksmart.franchise.head.subject.controller;

import java.util.List;

import org.ksmart.franchise.head.subject.model.Subject;
import org.ksmart.franchise.head.subject.service.SubjectService;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectService subjectService;
	
	// 계정과목 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewSubjectList")
	public String viewSubjectList(Search subjectSearch, Model model){
		System.out.println("SubjectController의 viewSubjectList 메서드 호출");

		List<Subject> subjectList = subjectService.viewSubjectListService(subjectSearch);
		model.addAttribute("subjectList",subjectList);
		model.addAttribute("subjectSearch",subjectSearch);
		
		return "/subject/viewSubjectList";
	}
}
