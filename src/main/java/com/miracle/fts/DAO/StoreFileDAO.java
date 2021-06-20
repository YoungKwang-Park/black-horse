package com.miracle.fts.DAO;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.miracle.fts.DTO.StoreFileDTO;

@MapperScan
public interface StoreFileDAO {

    // 파일 추가
    int addFile(StoreFileDTO filedto);

    // 파일 목록
    List<StoreFileDTO> getStoreFiles(Integer suid);

    // 파일 전체 삭제
    void deleteFiles(Integer suid);
    
    // 파일 삭제
    void deleteFile(String fname);

    // 파일 수정
    void replaceFile(String fname, Integer suid);

    // 파일 갯수 갱신
    void updateFileCnt(Integer suid) throws Exception;

	StoreFileDTO getStoreFile(Integer fuid);
    
    
}
