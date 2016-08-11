package org.ksmart.franchise.head.headDump.service;

import java.util.List;

import org.ksmart.franchise.head.headDump.model.HeadDump;
import org.ksmart.franchise.head.headDump.repository.HeadDumpDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HeadDumpServiceImpl implements HeadDumpService{
	
	@Autowired
	private HeadDumpDao headDumpDao;
	
	@Override
	public List<HeadDump> viewHeadDumpService(HeadDump headDump, Search search) {
		System.out.println("HeadDumpServiceImpl의 viewHeadDumpService메서드");
		return headDumpDao.viewHeadDumpList(headDump, search);
	}

}