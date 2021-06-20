package com.miracle.fts.DAO;

import java.util.List;

import com.miracle.fts.DTO.QnaVO;
import com.miracle.fts.DTO.SearchCriteria;



public interface QnaDAO {

	// 게시글 작성
	public void write(QnaVO qnaVO) throws Exception;
	
//게시물 목록 조회 (페이징 추가 수정)
// public List<qnaVO> list(Criteria cri) throws Exception;
	 public List<QnaVO> list(SearchCriteria scri) throws Exception;
	
	 // 게시물 총 갯수 (페이징)
//	public int listCount() throws Exception;
	 public int listCount(SearchCriteria scri) throws Exception;
	
// 게시물 조회
	public QnaVO read(int q_uid) throws Exception;
	
// 게시물 수정
	public void update(QnaVO qnaVO) throws Exception;
	
// 게시물 삭제
	public void delete(int q_uid) throws Exception;	
	
	//조회수 증가 !!!!!
		public void viewCnt(int q_uid) throws Exception;	
	
}
