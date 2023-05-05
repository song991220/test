package com.spring.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.util.Util;
import com.spring.project.dao.CommonDao;
import com.spring.project.service.CommonService;
import com.spring.project.vo.ComcodeVo;

@Controller
public class CommonController {

	@Autowired
	CommonService commonService;

	@RequestMapping(value = "/common", method = RequestMethod.GET)
	public ModelAndView commonCodeView() {
		return new ModelAndView("common/common");
	}

	// common 페이지
	@RequestMapping(value = "/common", method = RequestMethod.POST)
	public ModelAndView commonCodeInsert(@RequestParam Map<String, Object> map) {
		commonService.insertComcode(map);
		return new ModelAndView("common/common");
	}

	// 리스트 페이지
	@RequestMapping(value = "/commonlist", method = RequestMethod.GET)
	public ModelAndView commonlist() {

		List<ComcodeVo> lists = commonService.selectCommonList();
		ModelAndView ma = new ModelAndView();
		ma.addObject("lists", lists);
		ma.setViewName("common/commonList");
		return ma;
	}

	/*
	 * // detail 페이지
	 * 
	 * @RequestMapping(value = "/commondetail", method = RequestMethod.GET) public
	 * String commonCodeDetail(Model model, String value) throws Exception { //
	 * ComcodeVo 에 담아서 값을 전송시켜줘야 속성 오류가 발생하지 않음. ComcodeVo data =
	 * commonService.detailComcode(value); model.addAttribute("data", data); return
	 * "common/commonDetail"; }
	 * 
	 */

	// detail 페이지
	@RequestMapping(value = "/commondetail", method = RequestMethod.GET)
	public ModelAndView commonCodeDetail(ComcodeVo comcodeVo) {
		Map<String, Object> data = commonService.detailComcode(comcodeVo);

		ModelAndView ma = new ModelAndView();
		ma.addObject("data", data);
		ma.setViewName("common/commonDetail");
//		System.out.println("ma : " + ma);
		return ma;
	}
	

	// Update 페이지 get

	@RequestMapping(value = "/commonmodify", method = RequestMethod.GET)
	public String commonCodeModify(ComcodeVo comcodeVo, Model model) throws Exception {
		Map<String, Object> data = commonService.detailComcode(comcodeVo);
		model.addAttribute("data", data);
		System.out.println("data : "+data);
		return "common/commonModify";

	}

	// Update 페이지 post
	@RequestMapping(value = "/commonmodify", method = RequestMethod.POST)
	public String commonCodeUpdate(ComcodeVo comcodeVo) throws Exception {
		commonService.updateComcode(comcodeVo);
		return "redirect:commonlist"; // 리스트로 리다이렉트
	}

	// detail -> delete 페이지
	@RequestMapping(value = "/commondetail", method = RequestMethod.POST)
	public String commonCodeDelete(ComcodeVo comcodeVo) throws Exception {
		commonService.deleteComcode(comcodeVo);
		return "redirect:commonlist";

	}

}