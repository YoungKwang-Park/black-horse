package com.miracle.fts.DAO;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.miracle.fts.DTO.StoreDTO;

@MapperScan
public interface StoreDAO {

	public abstract List<StoreDTO> select();
	
	// 새 가게 추가
	public abstract int insert(StoreDTO dto);
	
	// 특정 가게 정보 읽어오기
	public abstract List<StoreDTO> selectBySuid(Integer suid);
	
	// 특정 가게 정보 수정 
	public abstract int update(StoreDTO dto);

	// 특정 가게 정보 삭제	
	public abstract int deleteBySuid(Integer suid);

	
	
	
//    List<StoreDTO> listAll() throws Exception;
//	  @Override
//	    public List<StoreDTO> listAll() throws Exception {
//	        return sqlSession.selectList(NAMESPACE + ".listAll");
//	    }
	
	
	//List<StoreDTO> listPaging(int page) throws Exception;
	//
//	
//    @Override
//    public List<StoreDTO> listPaging(int page) throws Exception {
//
//        if (page <= 0) {
//            page = 1;
//        }
//
//        page = (page - 1) * 10;
//
//        return sqlSession.selectList(NAMESPACE + ".listPaging", page);
//    }

		
	//List<StoreDTO> listCriteria(Criteria criteria) throws Exception;
//	@Override
//	public List<StoreDTO> listCriteria(Criteria criteria) throws Exception {
//		return sqlSession.selectList(NAMESPACE + ".listCriteria", criteria);
//	}
	//
	//int countStores(Criteria criteria) throws Exception;
//	@Override
//	public int countStores(Criteria criteria) throws Exception {
//		return sqlSession.selectOne(NAMESPACE + ".countStores", criteria);
//	}
	//
	//List<StoreDTO> listSearch(SearchCriteria searchCriteria) throws Exception;
//	@Override
//	public List<StoreDTO> listSearch(SearchCriteria searchCriteria) throws Exception {
//		return sqlSession.selectList(NAMESPACE + ".listSearch", searchCriteria);
//	}
	//
	//int countSearchedStores(SearchCriteria searchCriteria) throws Exception;
//    @Override
//    public int countSearchedStores(SearchCriteria searchCriteria) throws Exception {
//        return sqlSession.selectOne(NAMESPACE + ".countSearchedStores", searchCriteria);
//    }
	
	
	// 댓글(후기) 갯수
	public abstract void updateReplyCnt(Integer suid, int amount);

		
//  @Override
//  public void updateReplyCnt(Integer articleNo, int amount) throws Exception {
//
//      Map<String, Object> paramMap = new HashMap<>();
//      paramMap.put("suid", suid);
//      paramMap.put("amount", amount);
//
//      sqlSession.update(NAMESPACE + ".updateReplyCnt", paramMap);
//  }

	

	
}





