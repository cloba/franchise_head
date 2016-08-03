package org.ksmart.franchise.head.accounting.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.accounting.model.Accounting;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountingDaoImpl implements AccountingDao {

	//mapper주소 변수로 저장
	private final String NS = "org.ksmart.franchise.head.accounting.repository.AccountingMapper";
		
	@Autowired
	private SqlSessionTemplate sqlSessionHeadAccounting;	
	
	
	                            
	@Override
	public List<Accounting> HeadAccountingList(Search search) {
	Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return sqlSessionHeadAccounting.selectList(NS+".selectHeadAccountingList", map);
	}

}
