package org.ksmart.franchise.head.client.repository;

import java.util.List;

import org.ksmart.franchise.head.client.model.Client;
import org.ksmart.franchise.head.util.Search;

public interface ClientDao {
	List<Client> HeadClientList(Search search);

	Client HeadClientDetail(String headClientCode);
	
}
