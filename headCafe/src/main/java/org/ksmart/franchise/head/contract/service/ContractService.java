package org.ksmart.franchise.head.contract.service;

import java.util.List;

import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.util.Search;

public interface ContractService {
	// 계약 리스트를 보여줍니다
	public List<Contract> viewContractListService(Search contractSearch);
	// 계약 상세내용을 보여줍니다
	public Contract getContractDetailService(String contractCode);
}
