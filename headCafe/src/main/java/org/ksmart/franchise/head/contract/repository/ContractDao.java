package org.ksmart.franchise.head.contract.repository;

import java.util.List;

import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.util.Search;

public interface ContractDao {
	// contract의 리스트를 불러오는 메서드입니다
		public List<Contract> viewContractList(Search contractSearch);
}
