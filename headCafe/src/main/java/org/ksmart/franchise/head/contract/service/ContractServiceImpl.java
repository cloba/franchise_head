package org.ksmart.franchise.head.contract.service;

import java.util.List;

import org.ksmart.franchise.head.contract.model.Contract;
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

}
