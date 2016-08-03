package org.ksmart.franchise.head.client.service;

import java.util.List;

import org.ksmart.franchise.head.client.model.Client;
import org.ksmart.franchise.head.client.repository.ClientDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientServiceImpl implements ClientService {

	@Autowired
	private ClientDao clientDao;
	
	//
	@Override
	public List<Client> HeadClientListService(Search search) {
		System.out.println("ClientServiceImpl의 HeadClientListService메서드");
		
		return clientDao.HeadClientList(search);
	}

	@Override
	public Client headClientDetailService(String headClientCode) {
		System.out.println("ClientServiceImpl의 headClientDetailService메서드");
		
		return clientDao.HeadClientDetail(headClientCode);
	}

}
