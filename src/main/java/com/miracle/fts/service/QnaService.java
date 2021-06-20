package com.miracle.fts.service;

import java.util.List;

import com.miracle.fts.DTO.QnaVO;
import com.miracle.fts.DTO.SearchCriteria;



public interface QnaService {

		
		// 게시글 작성
			public void write(QnaVO qnaVO) throws Exception;
			
		// 게시물 목록 조회
//			public List<QnaVO> list(Criteria cri) throws Exception;
			public List<QnaVO> list(SearchCriteria scri) throws Exception;
			
		// 게시글 총 갯수
//			public int listCount() throws Exception;
			public int listCount(SearchCriteria scri) throws Exception;
			
		// 게시물 조회	
			public QnaVO read(int q_uid) throws Exception;
			
		// 게시물 수정
			public void update(QnaVO qnaVO) throws Exception;
			
		// 게시물 삭제
			public void delete(int q_uid) throws Exception;	
	}