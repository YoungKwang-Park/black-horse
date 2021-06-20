package com.miracle.fts.service;

import java.util.List;

import com.miracle.fts.DTO.AnswerVO;



public interface AnswerService {
	
	// 댓글조회
	public List<AnswerVO> readAnswer(int q_uid) throws Exception;
	
	 // 댓글 작성
	 public void writeAnswer(AnswerVO vo) throws Exception;

	 // 댓글 수정
	 public void updateAnswer(AnswerVO vo) throws Exception;
	 
	 // 댓글 삭제
	 public void deleteAnswer(int a_uid) throws Exception;
	 
	 // 선택된 댓글 조회
	 public AnswerVO selectAnswer(int a_uid) throws Exception;
}
