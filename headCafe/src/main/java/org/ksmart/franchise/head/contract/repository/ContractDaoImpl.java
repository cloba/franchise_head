package org.ksmart.franchise.head.contract.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.contract.model.ContractCommand;
import org.ksmart.franchise.head.util.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("contractDao")
public class ContractDaoImpl implements ContractDao {
	
	private final String NS = "org.ksmart.franchise.head.contract.repository.ContractMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionContract;
	
	Logger log = Logger.getLogger(this.getClass());

	@Override
	//contract리스트를 봅니다
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
		Contract contract = sqlSessionContract.selectOne(NS+".selectOneContract", contractCode);
	//	log.debug("contract===> "+contract.toString());
		return contract;
	}

	@Override
	//계약만료 실행 메서드입니다
	public void expireContract(Contract contract) {
		System.out.println("ContractDaoImpl의 modifyContract 메서드 호출");
		sqlSessionContract.update(NS+".expireContract", contract);		
	}

	@Override
	//contract를 등록하는 메서드입니다 
	public void addContract(ContractCommand contractCommand) {
		log.debug("ContractDaoImpl의 addContract 메서드 호출");
		sqlSessionContract.insert(NS+".addContract", contractCommand);
	}

	@Override
	//파일 정보를 불러오는 메서드입니다
	public Contract getFileInfo(String contractCode) {
		log.debug("ContractDaoImpl의 getFileInfo 메서드 호출");
		return sqlSessionContract.selectOne(NS+".selectFileInfo", contractCode);
	}
	
	@Override
	//계약을 수정하는 메서드입니다
	public void modifyContract(ContractCommand contractCommand) {
		log.debug("ContractDaoImpl의 modifyContract 메서드 호출");
		sqlSessionContract.update(NS+".modifyContract", contractCommand);		
	}

}
