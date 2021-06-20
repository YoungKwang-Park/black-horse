package com.miracle.fts.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miracle.fts.DAO.AnswerDAO;
import com.miracle.fts.DTO.AnswerVO;



@Service
public class AnswerServiceImpl implements AnswerService {
	
	@Autowired
	private AnswerDAO dao;
	
	// 댓글조회
	@Override
	public List<AnswerVO> readAnswer(int q_uid) throws Exception {
		return dao.readAnswer(q_uid);
	}
	
    // 댓글 작성
    @Override
    public void writeAnswer(AnswerVO vo) throws Exception {
        dao.writeAnswer(vo);

    }
    
    // 댓글 수정
    @Override
    public void updateAnswer(AnswerVO vo) throws Exception {
        dao.updateAnswer(vo);
    }

    // 댓글 삭제
    @Override
    public void deleteAnswer(int a_uid) throws Exception {
        dao.deleteAnswer(a_uid);

    }
    
    // 선택된 댓글 조회
    @Override
    public AnswerVO selectAnswer(int a_uid) throws Exception {
        return dao.selectAnswer(a_uid);

    }


}
