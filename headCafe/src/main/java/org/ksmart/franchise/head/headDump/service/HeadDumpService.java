package org.ksmart.franchise.head.headDump.service;

import java.util.List;

import org.ksmart.franchise.head.headDump.model.HeadDump;
import org.ksmart.franchise.head.util.Search;

public interface HeadDumpService {

	List<HeadDump> viewHeadDumpService(HeadDump headDump, Search search);

}