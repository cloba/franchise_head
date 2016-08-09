package org.ksmart.franchise.head.sub.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.sub.model.Sub;
import org.ksmart.franchise.head.sub.model.SubCommand;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("SubDao")
public class SubDaoImpl implements SubDao {
	
private final String NS = "org.ksmart.franchise.head.sub.repository.SubMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionSub;

	@Override
	public List<Sub> viewSubList(Search subSearch) {
		System.out.println("SubDaoImpl의 viewSubList 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subSearch", subSearch);
		
		return sqlSessionSub.selectList(NS+".selectSub", map);
	}

	@Override
	public Sub getSubDetail(String subCode) {
		System.out.println("SubDaoImpl의 getSubDetail 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subCode", subCode);
		
		return sqlSessionSub.selectOne(NS+".selectOneSub", map);
	}

	@Override
	public void addSub(SubCommand subCommand) {
		System.out.println("SubDaoImpl의 addSub 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sub", subCommand);
		
		sqlSessionSub.insert(NS+".insertSub", map);		
	}

	@Override
	//
	public void modifySub(SubCommand subCommand) {
		System.out.println("SubDaoImpl의 modifySub 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sub", subCommand);
		
		sqlSessionSub.update(NS+".updateSub", map);				
	}

}
