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
	
	//로얄티 리스트 메서드
	@Override
	public List<Royalty> royaltyListService(Royalty Royalty, Search search) {
		System.out.println("RoyaltyServiceImpl의 RoyaltyListService ");
		
		return RoyaltyDao.RoyaltyList(Royalty, search);
	}

	
	//가장 최근에 로얄티를 지불한 월 구하는 메서드
	@Override
	public List<Royalty> currentlypaiedMonthService(Royalty royalty) {
		System.out.println("RoyaltyServiceImpl의 currentlypaiedMonth ");
		//contract 개수 받기
		String countTemp = RoyaltyDao.getContractCount();
		int count = Integer.parseInt(countTemp);
		System.out.println("count:"+count);	

		for(int i = 1; i<count+1; i++){
			
			System.out.println(i + "<--- 아이야         currentlypaiedMonthService");
			String contractCode = "contract_code"+i;
			System.out.println("null인지 아닌지: "+contractCode);
			String royaltyMonth =   RoyaltyDao.currentlypaiedMonth(contractCode);
			
			String lastMonth = royalty.getLastMonth();
			System.out.println("royaltyMonth :"+royaltyMonth);
			
			royalty.setContractCode(contractCode);
			if(royaltyMonth.equals(lastMonth)){
				System.out.println("가장 최근 지불 월이 리스트에 이미 입력되있음.");
			}else{
				System.out.println("지불리스트 입력해야함.");
				RoyaltyDao.insertRoyalty(royalty);
			}
			
		}
		
		
		
		return null;
	}

}
