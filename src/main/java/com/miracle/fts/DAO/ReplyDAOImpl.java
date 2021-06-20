package com.miracle.fts.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miracle.fts.DTO.Criteria;
import com.miracle.fts.DTO.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Autowired SqlSession sqlSession;

	
	// 댓글 조회 select
	@Override
	public List<ReplyDTO> readReply(Criteria cri) throws Exception {
		return sqlSession.selectList("replyMapper.readReply", cri);
	}

	
	@Override
	public int listCount() throws Exception {
		return sqlSession.selectOne("replyMapper.listCount");
	}
	
	
    // 댓글 작성
    @Override
    public void writeReply(ReplyDTO vo) throws Exception {
    	sqlSession.insert("replyMapper.writeReply", vo);

    }

//	// update
//    @Override
//    public void update(ReplyDTO replyDTO) throws Exception {
//        sqlSession.update(NAMESPACE + ".update", replyDTO);
//    }

    // 댓글 삭제
    @Override
    public void deleteReply(int c_uid) throws Exception {
    	sqlSession.delete("replyMapper.deleteReply", c_uid);    

    }
    
    // 선택된 댓글 조회 
    @Override
    public ReplyDTO selectReply(int c_uid) throws Exception {
        return sqlSession.selectOne("replyMapper.selectReply", c_uid);

    }

//	public List<ReplyDTO> listPaging(Integer suid, Criteria criteria) throws Exception {
//
//		Map<String, Object> paramMap = new HashMap<>();
//		paramMap.put("suid", suid);
//		paramMap.put("criteria", criteria);
//
//		return sqlSession.selectList("reply.listPaging", paramMap);
//	}
//
//	public int countReplies(Integer suid) throws Exception {
//		return sqlSession.selectOne("reply.countReplies", suid);
//	}
//
//	public int getSuid(Integer cuid) throws Exception {
//		return sqlSession.selectOne("reply.getSuid", cuid);
//	}

}
