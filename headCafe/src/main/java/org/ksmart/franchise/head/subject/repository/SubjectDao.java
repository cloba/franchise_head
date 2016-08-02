package org.ksmart.franchise.head.subject.repository;

import java.util.List;

import org.ksmart.franchise.head.subject.model.Subject;
import org.ksmart.franchise.head.util.Search;

public interface SubjectDao {
	//subject의 리스트를 불러오는 메서드입니다
	public List<Subject> viewSubjectList(Search subjectSearch);
}
