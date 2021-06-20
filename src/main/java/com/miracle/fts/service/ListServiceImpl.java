package com.miracle.fts.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miracle.fts.DAO.ListDAO;
import com.miracle.fts.DTO.ListDTO;
import com.miracle.fts.DTO.SearchCriteria;

@Service
public class ListServiceImpl implements ListService{
	
	@Autowired
	private ListDAO dao;
	
	@Override
	 public List<ListDTO> select(SearchCriteria scri) throws Exception {
		return dao.select(scri);
	}
	
	@Override
	public int selectCount(SearchCriteria scri) throws Exception {
		return dao.selectCount(scri);

	}
}
