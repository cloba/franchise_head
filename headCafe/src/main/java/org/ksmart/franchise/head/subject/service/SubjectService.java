package org.ksmart.franchise.head.subject.service;

import java.util.List;

import org.ksmart.franchise.head.subject.model.Subject;
import org.ksmart.franchise.head.util.Search;
import org.springframework.stereotype.Service;

@Service
public interface SubjectService {
	//계정과목 리스트를 보여주는 메서드
	public List<Subject> viewSubjectListService(Search subjectSearch);
	//계정과목을 추가하는 메서드
	public void addSubjectService(Subject subject);
}
