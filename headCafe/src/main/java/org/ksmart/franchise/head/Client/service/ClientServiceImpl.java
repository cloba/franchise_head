package org.ksmart.franchise.head.Client.service;

import java.util.List;

import org.ksmart.franchise.head.Client.model.Client;
import org.ksmart.franchise.head.Client.repository.ClientDao;
import org.ksmart.franchise.head.util.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientServiceImpl implements ClientService {

	@Autowired
	private ClientDao clientDao;
	
	@Override
	public List<Client> HeadClientListService(Search search) {

		return clientDao.HeadClientList(search);
	}

}
