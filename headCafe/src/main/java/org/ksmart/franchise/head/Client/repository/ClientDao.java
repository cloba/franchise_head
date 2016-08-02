package org.ksmart.franchise.head.Client.repository;

import java.util.List;

import org.ksmart.franchise.head.Client.model.Client;
import org.ksmart.franchise.head.util.Search;

public interface ClientDao {
	List<Client> HeadClientList(Search search);
	
}
