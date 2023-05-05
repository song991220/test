package com.spring.project.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.dao.CommonDao;
import com.spring.project.service.CommonService;
import com.spring.project.vo.ComcodeVo;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	CommonDao commonDao;


	@Override
	public void insertComcode(Map<String, Object> map) {
		// TODO Auto-generated method stub
		commonDao.insertComcode(map);
	}

	@Override
	public List<ComcodeVo> selectCommonList() {
		return commonDao.selectCommonList();
	}

	@Override
	public Map<String, Object> detailComcode(ComcodeVo comcodeVo) {
		return commonDao.detail(comcodeVo);
	}

	@Override
	public void updateComcode(ComcodeVo comcodeVo) {
		// TODO Auto-generated method stub
		commonDao.update(comcodeVo);
	}
	
	@Override
	public void deleteComcode(ComcodeVo comcodeVo) {
		// TODO Auto-generated method stub
		commonDao.delete(comcodeVo);
	}

}
