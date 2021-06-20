package com.miracle.fts.DAO;

import java.util.List;

import com.miracle.fts.DTO.LoginDTO;

public interface LoginDAO {
	// 전체 SELECT
		List<LoginDTO> select();
		// 새글작성 <-- DTO
		int insert(LoginDTO dto);
//		int insert(String id, String pw,  String pw2, String name, String addr, String phone, String email);
		
		int authInsert(LoginDTO dto);
		
		// 특정 uid 글 내용 읽기, 조회수 증가
		// viewcnt 도 1 증가 해야 하고, 읽어와야 한다. --> 트랜잭션 처리
		//List<WriteDTO> readByUid(int uid);
		
		// 특정 uid 글 내용 읽기,
		List<LoginDTO> selectById(String id);
		
		// 특정 uid 글 수정 ( 제목, 내용 )
//		int update(WriteDTO dto);
		
		int update(LoginDTO dto);
		
		// 특정 uid 글 삭제하기
		int deleteById(String id);
		
		// 특정 uid 글 조회수 증가
//		int incViewCnt(String id);
		
		LoginDTO searchBySubject(String id);
		
		// 아이디 중복체크
		public int idChk(LoginDTO dto);
}
