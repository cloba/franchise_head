package org.ksmart.franchise.head.contract.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.ksmart.franchise.head.contract.model.Contract;
import org.ksmart.franchise.head.contract.model.ContractCommand;
import org.ksmart.franchise.head.contract.repository.ContractDao;
import org.ksmart.franchise.head.util.FileUtils;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service("contractService")
public class ContractServiceImpl implements ContractService {
	
	@Autowired
	private ContractDao contractDao;
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
	
	Logger log = Logger.getLogger(this.getClass());

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
	//계약을 파기합니다 
	public void expireContractService(Contract contract) {
		log.debug("ContractServiceImpl의 expireContractService메서드 호출");		
		contract.setContractStatus(3);
		contractDao.expireContract(contract);
	}
	
	@Override
	//계약을 수정합니다
	public void modifyContractService(ContractCommand contractCommand, HttpServletRequest request) throws Exception {
		log.debug("ContractServiceImpl의 ModifyContractService메서드 호출");		
		
		//HttpServletRequest에 담겨서 서버로 전송된 Multipart형식의 데이터를 형변환 하여 담습니다
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		//request에서 파일 객체를 가져옵니다. iterator에 저장된 파일이름을 인자로 받습니다
		MultipartFile multipartFile = multipartHttpServletRequest.getFile("file");
        if(multipartFile.isEmpty() == false){
            log.debug("------------- file start -------------");
			log.debug("name : "+multipartFile.getName());
			log.debug("filename : "+multipartFile.getOriginalFilename());
			log.debug("size : "+multipartFile.getSize());
			log.debug("-------------- file end --------------\n");
        }
        
        Map<String, Object> fileMap = fileUtils.parseInsertFileInfo(request);
		contractCommand.setContractFile(fileMap);
		contractCommand.setContractStatus(3);
		contractDao.modifyContract(contractCommand);
	}

	@Override
	//계약을 추가합니다
	public void addContractService(ContractCommand contractCommand, HttpServletRequest request) throws Exception {
		log.debug("ContractServiceImpl의 addContractService메서드 호출");
		
		//HttpServletRequest에 담겨서 서버로 전송된 Multipart형식의 데이터를 형변환 하여 담습니다
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		
		//request에서 파일 객체를 가져옵니다. iterator에 저장된 파일이름을 인자로 받습니다
		MultipartFile multipartFile = multipartHttpServletRequest.getFile("file");
        if(multipartFile.isEmpty() == false){
            log.debug("------------- file start -------------");
			log.debug("name : "+multipartFile.getName());
			log.debug("filename : "+multipartFile.getOriginalFilename());
			log.debug("size : "+multipartFile.getSize());
			log.debug("-------------- file end --------------\n");
        }
  
		Map<String, Object> fileMap = fileUtils.parseInsertFileInfo(request);
		contractCommand.setContractFile(fileMap);
		contractDao.addContract(contractCommand);
	}

	@Override
	//파일정보를 불러옵니다
	public Contract getFileInfoService(String contractCode) {
		return contractDao.getFileInfo(contractCode);
	}

	
}
