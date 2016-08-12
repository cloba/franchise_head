package org.ksmart.franchise.head.contract.service;

import java.util.List;

import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.contract.model.ContractCommand;
import org.ksmart.franchise.head.contract.repository.ContractDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("contractService")
public class ContractServiceImpl implements ContractService {
	
	@Autowired
	private ContractDao contractDao;

	@Override
	public List<Contract> viewContractListService(Search contractSearch) {
		System.out.println("ContractServiceImpl의 viewContractListService메서드 호출");
		
		return contractDao.viewContractList(contractSearch);
	}

	@Override
	public Contract getContractDetailService(String contractCode) {
		System.out.println("ContractServiceImpl의 getContractDetailService메서드 호출");
		
		return contractDao.getContractDetail(contractCode);	
	}

	@Override
	//contract를 수정합니다 (계약 파기시 사용)
	public void modifyContractService(Contract contract) {
		System.out.println("ContractServiceImpl의 ModifyContractService메서드 호출");		
		contract.setContractStatus(3);
		contractDao.modifyContract(contract);
	}

	@Override
	public void addContractService(ContractCommand contractCommand) {
		System.out.println("ContractServiceImpl의 addContractService메서드 호출");		
		contractDao.addContract(contractCommand);
	}

}
