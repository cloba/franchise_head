package org.ksmart.franchise.head.returns.service;

import java.util.List;

import org.ksmart.franchise.head.returns.model.Returns;
import org.ksmart.franchise.head.util.Search;

public interface ReturnsService {

	List<Returns> viewReturnsListService(Returns returns, Search search);

	Returns viewReturnsDetailService(Returns returns);

}
