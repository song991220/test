package com.spring.project.service;

import java.util.List;
import java.util.Map;

import com.spring.project.vo.ComcodeVo;

public interface CommonService {

	void insertComcode(Map<String, Object> map);

	List<ComcodeVo> selectCommonList();

	public Map<String, Object> detailComcode(ComcodeVo comcodeVo);

	public void updateComcode(ComcodeVo comcodeVo);

	public void deleteComcode(ComcodeVo comcodeVo);
}
