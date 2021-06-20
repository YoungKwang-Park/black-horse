package com.miracle.fts.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miracle.fts.DTO.ListDTO;
import com.miracle.fts.DTO.SearchCriteria;

@Repository
public class ListDAOImpl implements ListDAO {
	
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	 public List<ListDTO> select(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("listMapper.select",scri);
	 }
		
	 public int selectCount(SearchCriteria scri) throws Exception{
		 return sqlSession.selectOne("listMapper.selectCount",scri);
	 }
	 
}
