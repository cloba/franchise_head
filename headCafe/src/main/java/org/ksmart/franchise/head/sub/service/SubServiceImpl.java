package org.ksmart.franchise.head.sub.service;

import java.util.List;

import org.ksmart.franchise.head.sub.model.Sub;
import org.ksmart.franchise.head.sub.repository.SubDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubServiceImpl implements SubService {
	
	@Autowired
	private SubDao subDao;

	@Override
	//sub의 리스트를 불러오는 메서드입니다
	public List<Sub> viewSubListService(Search subSearch) {
		System.out.println("SubServiceImpl의 viewSubListService메서드 호출");
		
		return subDao.viewSubList(subSearch);
	}
}
