package com.petFinder.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.petFinder.domain.ComCodeVO;

@Mapper
public interface RestComSelectBoxMapper {

	/* SELECT - �ڵ� ��ȸ */
	List<ComCodeVO> selectCoedStrList(String codeM);

	
}
