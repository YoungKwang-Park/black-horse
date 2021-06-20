package com.miracle.fts.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miracle.fts.DAO.ListDAO;
import com.miracle.fts.DTO.ListDTO;
import com.miracle.fts.DTO.SearchCriteria;


public interface ListService {
	
	 public List<ListDTO> select(SearchCriteria scri) throws Exception ;
		
	 public int selectCount(SearchCriteria scri) throws Exception ;
	
}
