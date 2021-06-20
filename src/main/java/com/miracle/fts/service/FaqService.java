package com.miracle.fts.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miracle.fts.DAO.FaqDAO;
import com.miracle.fts.DTO.FaqDTO;

@Service
public class FaqService {
	FaqDAO dao;
//	@AutoWrired
//	public void setDao(FAQDAO dao) {
//		this.dao = dao;
//	}
	
	// MyBatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession= sqlSession;
	}
	
	//	테스트 출력
	public FaqService() {
		super();
//		System.out.println("BoardService() 생성");
	}
	
	public List<FaqDTO> list(){
		// MyBatis 가 만들어준 DAO
		 dao = sqlSession.getMapper(FaqDAO.class);
		return dao.select();
	}
	
	public int write(FaqDTO dto) {
		dao = sqlSession.getMapper(FaqDAO.class);
//		return dao.insert(dto);
		
		int result = dao.insert(dto);
		System.out.println("생성된 uid는 " + dto.getUid());
		
		return result;
		
		//	return dao.insert(dto.getSubject(), dto.getContent(), dto.getName());
	}
	
//	@Transactional
	public List<FaqDTO> viewByUid(int uid) {
//		※ 사실, 트랜잭션은 여기서 발생해야한다.
//		1. 조회수 증가	:	incViewCnt()
//		2. 글 하나 읽어오기	:	selectByUid()
		
		dao = sqlSession.getMapper(FaqDAO.class);	//	MyBatis	사용
		dao.incViewCnt(uid);
		return dao.selectByUid(uid);
	}
	
	public List<FaqDTO> selectByUid(int uid) {
		dao = sqlSession.getMapper(FaqDAO.class);	//	MyBatis	사용
		return dao.selectByUid(uid);	//	1개짜리 List
	}
	
	public int update(FaqDTO dto) {
		dao = sqlSession.getMapper(FaqDAO.class); // MyBatis 사용
		//return dao.update(dto);
		return dao.update(dto.getUid(), dto);
	}
	
	public int deleteByUid(int uid) {
		dao = sqlSession.getMapper(FaqDAO.class);	//	MyBatis	사용
		return dao.deleteByUid(uid);
	}
}
