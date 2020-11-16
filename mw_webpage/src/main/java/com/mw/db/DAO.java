package com.mw.db;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


public class DAO {

	private SqlSessionTemplate sqlSessionTemplate;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
// DB 처리 ↓↓↓
	
	// 아이디 중복 체크
	public int getIdChk(String m_id) throws Exception {
		int idChkRes = 0;
		idChkRes = sqlSessionTemplate.selectOne("kakaoIdChk", m_id);
		return idChkRes;
	}
	
	// 카카오 회원가입
	public void getkakaoMemberAdd(MVO mvo) throws Exception {
		sqlSessionTemplate.insert("kakaoAdd", mvo);
	}
	
	// 카카오 로그인
	public MVO getKakaoLogin(String m_id) throws Exception {
		MVO login_id = null;
		login_id = sqlSessionTemplate.selectOne("kakaoLogin", m_id);
		return login_id;
	}
	
	// 관리자 페이지 - 전체 게시물 수
	public int getTotalCount() throws Exception {
		int res = 0;
		res = sqlSessionTemplate.selectOne("totalCount");		
		return res;
	}
	
	// 관리자 페이지 - 게시물 리스트
	public List<SVO> getList(int begin, int end) throws Exception {
		List<SVO> list = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		
		list = sqlSessionTemplate.selectList("adminList", map);		
		return list;
	}
	
	// 관리자 페이지 - 가게 추가
	public int getWriteStore(SVO svo) throws Exception {
		int result = 0;
		result = sqlSessionTemplate.insert("adminWrite", svo);
		return result;
	}
	
	// 관리자 페이지 - 가게 상세 정보
	public SVO getAdminOnelist(String s_idx) throws Exception {
		SVO svo = null;
		svo = sqlSessionTemplate.selectOne("adminOnelist", s_idx);
		return svo;
	}
	
	// 관리자 페이지 - 가게 정보 업데이트
	public int getUpdateStore(SVO svo) {
		int result = 0;
		result = sqlSessionTemplate.update("adminUpdate", svo);
		return result;
	}
	
	// 관리자 페이지 - 가게 정보 삭제
	public void getDeleteStore(String s_idx) {
		sqlSessionTemplate.delete("adminDelete", s_idx);
	}
	
	// 메인 페이지 - 인기 리스트
	public List<SVO> getHotList() {
		List<SVO> list = null;
		list = sqlSessionTemplate.selectList("hotList");
		return list;
	}
	
	// 검색어
	public List<SVO> getSearchResult(String keyWord) throws Exception {
		List<SVO> list = null;
		list = sqlSessionTemplate.selectList("search", keyWord);
		return list;
	}
	
	// 카테고리 > 먹을거리
	public List<SVO> getEat() throws Exception {
		List<SVO> list = null;
		list = sqlSessionTemplate.selectList("getEat");
		return list;
	}
	
	// 카테고리 > 마실거리
	public List<SVO> getDrink() throws Exception {
		List<SVO> list = null;
		list = sqlSessionTemplate.selectList("getDrink");
		return list;
	}
	
	// 카테고리 > 즐길거리
	public List<SVO> getPlay() throws Exception {
		List<SVO> list = null;
		list = sqlSessionTemplate.selectList("getPlay");
		return list;
	}
	
	// 카테고리 > 하위 카테고리
	public List<SVO> getSmall(String cat) throws Exception {
		List<SVO> list = null;
		list = sqlSessionTemplate.selectList("getSmall", cat);
		return list;
	}
	
	// 가게 접속 시 조회수 업데이트
	public void getViewUpdate(String s_idx) throws Exception {
		sqlSessionTemplate.update("viewUpdate", s_idx);
	}
	
	// 가게 상세
	public SVO getStoreInfo(String store_idx) {
		SVO svo = null;
		svo = sqlSessionTemplate.selectOne("storeInfo", store_idx);
		return svo;
	}
	
	// 가게 좋아요
	public void getLikeUpdate(String s_idx) throws Exception {
		sqlSessionTemplate.update("likeUpdate", s_idx);
	}
	
	
}
