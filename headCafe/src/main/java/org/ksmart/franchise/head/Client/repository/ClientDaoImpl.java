package org.ksmart.franchise.head.Client.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.Client.model.Client;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientDaoImpl implements ClientDao {

	//mapper주소 변수로 저장
	private final String NS = "org.ksmart.franchise.head.Client.repository.ClientMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionHeadStaff;
	
	@Override
	public List<Client> HeadClientList(Search search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return sqlSessionHeadStaff.selectList(NS+".selectHeadClient", map);
	}

}
