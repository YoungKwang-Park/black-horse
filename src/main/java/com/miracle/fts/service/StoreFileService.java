package com.miracle.fts.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miracle.fts.DAO.StoreFileDAO;
import com.miracle.fts.DTO.StoreFileDTO;

@Service
public class StoreFileService {
	StoreFileDAO storeFileDAO;

	private SqlSession sqlSession;	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	// 첨부파일 목록
	
	// 첨부파일 
	public StoreFileDTO getStoreFile(Integer fuid) {
		storeFileDAO = sqlSession.getMapper(StoreFileDAO.class);
		StoreFileDTO storeFileDto =  storeFileDAO.getStoreFile(fuid);
		return storeFileDto;
	}
	// 첨부파일 목록
	public List<StoreFileDTO> getStoreFiles(Integer suid) {
		storeFileDAO = sqlSession.getMapper(StoreFileDAO.class);
		return storeFileDAO.getStoreFiles(suid);
	}
}
