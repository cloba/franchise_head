package org.ksmart.franchise.head.contract.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.contract.model.ContractCommand;
import org.ksmart.franchise.head.util.Search;

public interface ContractService {
	//계약 리스트를 보여줍니다
	List<Contract> viewContractListService(Search contractSearch);
	//계약 상세내용을 보여줍니다
	Contract getContractDetailService(String contractCode);
	//계약을 수정합니다
	public void modifyContractService(ContractCommand contractCommand, HttpServletRequest request) throws Exception;
	//계약을 파기합니다
	void expireContractService(Contract contract);
	//계약을 등록합니다
	void addContractService(ContractCommand contractCommand, HttpServletRequest request) throws Exception;
	//파일 정보를 불러옵니다
	Contract getFileInfoService(String contractCode);
}
