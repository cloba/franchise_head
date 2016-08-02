package org.ksmart.franchise.head.client.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.client.model.Client;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientDaoImpl implements ClientDao {

	//mapper주소 변수로 저장
	private final String NS = "org.ksmart.franchise.head.client.repository.ClientMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionHeadClient;
	
	//본사거래처 리스트 조회 하는 메서드
	@Override
	public List<Client> HeadClientList(Search search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return sqlSessionHeadClient.selectList(NS+".selectHeadClientList", map);
	}
	//본사 거래처 상세정보 조회 하는 메서드
	@Override
	public Client HeadClientDetail(String headClientCode) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("headClientCode", headClientCode);
		return sqlSessionHeadClient.selectOne(NS+".selectHeadClientdetail", map);
	}

}
