package com.spring.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project.dao.MusicDao;
import com.spring.project.service.MusicService;
import com.spring.project.vo.ComcodeVo;

@Controller
public class MusicController {

	@Autowired
	MusicService musicService;
	
	@RequestMapping(value =  "/create", method = RequestMethod.GET)
	public ModelAndView createView() {
		return new ModelAndView("music/create");
	}
	
	/**
	 * 패스워드 검사  패스워드 확인데이터
	 * 아이디가 이메일 형식인지 검사, 글자길이등....
	 * 화면에 대한 데이터의 유효성 검증	 
	 * @param map
	 * @return
	 */
	@RequestMapping(value =  "/create", method = RequestMethod.POST)
	public ModelAndView createInsert (@RequestParam Map<String,Object> map) {
		// 잘 가져왔는지 확인.
//		System.out.println(map);
		List<ComcodeVo> lists = musicService.getComcodeLists();
		for (ComcodeVo comcodeVo : lists) {
			System.out.println(comcodeVo);
		}
		return new ModelAndView("music/create");
	}
}
