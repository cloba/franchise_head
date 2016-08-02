package org.ksmart.franchise.head.subject.service;

import java.util.List;

import org.ksmart.franchise.head.subject.model.Subject;
import org.ksmart.franchise.head.util.Search;
import org.springframework.stereotype.Service;

@Service
public interface SubjectService {
	public List<Subject> viewSubjectListService(Search subjectSearch);
}
