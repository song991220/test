package com.spring.project.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.dao.MusicDao;
import com.spring.project.service.MusicService;
import com.spring.project.vo.ComcodeVo;

@Service
public class MusicServiceImpl implements MusicService {

	@Autowired
	MusicDao dao;
	
	
	@Override
	public List<ComcodeVo> getComcodeLists() {
		// TODO Auto-generated method stub
		return dao.selectCommonCode();
	}

}
