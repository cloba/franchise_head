package org.ksmart.franchise.head.headDump.repository;

import java.util.List;

import org.ksmart.franchise.head.headDump.model.HeadDump;
import org.ksmart.franchise.head.util.Search;

public interface HeadDumpDao {

	List<HeadDump> viewHeadDumpList(HeadDump headDump, Search search);

}