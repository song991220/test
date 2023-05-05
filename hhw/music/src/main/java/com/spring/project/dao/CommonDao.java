package com.spring.project.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.cj.log.Log;
import com.spring.project.vo.ComcodeVo;

@Repository
public class CommonDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// sql 경로를 설정
	private static String namespace = "music";

	public void insertComcode(Map<String, Object> map) {
		sqlSessionTemplate.insert("insertComcode", map);
	}

	public List<ComcodeVo> selectCommonList() {
		// sqlSessionTemplate -> mybatis 를 이용하여 "selectComcode"라는 이름을 매칭해주는 것
		return sqlSessionTemplate.selectList("selectComcode");
	}

	public Map<String, Object> detail(ComcodeVo comcodeVo) {
//		System.out.println(groupcd +" : "+ code);
//		System.out.println("detail : "+sqlSessionTemplate.selectOne(namespace +".detail", comcodeVo));
//		System.out.println(comcodeVo.getGroupcd()+" : "+comcodeVo.getCode());
		return sqlSessionTemplate.selectOne(namespace +".detail", comcodeVo);
//		return null;
	}

	public void update(ComcodeVo comcodeVo) {
		System.out.println("확인값 : "+namespace+".update"+", vo : "+comcodeVo);
		
		sqlSessionTemplate.update(namespace + ".update", comcodeVo);
	}

	public void delete(ComcodeVo comcodeVo) {
		Object obj = sqlSessionTemplate.selectOne(namespace + ".delete", comcodeVo);
		System.out.println(namespace+".delete"+", vo : "+comcodeVo);
		System.out.println(obj);
		sqlSessionTemplate.update(namespace+".delete", comcodeVo);
		
	}

}
