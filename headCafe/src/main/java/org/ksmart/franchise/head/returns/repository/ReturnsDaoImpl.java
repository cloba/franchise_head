package org.ksmart.franchise.head.returns.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.returns.model.Returns;
import org.ksmart.franchise.head.returns.model.ReturnsProcess;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReturnsDaoImpl implements ReturnsDao {
	
	private final String NS = "org.ksmart.franchise.head.returns.repository.ReturnsMapper";
	private final String NDelivey = "org.ksmart.franchise.head.delivery.repository.DeliveryMapper";
	@Autowired
	private SqlSessionTemplate sqlSessionReturns;
	@Autowired
	private SqlSessionTemplate sqlSessionDelivery;
	
	
	Logger log = Logger.getLogger(this.getClass());
	
	//반품 상품 리스트 조회 메서드
	@Override
	public List<Returns> viewReturnsList(Returns returns, Search search) {
		System.out.println("ReturnsDaoImpl의 viewReturnsList메서드");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("returns", returns);
		
		return sqlSessionReturns.selectList(NS+".selectReturnsList", map);
	}

	//반품 상품 상세 정보 조회 메서드
	@Override
	public Returns viewReturnsDetail(Returns returns) {
		System.out.println("ReturnsDaoImpl의 viewReturnsDetail메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("returns", returns);
		return sqlSessionReturns.selectOne(NS+".selectReturnDetail", map);
	}
	
	//반품상품 본사 확인 메서드
	@Override
	public int modifyReturnsApproval(ReturnsProcess returnsProcess) {
		System.out.println("ReturnsDaoImpl의 modifyReturnsApproval메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("returnsProcess", returnsProcess);
		
		return sqlSessionReturns.update(NS+".updateReturnsApproval", map);
	}

	//반품상품 배송으로 추가해주는 메서드	
	@Override
	public void addReDelivery(Returns returns) {
		log.debug("ReturnsDaoImpl의 addReDelivery메서드");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("returns", returns);
		
		sqlSessionDelivery.insert(NDelivey+".insertReDelivery", map);
		
	}

	@Override
	public List<Returns> selectReturnsGroupCode(ReturnsProcess returnsProcess) {
		log.debug("ReturnsDaoImpl의 selectReturnsGroupCode메서드");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("returnsProcess", returnsProcess);
		
		return sqlSessionReturns.selectList(NS+".selectReturnsGroupCode", map);
	}

}
