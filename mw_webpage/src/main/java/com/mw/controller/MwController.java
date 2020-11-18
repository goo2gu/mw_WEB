package com.mw.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mw.db.DAO;
import com.mw.db.MVO;
import com.mw.db.QVO;
import com.mw.db.SVO;
import com.mw.model.Paging;

@Controller
public class MwController {
	
	@Autowired
	private DAO dao;
	public void setDao(DAO dao) {this.dao = dao;}
	
	@Inject
	Paging paging;
	public void setPaging(Paging paging) { this.paging = paging; }

	String cPage;
	
// 메인
	
	// 메인 페이지 이동
	@RequestMapping("main.do")
	public ModelAndView mainCommand() {
		ModelAndView mv = new ModelAndView("main");
		// 인기 리스트 처리
		List<SVO> hotList = dao.getHotList();
		mv.addObject("hotList", hotList);
		return mv;
	}
	
	// 검색
	@RequestMapping("search.do")
	public ModelAndView searchCommand(@RequestParam("keyWord") String keyWord) {
		ModelAndView mv = new ModelAndView("search_res");
		try {
			mv.addObject("keyWord", keyWord);
			// 검색 결과에 해당되는 아이템 리스트 가져오기
			List<SVO> list = dao.getSearchResult(keyWord);
			mv.addObject("store_list", list);
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	// 모바일용 서브메뉴 페이지
	@RequestMapping("submenu_mobile.do")
	public ModelAndView submenuMobileCommand() {
		return new ModelAndView("submenu_mobile");
	}
	
// 명월 소개
	
	@RequestMapping("mw_info.do")
	public ModelAndView mwInfoCommand() {
		return new ModelAndView("mw_info");
	}
	
// 가게 찾기

	// 모바일용 검색 전용 페이지
	@RequestMapping("search_main.do")
	public ModelAndView searchMainCommand() {
		return new ModelAndView("search_main");
	}
	
	// 카테고리 > 먹을거리
	@RequestMapping("category_eat.do")
	public ModelAndView categoryEatCommand(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("category_eat");
		String cat = request.getParameter("cat");
		try {
			if (cat.equals("먹을거리")) {
				List<SVO> list = dao.getEat();
				mv.addObject("list", list);
			} else {
				List<SVO> list = dao.getSmall(cat);
				mv.addObject("list", list);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		mv.addObject("category", cat);
		return mv;
	}
		
	// 카테고리 > 마실거리
	@RequestMapping("category_drink.do")
	public ModelAndView categoryDrinkCommand(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("category_drink");
		String cat = request.getParameter("cat");
		try {
			if (cat.equals("마실거리")) {
				List<SVO> list = dao.getDrink();
				mv.addObject("list", list);
			} else {
				List<SVO> list = dao.getSmall(cat);
				mv.addObject("list", list);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		mv.addObject("category", cat);
		return mv;
	}
		
	// 카테고리 > 즐길거리
	@RequestMapping("category_play.do")
	public ModelAndView categoryPlayCommand(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("category_play");
		String cat = request.getParameter("cat");
		try {
			if (cat.equals("즐길거리")) {
				List<SVO> list = dao.getPlay();
				mv.addObject("list", list);
			} else {
				List<SVO> list = dao.getSmall(cat);
				mv.addObject("list", list);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		mv.addObject("category", cat);
		return mv;
	}
	
	// 가게 상세
	@RequestMapping("store_detail.do")
	public ModelAndView storeDetailCommand(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("store_detail");
		String s_idx = request.getParameter("s_idx");
		try {
			// 조회수 업데이트
			dao.getViewUpdate(s_idx);
			// 가게 정보 받기
			SVO svo = dao.getStoreInfo(s_idx);
			// 가게 정보 session 에 저장
			request.getSession().setAttribute("svo", svo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
		
	// 좋아요 버튼 처리
	@RequestMapping("add_store_like.do")
	public ModelAndView addStoreLikeCommand(HttpServletRequest request) {
		String s_idx = request.getParameter("s_idx");
		ModelAndView mv = null;
		try {
			dao.getLikeUpdate(s_idx);
			mv = new ModelAndView("redirect:store_detail.do");
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
// 문의하기
	
	// 문의 화면 이동
	@RequestMapping("qna.do")
	public ModelAndView qnaCommand(HttpServletRequest request) {
		ModelAndView mv = null;
		try {
			String loginCheck = (String) request.getSession().getAttribute("login");
			System.out.println("로그인 상태 : " + loginCheck);
			// 로그인 상태 체크
			if (loginCheck == "ok") {
				// 1. 로그인 > 문의 화면 이동
				MVO mvo = (MVO) request.getSession().getAttribute("mvo");
				String m_idx = mvo.getM_idx();
				List<QVO> q_list = dao.getQlist(m_idx);
				
				mv = new ModelAndView("qna");
				mv.addObject("q_list", q_list);
				return mv;
			} else {
				// 2. 비로그인 > 로그인 화면 이동
				mv = new ModelAndView("user_login");
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 문의 > 문의 작성
	@RequestMapping("qna_write.do")
	public ModelAndView qnaWriteCommand(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("qna_write");
		MVO mvo = (MVO) request.getSession().getAttribute("mvo");
		String m_idx = mvo.getM_idx();
		mv.addObject("m_idx", m_idx);
		return mv;
	}
	
	// 문의 > 문의 작성 > DB 처리
	@RequestMapping("qna_writeOk")
	public ModelAndView qnaWriteOkCommand(HttpServletRequest request, QVO qvo) {
		ModelAndView mv = new ModelAndView("redirect:qna.do");
		try {
			// q_group 값 생성
			String m_idx = qvo.getM_idx();
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd_HHmmss");
			String now = date.format(cal.getTime());
			String q_group = m_idx + now;
			System.out.println("q_group : " + q_group);
			qvo.setQ_group(q_group);
			// DB 저장
			dao.getQnaWrite(qvo);
			System.out.println("문의 작성 완료.");
		} catch (Exception e) {
			System.out.println("error occured at qna_writeOk : "+e);
		}
		return mv;
	}
	
	// 문의 > 문의 상세
	@RequestMapping("qna_onelist.do")
	public ModelAndView qnaOnelistCommand(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("qna_onelist");
		String q_group = request.getParameter("q_group");
		try {
			List<QVO> qvo = dao.getQnaOnelist(q_group);
			if (qvo != null) {
				mv.addObject("qvo", qvo);
			}
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
// 내정보
	
	// 로그인 화면 이동
	@RequestMapping("login.do")
	public ModelAndView loginCommand(HttpServletRequest request) {
		ModelAndView mv = null;
		try {
			String loginCheck = (String) request.getSession().getAttribute("login");
			System.out.println("로그인 상태 : " + loginCheck);
			// 로그인 상태 체크
			if (loginCheck == "ok") {
				// 1. 로그인된 경우 > 내정보
				return new ModelAndView("user_info");
			} else {
				// 2. 로그인
				return new ModelAndView("user_login");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 내정보
	@RequestMapping("user_info.do")
	public ModelAndView userInfoCommand(HttpServletRequest request, HttpSession session) {
		return new ModelAndView("user_info");
	}
	
	// 내정보 > 정보 수정
	@RequestMapping("user_update.do")
	public ModelAndView userInfoUpdateCommand() {
		return new ModelAndView("user_update");
	}
	
	// 내정보 > 좋아요
	@RequestMapping("user_like.do")
	public ModelAndView userLikeCommand() {
		return new ModelAndView("user_like");
	}
	
	// 내정보 > 내 리뷰
	@RequestMapping("user_review.do")
	public ModelAndView userReviewCommand() {
		return new ModelAndView("user_review");
	}
	
// 관리자 페이지	

	// 관리자 페이지
	@RequestMapping("admin.do")
	public ModelAndView adminCommand(HttpServletRequest request) {
		return new ModelAndView("admin");
	}
	
	// 관리자 페이지 > 가게 관리
	@RequestMapping("admin_store.do")
	public ModelAndView adminStoreCommand(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_store");
		try {
			// 전체 게시물 수 (totalRecord)
			int count = dao.getStoreTotal();
			paging.setTotalRecord(count);
			// 전체 페이지 수 (totalPage)
			if (paging.getTotalRecord() <= paging.getNumPerPage()) {
				paging.setTotalPage(1);
			} else {
				paging.setTotalPage(paging.getTotalRecord()/paging.getNumPerPage());
				if (paging.getTotalRecord() % paging.getNumPerPage()!=0) {
					paging.setTotalPage(paging.getTotalPage()+1);
				}
			}
			// 현재 페이지 구하기 (nowPage)
			cPage = request.getParameter("cPage");
			if (cPage == null) {
				paging.setNowPage(1);
			} else {
				paging.setNowPage(Integer.parseInt(cPage));
			}
			mv.addObject("cPage", cPage);
			// 시작 번호 (begin), 끝 번호 (end)
			paging.setBegin((paging.getNowPage()-1) * paging.getNumPerPage()+1);
			paging.setEnd((paging.getBegin()-1) + paging.getNumPerPage());
			// 가게 리스트
			List<SVO> list = dao.getList(paging.getBegin(), paging.getEnd());
			// 시작 블록 (beginBlock), 끝 블록 (endBlock)
			paging.setBeginBlock(
					(int)((paging.getNowPage()-1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
			paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock()-1);
			// 블록 처리 >> endBlock 이 totalPage 보다 큰 경우,
			if (paging.getEndBlock() > paging.getTotalPage()) {
				paging.setEndBlock(paging.getTotalPage());
			}
			mv.addObject("list", list);
			mv.addObject("paging", paging);
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}

	// 관리자 페이지 > 가게 관리 > 가게 추가
	@RequestMapping("adminStoreAdd.do")
	public ModelAndView adminStoreAddCommand(HttpServletRequest request) {
		return new ModelAndView("admin_store_add");
	}
	
	// 관리자 페이지 > 가게 관리 > 가게 추가 > DB
	@RequestMapping(value = "storeAddOk.do", method = RequestMethod.POST)
	public ModelAndView adminStoreAddOkCommand(HttpServletRequest request, SVO svo) {
		ModelAndView mv = new ModelAndView("redirect:admin_store.do");
		try {
			// 파일 이름 처리
			String path = request.getSession().getServletContext().getRealPath("/resources/images");
			MultipartFile file = svo.getFile();
			if (file.isEmpty()) {
				svo.setS_img("");
			} else {
				svo.setS_img(svo.getFile().getOriginalFilename());
			}
			// 큰 카테고리 처리
			String catInput = svo.getS_cat_s();
			if (catInput.equals("술집") || catInput.equals("카페")) {
				svo.setS_cat_b("마실거리");
			} else if (catInput.equals("PC방")||catInput.equals("노래방")||catInput.equals("스포츠")||catInput.equals("기타")) {
				svo.setS_cat_b("즐길거리");
			} else {
				svo.setS_cat_b("먹을거리");
			}
			// DB 처리
			int result = dao.getWriteStore(svo);
			// DB 처리 성공 여부에 따른 이미지 처리
			if (result > 0) {
				try {
					file.transferTo(new File(path + "/" + svo.getS_img()));
				} catch (IllegalStateException e) {
					System.out.println(e);
				} catch (IOException e) {
					System.out.println(e);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	// 관리자 페이지 > 가게 관리 > 가게 상세 정보
	@RequestMapping("admin_store_onelist.do")
	public ModelAndView adminStoreOneelistCommand(HttpServletRequest request, @RequestParam("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("admin_store_onelist");
		String s_idx = request.getParameter("s_idx");
		try {
			SVO svo = dao.getAdminOnelist(s_idx);
			// 가게 정보 및 cPage 정보 session 에 저장
			request.getSession().setAttribute("svo", svo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	// 관리자 페이지 > 가게 관리 > 가게 상세 정보 > 정보 수정
	@RequestMapping("admin_store_update.do")
	public ModelAndView adminStoreUpdateCommand(HttpServletRequest request, @RequestParam("cPage")String cPage) {
		return new ModelAndView("admin_store_update");
	}
	
	// 관리자 페이지 > 가게 관리 > 가게 상세 정보 > 정보 수정 > DB 처리
	@RequestMapping("store_update_ok.do")
	public ModelAndView adminStoreUpdateOkCommand(HttpServletRequest request, HttpSession session, SVO svo, @RequestParam("cPage")String cPage) {
		ModelAndView mv = new ModelAndView("redirect:admin_store_onelist.do?s_idx="+svo.getS_idx()+"&cPage="+cPage);
		try {
			// 파일 처리
			String path = request.getSession().getServletContext().getRealPath("/resources/images");
			MultipartFile file = svo.getFile();
			String f_name = request.getParameter("f_name");
			if (file.isEmpty()) {
				svo.setS_img(f_name);
			} else {
				svo.setS_img(svo.getFile().getOriginalFilename());
			}
			// 큰 카테고리 처리
			String catInput = svo.getS_cat_s();
			if (catInput.equals("술집") || catInput.equals("카페")) {
				svo.setS_cat_b("마실거리");
			} else if (catInput.equals("PC방")||catInput.equals("노래방")||catInput.equals("스포츠")||catInput.equals("기타")) {
				svo.setS_cat_b("즐길거리");
			} else {
				svo.setS_cat_b("먹을거리");
			}
			// DB 처리
			int result = dao.getUpdateStore(svo);
			// DB 처리 성공 여부에 따른 이미지 처리
			if (result > 0) {
				try {
					file.transferTo(new File(path + "/" + svo.getS_img()));
				} catch (IllegalStateException e) {
					System.out.println(e);
				} catch (IOException e) {
					System.out.println(e);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	// 관리자 페이지 > 가게 관리 > 가게 상세 정보 > 삭제
	@RequestMapping("admin_store_delete.do")
	public ModelAndView adminStoreDeleteCommand(HttpServletRequest request, @RequestParam("cPage")String cPage) {
		return new ModelAndView("admin_store_delete");
	}
	
	// 관리자 페이지 > 가게 관리 > 가게 상세 정보 > 삭제 > DB 처리
	@RequestMapping("store_delete_ok.do")
	public ModelAndView storeDeleteOkCommand(HttpServletRequest request, @RequestParam("cPage")String cPage) {
		String s_idx = request.getParameter("s_idx");
		ModelAndView mv =  new ModelAndView("redirect:admin_store.do");
		try {
			dao.getDeleteStore(s_idx);
			mv.addObject("s_idx", s_idx);
			mv.addObject("cPage", cPage);
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	// 관리자 페이지 > 문의 관리
	@RequestMapping("admin_qna.do")
	public ModelAndView adminQnaCommand(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_qna");
		try {
			// 전체 게시물 수 (totalRecord)
			int count = dao.getQnaTotal();
			paging.setTotalRecord(count);
			// 전체 페이지 수 (totalPage)
			if (paging.getTotalRecord() <= paging.getNumPerPage()) {
				paging.setTotalPage(1);
			} else {
				paging.setTotalPage(paging.getTotalRecord()/paging.getNumPerPage());
				if (paging.getTotalRecord() % paging.getNumPerPage()!=0) {
					paging.setTotalPage(paging.getTotalPage()+1);
				}
			}
			// 현재 페이지 구하기 (nowPage)
			cPage = request.getParameter("cPage");
			if (cPage == null) {
				paging.setNowPage(1);
			} else {
				paging.setNowPage(Integer.parseInt(cPage));
			}
			// 시작 번호 (begin), 끝 번호 (end)
			paging.setBegin((paging.getNowPage()-1) * paging.getNumPerPage()+1);
			paging.setEnd((paging.getBegin()-1) + paging.getNumPerPage());
			// 문의 리스트
			List<QVO> list = dao.getQnaList(paging.getBegin(), paging.getEnd());
			// 시작 블록 (beginBlock), 끝 블록 (endBlock)
			paging.setBeginBlock((int)((paging.getNowPage()-1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
			paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock()-1);
			// 블록 처리 >> endBlock 이 totalPage 보다 큰 경우,
			if (paging.getEndBlock() > paging.getTotalPage()) {
				paging.setEndBlock(paging.getTotalPage());
			}
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("cPage", cPage);
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	// 관리자 페이지 > 문의 관리 > 문의 상세
	@RequestMapping("admin_qna_onelist.do")
	public ModelAndView adminQnaOnelistCommand(HttpServletRequest request, @RequestParam("cPage")String cPage) {
		ModelAndView mv = new ModelAndView("admin_qna_onelist");
		String q_idx = request.getParameter("q_idx");
		String m_idx = request.getParameter("m_idx");
		try {
			// q_group 고유값 추출
			String qnaGroup = dao.getQnaGroup(q_idx);
			// q_group 에 해당되는 Q&A 추출
			List<QVO> q_list = dao.getAdminQnaOnelist(qnaGroup);
			// 변수값 저장
			request.getSession().setAttribute("q_list", q_list);
			mv.addObject("cPage", cPage);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 관리자 페이지 > 문의 관리 > 문의 상세 > 답변 작성
	@RequestMapping("admin_qna_reply.do")
	public ModelAndView adminQnaReplyCommand(HttpServletRequest request, @RequestParam("cPage")String cPage) {
		ModelAndView mv = new ModelAndView("admin_qna_reply");
		String q_group = request.getParameter("q_group");
		String q_title = request.getParameter("q_title");
		mv.addObject("q_group", q_group);
		mv.addObject("q_title", q_title);
		mv.addObject("cPage", cPage);
		return mv;
	}
	
	// 관리자 페이지 > 문의 관리 > 문의 상세 > 답변 작성 > DB 처리
	@RequestMapping("admin_qna_reply_ok.do")
	public ModelAndView adminQnaReplyOkCommand(HttpServletRequest request, QVO qvo, @RequestParam("cPage")String cPage) {
		ModelAndView mv = new ModelAndView("redirect:admin_qna.do");
		try {
			System.out.println(qvo.getQ_title());
			System.out.println(qvo.getQ_content());
			System.out.println(qvo.getQ_group());
			System.out.println(cPage);
			int res = dao.getQnaReply(qvo);
			if (res > 0) {
				mv.addObject("cPage", cPage);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	
}
