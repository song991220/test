package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.dao.BoardDAO;
import com.board.domain.BoardVO;
import com.board.domain.Page;
import com.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	private BoardService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {

		List<BoardVO> list = null;
		list = service.list();
		model.addAttribute("list", list);

	}

//게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {

	}

//게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(BoardVO vo) throws Exception {
		service.write(vo);

		return "redirect:/board/list";
	}

//게시물 조회
//@RequestParam([문자열]) : 주소에 있는 특정한 값을 가져올 수 있음 
//-> 주소에서 id를 찾아 그 값을 int id에 넣어줌

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("id") int id, Model model) throws Exception {
		BoardVO vo = service.view(id);
		model.addAttribute("view", vo);
	}

//게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("id") int id, Model model) throws Exception {
		BoardVO vo = service.view(id);
		model.addAttribute("view", vo);
	}

//게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo) throws Exception {

		service.modify(vo);

		return "redirect:/board/view?id=" + vo.getId();
	}

//게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("id") int id) throws Exception {

		service.delete(id);

		return "redirect:/board/list"; // 게시물을 삭제하게되면 게시물 목록 페이지로 이동
	}

	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {

		Page page = new Page();

		page.setNum(num);
		page.setCount(service.count());

		List<BoardVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);
		/*
		 * model.addAttribute("pageNum", page.getPageNum());
		 * 
		 * model.addAttribute("startPageNum", page.getStartPageNum());
		 * model.addAttribute("endPageNum", page.getEndPageNum());
		 * 
		 * model.addAttribute("prev", page.getPrev()); model.addAttribute("next",
		 * page.getNext());
		 */

		model.addAttribute("page", page);
		model.addAttribute("select", num);

		/*
		 * // 게시물 총 갯수 int count = service.count();
		 * 
		 * // 한 페이지에 출력할 게시물 갯수 int postNum = 10;
		 * 
		 * // 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림) int pageNum = (int)
		 * Math.ceil((double) count / postNum);
		 * 
		 * // 출력할 게시물 int displayPost = (num - 1) * postNum;
		 * 
		 * /* num = 페이지 번호
		 * 
		 * 1. 게시물의 총 갯수를 구하고 2. 한 페이지당 출력할 게시물 갯수를 정하고(10개) 3. 하단에 표시할 페이징 번호의 갯수를
		 * 구하고(소수점은 올림) 4. 현재 페이지를 기준으로 10개의 데이터를 출력
		 * 
		 * 
		 * // 한번에 표시할 페이징 번호의 갯수 int pageNum_cnt = 10;
		 * 
		 * // 표시되는 페이지 번호 중 마지막 번호 int endPageNum = (int)(Math.ceil((double)num /
		 * (double)pageNum_cnt) * pageNum_cnt);
		 * 
		 * // 표시되는 페이지 번호 중 첫번째 번호 int startPageNum = endPageNum - (pageNum_cnt - 1);
		 * 
		 * // 마지막 번호 재계산 int endPageNum_tmp = (int)(Math.ceil((double)count /
		 * (double)pageNum_cnt));
		 * 
		 * if(endPageNum > endPageNum_tmp) { endPageNum = endPageNum_tmp; } /* 마지막 페이지
		 * 번호 = ((올림)(현재 페이지 번호 / 한번에 표시할 페이지 번호의 갯수)) * 한번에 표시할 페이지 번호의 갯수
		 * 
		 * 시작 페이지 = 마지막 페이지 번호 - 한번에 표시할 페이지 번호의 갯수 + 1
		 * 
		 * 
		 * boolean prev = startPageNum == 1 ? false : true; boolean next = endPageNum *
		 * pageNum_cnt >= count ? false : true;
		 * 
		 * List<BoardVO> list = null; list = service.list(); model.addAttribute("list",
		 * list);
		 * 
		 * // 시작 및 끝 번호 model.addAttribute("startPageNum", startPageNum);
		 * model.addAttribute("endPageNum", endPageNum);
		 * 
		 * // 이전 및 다음 model.addAttribute("prev", prev); model.addAttribute("next",
		 * next);
		 * 
		 * // 현재 페이지 model.addAttribute("select", num);
		 */
	}

	
	// 게시물 검색 + 페이징 추가 + 검색
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num,
			//value는 받고자할 데이터의 키, required는 해당 데이터의 필수여부, defaultValue는 만약 데이터가 들어오지 않았을 경우 대신할 기본값
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType, 
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword ) throws Exception {

		Page page = new Page();

		page.setNum(num);
		//page.setCount(service.count()); //페이징을 만들때 게시물의 갯수를 구하는 메서드
		page.setCount(service.searchCount(searchType, keyword)); //페이징을 만들때 게시물의 갯수를 구하는 메서드
		
		// 검색 타입과 검색어
		//page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<BoardVO> list = null;
		//list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

		//model.addAttribute("searchType", searchType);
		//model.addAttribute("keyword", keyword);
	}
}