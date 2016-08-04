package org.ksmart.franchise.head.contract.repository;

import java.util.List;

import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.util.Search;

public interface ContractDao {
	// contract의 리스트를 불러오는 메서드입니다
	public List<Contract> viewContractList(Search contractSearch);
	// contract 하나의 상세 데이터를 불러오는 메서드입니다
	public Contract getContractDetail(String contractCode);
}
