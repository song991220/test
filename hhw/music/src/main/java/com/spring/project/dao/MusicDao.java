package com.spring.project.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.vo.ComcodeVo;

@Repository
public class MusicDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<ComcodeVo> selectCommonCode() {
		return sqlSessionTemplate.selectList("selectComCode", null);
	}
}
