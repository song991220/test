package com.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.board";

	// 게시물 목록
	@Override
	public List<BoardVO> list() throws Exception {

		return sql.selectList(namespace + ".list");
	}

	// 게시물 작성
	@Override
	public void write(BoardVO vo) throws Exception {
		sql.insert(namespace + ".write", vo);

	}

//게시물 조회
	@Override
	public BoardVO view(int id) throws Exception {
		// TODO Auto-generated method stub
		return (BoardVO) sql.selectOne(namespace + ".view", id);
	}

//게시물 수정
	@Override
	public void modify(BoardVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);

	}

//게시물 삭제
	public void delete(int id) throws Exception {
		sql.delete(namespace + ".delete", id);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return (Integer) sql.selectOne(namespace + ".count");
	}

	@Override // 게시물을 10개씩 출력하는 쿼리
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {
		HashMap data = new HashMap();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		return sql.selectList(namespace + ".listPage", data);
	}

//게시물 목록 + 페이징 + 검색
//메서드의 매개변수 -> searchType과 keyword을 받도록	
	@Override
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("searchType", searchType);
		data.put("keyword", keyword);

		return sql.selectList(namespace + ".listPageSearch", data);
	}
	
	// 게시물 총 갯수 + 검색 적용
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
	 
	 HashMap<String, Object> data = new HashMap<String, Object>();
	 
	 data.put("searchType", searchType);
	 data.put("keyword", keyword);
	 
	 return (Integer) sql.selectOne(namespace + ".searchCount", data); 
	}
}
