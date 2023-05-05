package com.spring.project;

import static org.junit.Assert.*;

import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class TestConnection {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Test
	public void test() {
		//assertNotNull(sqlSessionTemplate);
		System.out.println(sqlSessionTemplate.hashCode());
	}

	@Test
	public void detailComcode(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> result = sqlSessionTemplate.selectOne("detailComcode", map);
//		return sqlSessionTemplate.selectOne("detailComcode", map);
		System.out.println(result);
	
}
}