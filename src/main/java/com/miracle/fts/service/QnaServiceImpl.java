package com.miracle.fts.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.miracle.fts.DAO.QnaDAO;
import com.miracle.fts.DTO.QnaVO;
import com.miracle.fts.DTO.SearchCriteria;




@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO dao;

	// 게시글 작성
	@Override
	public void write(QnaVO qnaVO) throws Exception {
		dao.write(qnaVO);

	}

	// 게시물 목록 조회
	
	@Override
	public List<QnaVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);

	}
	

	// 게시물 총 갯수
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);

	}
	

	// 게시물 목록 조회
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public QnaVO read(int q_uid) throws Exception {
		dao.viewCnt(q_uid);
		return dao.read(q_uid);
	}

	@Override
	public void update(QnaVO qnaVO) throws Exception {
		dao.update(qnaVO);
	}

	@Override
	public void delete(int q_uid) throws Exception {

		dao.delete(q_uid);
	}
	

	
	
}
