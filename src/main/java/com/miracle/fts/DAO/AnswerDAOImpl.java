package com.miracle.fts.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miracle.fts.DTO.AnswerVO;



@Repository
public class AnswerDAOImpl implements AnswerDAO {
	
	@Autowired SqlSession sql;
	
	// 댓글조회
	@Override
	public List<AnswerVO> readAnswer(int q_uid) throws Exception {
        return sql.selectList("answerMapper.readAnswer", q_uid);

    }
	
    // 댓글 작성
    @Override
    public void writeAnswer(AnswerVO vo) throws Exception {
        sql.insert("answerMapper.writeAnswer", vo);

    }
    
    // 댓글 수정
    @Override
    public void updateAnswer(AnswerVO vo) throws Exception {
        sql.update("answerMapper.updateAnswer", vo);        

    }
    
    // 댓글 삭제
    @Override
    public void deleteAnswer(int a_uid) throws Exception {
        sql.delete("answerMapper.deleteAnswer", a_uid);    

    }
    // 선택된 댓글 조회 
    @Override
    public AnswerVO selectAnswer(int a_uid) throws Exception {
        return sql.selectOne("answerMapper.selectAnswer", a_uid);

    }
	
	
}

