package org.ksmart.franchise.head.subject.controller;

import java.util.List;

import org.apache.log4j.Logger;
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
	Logger log = Logger.getLogger(this.getClass());
	
	//계정과목 리스트를 보여줍니다 (검색포함)
	@RequestMapping(value="/viewSubjectList.do")
	public String viewSubjectList(Search subjectSearch, Model model){
		log.debug("SubjectController의 viewSubjectList 메서드 호출");
		List<Subject> subjectList = subjectService.viewSubjectListService(subjectSearch);
		model.addAttribute("subjectList",subjectList);
		model.addAttribute("subjectSearch",subjectSearch);
		
		return "/subject/viewSubjectList";
	}
	
	//계정과목을 추가하는 form으로 이동합니다
	@RequestMapping(value="/addSubject.do", method=RequestMethod.GET)
	public String addSubjectForm(){
		log.debug("SubjectController의 addSubjectForm메서드 호출");
		
		return "/subject/addSubject";
	}
	
	//계정과목을 추가하는 head_item form을 제출합니다
	@RequestMapping(value="/addSubject.do", method=RequestMethod.POST)
	public String addSubject(Subject subject){
		log.debug("SubjectController의 addSubject 메서드 호출");
		subjectService.addSubjectService(subject);
		
		return "redirect:/viewSubjectList.do";
	}
}
