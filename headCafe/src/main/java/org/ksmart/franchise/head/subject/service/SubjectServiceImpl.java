package org.ksmart.franchise.head.subject.service;

import java.util.List;

import org.ksmart.franchise.head.subject.model.Subject;
import org.ksmart.franchise.head.subject.repository.SubjectDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubjectServiceImpl implements SubjectService {
	
	@Autowired
	private SubjectDao subjectDao;

	@Override
	public List<Subject> viewSubjectListService(Search subjectSearch) {
		System.out.println("SubjectServiceImpl의 viewSubjectListService메서드 호출");
		
		return subjectDao.viewSubjectList(subjectSearch);
	}

	@Override
	//계정과목을 추가하는 메서드
	public void addSubjectService(Subject subject) {
		System.out.println("SubjectServiceImpl의 addSubjectService메서드 호출");
		
		subjectDao.addSubject(subject);
	}

}
