package com.miracle.fts.service;

import java.util.List;

import com.miracle.fts.DTO.Criteria;
import com.miracle.fts.DTO.ReplyDTO;

public interface ReplyService {
		
		//조회
		public List<ReplyDTO> readReply(Criteria cri) throws Exception;
	    
	    // 댓글 작성
	    public void writeReply(ReplyDTO vo) throws Exception;
	    
	   // 댓글 삭제
	    public void deleteReply(int c_uid) throws Exception;
	    
	    // 선택된 댓글 조회
	    public ReplyDTO selectReply(int c_uid) throws Exception;
	    
	    // 댓글 총 갯수
	    public int listCount() throws Exception;
	}


