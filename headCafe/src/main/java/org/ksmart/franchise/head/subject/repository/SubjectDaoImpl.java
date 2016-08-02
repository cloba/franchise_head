package org.ksmart.franchise.head.subject.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.subject.model.Subject;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubjectDaoImpl implements SubjectDao {

private final String NS = "org.ksmart.franchise.head.subject.repository.SubjectMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionSubject;
	
	@Override
	// subject의 리스트를 불러오는 메서드입니다
	public List<Subject> viewSubjectList(Search subjectSearch) {
		System.out.println("SubjectDaoImpl의 viewSubList 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subjectSearch", subjectSearch);
		
		return sqlSessionSubject.selectList(NS+".selectSubject", map);
	}

}
