package com.miracle.fts.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.miracle.fts.DAO.LoginDAO;
import com.miracle.fts.DTO.LoginDTO;

@Service
public class LoginService {
	LoginDAO dao;
//	@Autowired
//	public void setDao(WriteDAO dao) {
//		this.dao = dao;
//	}
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	// MyBatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 테스트 출력
	public LoginService() {
		super();
//		System.out.println("LoginService() 생성");
	}
	
	public List<LoginDTO> list(){
		// MyBatis 가 만들어준 DAO
		dao = sqlSession.getMapper(LoginDAO.class);
		return dao.select();
	}
	
	public int write(LoginDTO dto) {
		dao = sqlSession.getMapper(LoginDAO.class);
		//return dao.insert(dto);
		dto.setPw(pwdEncoder.encode(dto.getPw()));
		int result = dao.insert(dto);
		result = dao.authInsert(dto);
//		System.out.println("생성된 id 는 " + dto.getId());
		
		return  result;
		
		//return dao.insert(dto.getSubject(), dto.getContent(), dto.getName());
	}
	//아이디 중복체크
	//public WriteDTO idCheck(String id) throws Exception;
	
	// 아이디 중복 체크
	
	public int idChk(LoginDTO dto)  {
		dao = sqlSession.getMapper(LoginDAO.class);
		return dao.idChk(dto);
	}
	
	
  	// 아이디 중복 체크
   	
   
	//아이디 중복 체크
//	@Override
//	public int idChk(WriteDTO dto) throws Exception {
//		int result = sql.selectOne("WriteDAO.idChk", dto);
//		return result;
//	}
	//@Transactional
	public List<LoginDTO> viewById(String id){
		// ※사실, 트랜잭션은 여기서 발생해야 한다.
		//  1. 조회수 증가    :   incViewCnt()
		//  2. 글 하나 읽어오기 :  selectByUid()
		
		dao = sqlSession.getMapper(LoginDAO.class); // MyBatis 사용
//		dao.incViewCnt(id);
		return dao.selectById(id);
	}
	
	public List<LoginDTO> selectById(String id) {
		dao = sqlSession.getMapper(LoginDAO.class); // MyBatis 사용
		return dao.selectById(id);  // 1개짜리 List
	}
	
	public int update(LoginDTO dto) {
		dao = sqlSession.getMapper(LoginDAO.class); // MyBatis 사용
		dto.setPw(pwdEncoder.encode(dto.getPw()));
		//return dao.update(dto);
		return dao.update(dto);
	}
	
	public int deleteById(String id) {
		dao = sqlSession.getMapper(LoginDAO.class); // MyBatis 사용
		return dao.deleteById(id);				
	}
}
