package org.ksmart.franchise.head.client.service;

import java.util.List;

import org.ksmart.franchise.head.client.model.Client;
import org.ksmart.franchise.head.client.model.ClientCommand;
import org.ksmart.franchise.head.util.Search;

public interface ClientService {

	List<Client> HeadClientListService(Search search);

	Client headClientDetailService(String headClientCode);

	int addHeadClient(ClientCommand clientCommand);





}
