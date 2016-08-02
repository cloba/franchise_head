package org.ksmart.franchise.head.sub.service;

import java.util.List;

import org.ksmart.franchise.head.sub.model.Sub;
import org.ksmart.franchise.head.util.Search;

public interface SubService {
	public List<Sub> viewSubListService(Search subSearch);
}
