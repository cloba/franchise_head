package org.ksmart.franchise.head.royalty.service;

import java.util.List;

import org.ksmart.franchise.head.royalty.model.Royalty;
import org.ksmart.franchise.head.royalty.repository.RoyaltyDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoyaltyServiceImpl implements RoyaltyService {

	@Autowired
	private RoyaltyDao RoyaltyDao;

	//로얄티 리스트 보여주는 메서드
	@Override
	public List<Royalty> currentlypaiedMonthService(Royalty royalty, Search search) {
		System.out.println("RoyaltyServiceImpl의 currentlypaiedMonthService");
		
		//현재 본사가 가맹과 계약되있는 개수 받기(contract_code 개수)
		String countTemp = RoyaltyDao.getContractCount();
		int count = Integer.parseInt(countTemp);
		System.out.println("count:"+count);	
		
		//전 가맹에 지난달의 로얄티 지불데이터가 입력 돼 있지 않다면 추가하는 메서드 
		for(int i = 1; i<count+1; i++){
			String contractCode = "contract_code"+i;   
			
			//최근 로얄티를 지불한 월 구해오기
			String royaltyMonth =   RoyaltyDao.currentlypaiedMonth(contractCode); 
			String lastMonth = royalty.getLastMonth();

			royalty.setContractCode(contractCode);
			
			//지난달과 최근 지불한 달이 다를경우 지불해야할 리스트 추가
			if(royaltyMonth.equals(lastMonth)){
				System.out.println("가장 최근 지불 월이 리스트에 이미 입력되있음.");
				
			}else{
				System.out.println("지불리스트 입력해야함.");
				RoyaltyDao.insertRoyalty(royalty);
			}
		}
		
		return RoyaltyDao.royaltyList(royalty, search);
		
	}

	@Override
	public Royalty royaltyDetailService(Royalty royalty) {
		System.out.println("RoyaltyServiceImpl의 royaltyDetailService");
		
		return RoyaltyDao.royaltyDetail(royalty);
		
		
	}

}
