package com.miracle.fts.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.miracle.fts.DTO.FaqDTO;

@MapperScan
public interface FaqDAO {
	List<FaqDTO> select();
	
	// 새글작성 <-- DTO
	int insert(FaqDTO dto);
	int insert(String subject, String content,  String name);
	
	// 특정 uid 글 내용 읽기, 조회수 증가
	// viewcnt 도 1 증가 해야 하고, 읽어와야 한다. --> 트랜잭션 처리
	// List<WriteDTO> readByUid(int uid);
	
	// 특정 uid 글 내용 읽기,
	List<FaqDTO> selectByUid(int uid);
	
	// 특정 uid 글 수정 ( 제목, 내용 )
	int update(FaqDTO dto);
	
	int update(int uid, @Param("a") FaqDTO dto);
	
	// 특정 uid 글 삭제하기
	int deleteByUid(int uid);
	
	// 특정 uid 글 조회수 증가
	int incViewCnt(int uid);
	
	FaqDTO searchBySubject(String subject);
}
