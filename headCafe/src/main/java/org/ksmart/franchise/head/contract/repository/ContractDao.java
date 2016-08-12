package org.ksmart.franchise.head.contract.repository;

import java.util.List;

import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.contract.model.ContractCommand;
import org.ksmart.franchise.head.util.Search;

public interface ContractDao {
	//contract의 리스트를 불러오는 메서드입니다
	List<Contract> viewContractList(Search contractSearch);
	//contract 하나의 상세 데이터를 불러오는 메서드입니다
	Contract getContractDetail(String contractCode);
	//contract를 수정하는 메서드입니다
	void modifyContract(ContractCommand contractCommand);
	//contract를 추가하는 메서드입니다
	void addContract(ContractCommand contractCommand);
	//파일 정보를 불러오는 메서드입니다
	Contract getFileInfo(String contractCode);
	//계약을 파기하는 메서드입니다
	void expireContract(Contract contract);
}

