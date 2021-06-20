package com.miracle.fts.DAO;

import java.util.List;

import com.miracle.fts.DTO.ListDTO;
import com.miracle.fts.DTO.SearchCriteria;

public interface ListDAO {
	
	 public List<ListDTO> select(SearchCriteria scri) throws Exception ;
	
	 public int selectCount(SearchCriteria scri) throws Exception ;
}
