package com.miracle.fts.DAO;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miracle.fts.DTO.QnaVO;
import com.miracle.fts.DTO.SearchCriteria;




@Repository
public class QnaDAOImpl implements QnaDAO {

	
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 게시글 작성
	@Override
	public void write(QnaVO qnaVO) throws Exception {
		sqlSession.insert("qnaMapper.insert", qnaVO);
		
	}
	
	// 게시물 목록 조회
	
	  @Override
	  public List<QnaVO> list(SearchCriteria scri) throws Exception {
	    return sqlSession.selectList("qnaMapper.listPage", scri);

	    }
	
	
	
	// 게시물 총 갯수

	  @Override
	  public int listCount(SearchCriteria scri) throws Exception {        
	    return sqlSession.selectOne("qnaMapper.listCount", scri);

	    }
	  
	  
	
    // 게시물 조회
    @Override
    public QnaVO read(int q_uid) throws Exception {    
        return sqlSession.selectOne("qnaMapper.read", q_uid);

    }
    
	// 게시물 수정
	@Override
	public void update(QnaVO qnaVO) throws Exception {
		
		sqlSession.update("qnaMapper.update", qnaVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int q_uid) throws Exception {
		
		sqlSession.delete("qnaMapper.delete", q_uid);
	}

	
	// 조회수 증가
	@Override
	public void viewCnt(int q_uid) throws Exception {
	
		sqlSession.update("qnaMapper.viewCnt", q_uid);
	}

	
	
	
	
	
	
	
	
}
