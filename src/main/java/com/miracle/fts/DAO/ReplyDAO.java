package com.miracle.fts.DAO;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.miracle.fts.DTO.Criteria;
import com.miracle.fts.DTO.ReplyDTO;

@MapperScan
public interface ReplyDAO {

	// 댓글 조회 (list)
	public List<ReplyDTO> readReply(Criteria cri) throws Exception;

	// 댓글 카운팅 (countReplies)
	public int listCount() throws Exception;
  
	// 댓글 작성
	public void writeReply(ReplyDTO vo) throws Exception;
	// 댓글 삭제
	public void deleteReply(int c_uid) throws Exception;
	// 선택된 댓글 조회
	public ReplyDTO selectReply(int c_uid) throws Exception;
	

}


