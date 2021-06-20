package com.miracle.fts.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miracle.fts.DAO.NoticeDAO;
import com.miracle.fts.DTO.NoticeDTO;

@Service
public class NoticeService {
	
	NoticeDAO dao;
//	@AutoWrired
//	public void setDao(NoticeDAO dao) {
//		this.dao = dao;
//	}
	
	// MyBatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession= sqlSession;
	}
	
	//	테스트 출력
	public NoticeService() {
		super();
//		System.out.println("BoardService() 생성");
	}
	
	public List<NoticeDTO> list(){
		// MyBatis 가 만들어준 DAO
		 dao = sqlSession.getMapper(NoticeDAO.class);
		return dao.select();
	}
	
	public int write(NoticeDTO dto) {
		dao = sqlSession.getMapper(NoticeDAO.class);
//		return dao.insert(dto);
		
		int result = dao.insert(dto);
		System.out.println("생성된 uid는 " + dto.getUid());
		
		return result;

	}

//	@Transactional
	public List<NoticeDTO> viewByUid(int uid) {
//		※ 사실, 트랜잭션은 여기서 발생해야한다.
//		1. 조회수 증가	:	incViewCnt()
//		2. 글 하나 읽어오기	:	selectByUid()
		
		dao = sqlSession.getMapper(NoticeDAO.class);	//	MyBatis	사용
		dao.incViewCnt(uid);
		return dao.selectByUid(uid);
	}
	
	public List<NoticeDTO> selectByUid(int uid) {
		dao = sqlSession.getMapper(NoticeDAO.class);	//	MyBatis	사용
		return dao.selectByUid(uid);	//	1개짜리 List
	}
	
	public int update(NoticeDTO dto) {
		dao = sqlSession.getMapper(NoticeDAO.class); // MyBatis 사용
		return dao.update(dto);
//		return dao.update(dto.getUid(), dto);
	}
	
	public int deleteByUid(int uid) {
		dao = sqlSession.getMapper(NoticeDAO.class);	//	MyBatis	사용
		return dao.deleteByUid(uid);
	}
}
