package org.ksmart.franchise.head.returns.repository;

import java.util.List;

import org.ksmart.franchise.head.returns.model.Returns;
import org.ksmart.franchise.head.returns.model.ReturnsProcess;
import org.ksmart.franchise.head.util.Search;

public interface ReturnsDao {

	List<Returns> viewReturnsList(Returns returns, Search search);

	Returns viewReturnsDetail(Returns returns);

	int modifyReturnsApproval(ReturnsProcess returnsProcess);

	void addReDelivery(Returns returns);

	List<Returns> selectReturnsGroupCode(ReturnsProcess returnsProcess);

}
