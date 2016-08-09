package org.ksmart.franchise.head.contract.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("contractDao")
public class ContractDaoImpl implements ContractDao {
	
	private final String NS = "org.ksmart.franchise.head.contract.repository.ContractMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionContract;

	@Override
	public List<Contract> viewContractList(Search contractSearch) {
		System.out.println("ContractDaoImpl의 viewContractList 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contractSearch", contractSearch);
		
		return sqlSessionContract.selectList(NS+".selectContract", map);
	}

	@Override
	//contract하나의 상세를 봅니다
	public Contract getContractDetail(String contractCode) {
		System.out.println("ContractDaoImpl의 getContractDetail 메서드 호출");
		
		return sqlSessionContract.selectOne(NS+".selectOneContract", contractCode);
	}

	@Override
	//contract를 수정하는 메서드입니다
	public void modifyContract(Contract contract) {
		System.out.println("ContractDaoImpl의 modifyContract 메서드 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contract", contract);
		System.out.println(contract.getContractCode() +"<==== contractCode");
		
		sqlSessionContract.update(NS+".updateContract", map);		
	}

}
