package org.ksmart.franchise.head.contract.service;

import java.util.List;

import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.util.Search;
import org.springframework.stereotype.Service;

@Service
public interface ContractService {
	// 계약 리스트를 보여줍니다
	public List<Contract> viewContractListService(Search contractSearch);
}
