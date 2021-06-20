package com.miracle.fts.service;

import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.miracle.fts.DAO.MenuDAO;
import com.miracle.fts.DAO.StoreDAO;
import com.miracle.fts.DAO.StoreFileDAO;
import com.miracle.fts.DTO.MenuDTO;
import com.miracle.fts.DTO.StoreDTO;
import com.miracle.fts.DTO.StoreFileDTO;
import com.miracle.fts.DTO.UploadFileUtils;
import com.miracle.fts.util.SessionScopeUtil;

@Service
public class StoreService {

	
	StoreDAO dao;
    StoreFileDAO storeFileDAO;
	MenuDAO menuDAO;
    
	private SqlSession sqlSession;				
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	
	// list
	public List<StoreDTO> list(){ 
		dao = sqlSession.getMapper(StoreDAO.class);
		return dao.select();
	}

	// write
//	public int write(StoreDTO dto) {
//		dao = sqlSession.getMapper(StoreDAO.class);
//		int result = dao.insert(dto);
//		return result;
//	}	
	
	@Transactional
	public int write(MultipartHttpServletRequest mprequest) {
		dao = sqlSession.getMapper(StoreDAO.class);
		storeFileDAO = sqlSession.getMapper(StoreFileDAO.class);
		menuDAO = sqlSession.getMapper(MenuDAO.class);
		
		StoreDTO dto = new StoreDTO();
		
		Integer suid;
		String sname = mprequest.getParameter("sname"); 
		String sbiznum = mprequest.getParameter("sbiznum"); 
		String saddr = mprequest.getParameter("saddr"); 
		String scomt = mprequest.getParameter("scomt");
		String sopinfo = mprequest.getParameter("sopinfo"); 
		Double slat =  Double.parseDouble(mprequest.getParameter("slat")); 
		Double slng = Double.parseDouble(mprequest.getParameter("slng"));
		String spic;
		String sthn;
//		String uid = mprequest.getParameter("uid");
		
		String uid = SessionScopeUtil.getUserId();
		// dto에 값 넣기
		dto.setSname(sname);
		dto.setSbiznum(sbiznum);
		dto.setSaddr(saddr);
		dto.setScomt(scomt);
		dto.setSopinfo(sopinfo);
		dto.setSlat(slat);
		dto.setSlng(slng);
		dto.setUid(uid);
		
		System.out.println("uid: " + uid);
		// Store의 일부 정보만 저장 
		int result = dao.insert(dto);
		// Store를 저장하면서 만들어진 seq 값을 가져옴
		suid = dto.getSuid();
		System.out.println("suid: " + suid);
		// 파일 업로드 처리
		// 파일 이름 가져오기
		Iterator<String> filenames = mprequest.getFileNames();
		// 파일 이름들을 하나씩 가져와서 파일 업로드 함수에 넣어줌
		while(filenames.hasNext()) {
			String filename = filenames.next(); // 폼의 input name
			MultipartFile file = mprequest.getFile(filename);
			String menu = "menu"; // menu0, menu1 로 이름 붙이기 위해 만듬
			MenuDTO menudto = new MenuDTO();
			if(file.getSize() != 0) {
				
				try {
					StoreFileDTO filedto = new StoreFileDTO();
					filedto = UploadFileUtils.uploadFile(file, suid, mprequest); // 물리적 파일 저장
//				System.out.println("filedto: " + 
//				filedto.getF_name()+" "+
//				filedto.getF_sname()+" "+
//				filedto.getF_thurl()+" "+
//				filedto.getF_url()+" "+
//				filedto.getS_uid()
//				);
					storeFileDAO.addFile(filedto); 		// db에 파일 정보 저장
					
					if(filename.equals("file0")) {		// 파일이 포차 사진(s_pic)에 대한 것일 때
						spic = filedto.getF_uid().toString();
//						spic = ""+filedto.getF_uid();
						dto.setSpic(spic);
						dao.update(dto);
					}else { 							// 메뉴사진(s_thn)에 대해서 넣을 때
						menu += filename.substring(4); 	// menu1, menu2
						System.out.println("filename: " + filename);
						System.out.println(menu+": " + mprequest.getParameter(menu));
						menudto.setM_name(mprequest.getParameter(menu)); 
						menudto.setS_uid(suid);
						menudto.setM_pics(filedto.getF_sname());
						menuDAO.insertMenu(menudto);	// 메뉴 정보 저장
					}
					
					result++;
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				System.out.println("파일이 비었슴");
			}
			
		}
		
		
		
		
//	    String[] files = StoreDTO.getFiles;

	    
//	        for (String fname : files)
//	            storeFileDAO.addFile(fname);
	        
	        return result;
	}	
    
		
	// view 
	public List<StoreDTO> viewBySuid(int suid){
		dao = sqlSession.getMapper(StoreDAO.class);
		return dao.selectBySuid(suid);
	}	
	
	// update
	public List<StoreDTO> selectBySuid(int suid){
		dao = sqlSession.getMapper(StoreDAO.class); 
		return dao.selectBySuid(suid); 
	}	
		
	// update
//	public int update(StoreDTO storeDTO) {
//		dao = sqlSession.getMapper(StoreDAO.class);
//		return dao.update(storeDTO);	
//	}	
	
	
	// int로 하는건 결과를 01로 넘기기 위한거였는데
	// 밑의 코드ㅇ는 어 음 files/null,아닐경우 이렇게 나눠징께
	// int가 아니고 void로 가져가야하는건가...
	
	 @Transactional
	 public int update(StoreDTO storeDTO) {
	 	Integer suid = storeDTO.getSuid();
	    String[] files = storeDTO.getFiles();

	    int result = dao.update(storeDTO);
	    storeFileDAO.deleteFiles(suid);

	    for (String fname : files)
	        storeFileDAO.replaceFile(fname, suid);
	    
	    return result;
	}
	
	
	
	// delete
//	public int deleteBySuid(Integer suid) {
//		dao = sqlSession.getMapper(StoreDAO.class);
//		return dao.deleteBySuid(suid);
//	}	
	
    @Transactional
    public int deleteBySuid(Integer suid) {
        //storeFileDAO.deleteFiles(suid);
    	dao = sqlSession.getMapper(StoreDAO.class); 
        return dao.deleteBySuid(suid);        
        
    }

    
	
	
//	
//	    public List<StoreDTO> listAll() throws Exception {
//	        return dao.listAll();
//	    }
//
//	    public List<StoreDTO> listCriteria(Criteria criteria) throws Exception {
//	        return dao.listCriteria(criteria);
//	    }
//
//	    public int countStores(Criteria criteria) throws Exception {
//	        return dao.countStores(criteria);
//	    }
//
//	    public List<StoreDTO> listSearch(SearchCriteria searchCriteria) throws Exception {
//	        return dao.listSearch(searchCriteria);
//	    }
//
//	    public int countSearchedStores(SearchCriteria searchCriteria) throws Exception {
//	        return dao.countSearchedStores(searchCriteria);
//	    }
//	
	
	
}














