package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.BoardDAO;
import com.board.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

 @Inject
 private BoardDAO dao;
 
 
 //게시물 목록
 @Override
 public List<BoardVO> list() throws Exception {

  return dao.list();
 }

 //게시물 작성
@Override
public void write(BoardVO vo) throws Exception {
		dao.write(vo);
	
}

@Override
public BoardVO view(int id) throws Exception {
	// TODO Auto-generated method stub
	return dao.view(id);
}

//게시물 수정
@Override
public void modify(BoardVO vo) throws Exception {

	dao.modify(vo);
}

//게시물 삭제
@Override
public void delete(int id) throws Exception {
	// TODO Auto-generated method stub
	 dao.delete(id);
}

@Override
public int count() throws Exception {
	// TODO Auto-generated method stub
	 return dao.count();
}

//게시물 목록 + 페이징
@Override
public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {
return dao.listPage(displayPost, postNum);
}

//게시물 목록 + 페이징 + 검색
@Override
public List<BoardVO> listPageSearch(
int displayPost, int postNum, String searchType, String keyword) throws Exception {
return  dao.listPageSearch(displayPost, postNum, searchType, keyword);
}


// 게시물 총 개수 + 검색 적용
@Override
public int searchCount(String searchType, String keyword) throws Exception {
	
	return dao.searchCount(searchType, keyword);
}
}