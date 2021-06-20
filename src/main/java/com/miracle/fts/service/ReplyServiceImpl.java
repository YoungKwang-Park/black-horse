package com.miracle.fts.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miracle.fts.DAO.ReplyDAO;
import com.miracle.fts.DTO.Criteria;
import com.miracle.fts.DTO.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO dao;
	
	// 댓글조회
	@Override
	public List<ReplyDTO> readReply(Criteria cri) throws Exception {
		
		return dao.readReply(cri);
	}
	
	 public int listCount() throws Exception {
		 return dao.listCount();
	 }
    // 댓글 작성
    @Override
    public void writeReply(ReplyDTO vo) throws Exception {
        dao.writeReply(vo);

    }
    
    // 댓글 삭제
    @Override
    public void deleteReply(int c_uid) throws Exception {
        dao.deleteReply(c_uid);

    }
    
    // 선택된 댓글 조회
    @Override
    public ReplyDTO selectReply(int c_uid) throws Exception {
        return dao.selectReply(c_uid);

    }


}
