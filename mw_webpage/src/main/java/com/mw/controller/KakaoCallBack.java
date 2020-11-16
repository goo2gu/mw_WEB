package com.mw.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mw.db.DAO;
import com.mw.db.MVO;

@Controller
public class KakaoCallBack {
	
	@Autowired
	private DAO dao;
	public void setDao(DAO dao) {this.dao = dao;}
	
	// 카카오 로그인
	@RequestMapping("kakaoLogin.do")
	public ModelAndView loginCallBack(HttpServletRequest request) {
		ModelAndView mv = null;
		// 1. 인증 코드 받기
		String code = request.getParameter("code");
		// 2. 토큰 받기
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청 - setDoOutput 를 true 로 설정 (기본값: false)
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청 - 필요한 Parameter BufferedWriter 로 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=eee202b1a78a56d2e53bd82554d2abcd");
			sb.append("&redirect_uri=http://localhost:8090/kakaoLogin.do");
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// JSON 타입의 Response
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			br.close();
			bw.close();

			System.out.println("result : " + result);

			// result 값에서 token 값을 parsing
			JSONParser parsing = new JSONParser();
			Object obj = parsing.parse(result.toString());
			JSONObject jsonobj = (JSONObject) obj;

			String access_token = (String) jsonobj.get("access_token");
			String refresh_token = (String) jsonobj.get("refresh_token");
			
			request.getSession().setAttribute("access_token", access_token);
			request.getSession().setAttribute("refresh_token", refresh_token);
			
			System.out.println("access_token : " + access_token);
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("kakaoLogin");
	}
	
	// 카카오 로그인 > DB 처리
	@RequestMapping("kakaoLogin_chk.do")
	public ModelAndView kakaoLoginChkCommand(HttpServletRequest request, MVO k_mvo) {
		ModelAndView mv = null;
		String m_id = k_mvo.getM_id();
		System.out.println("m_id : " + m_id);
		MVO mvo = null;
		try {
			// 유저 정보 불러오기
			mvo = dao.getKakaoLogin(m_id);
			if (mvo != null) {
				request.getSession().setAttribute("login", "ok");
				request.getSession().setAttribute("mvo", mvo);
				mv = new ModelAndView("kakaoLogin_res");
				return mv;
			} else {
				// 가입 정보 없음
				System.out.println("유저 정보 없음.");
				mv = new ModelAndView("kakaoLogin_error_nouser");
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 카카오 회원가입
	@RequestMapping("kakaoAdd.do")
	public ModelAndView addCallBack(HttpServletRequest request) {
		ModelAndView mv = null;
		// 1. 인증 코드 받기
		String code = request.getParameter("code");
		// 2. 토큰 받기
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청 - setDoOutput 를 true 로 설정 (기본값: false)
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청 - 필요한 Parameter BufferedWriter 로 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=eee202b1a78a56d2e53bd82554d2abcd");
			sb.append("&redirect_uri=http://localhost:8090/kakaoAdd.do");
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// JSON 타입의 Response
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			br.close();
			bw.close();

			System.out.println("result : " + result);

			// result 값에서 token 값을 parsing
			JSONParser parsing = new JSONParser();
			Object obj = parsing.parse(result.toString());
			JSONObject jsonobj = (JSONObject) obj;

			String access_token = (String) jsonobj.get("access_token");
			String refresh_token = (String) jsonobj.get("refresh_token");
			
			request.getSession().setAttribute("access_token", access_token);
			request.getSession().setAttribute("refresh_token", refresh_token);
			
			System.out.println("access_token : " + access_token);
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("kakaoAdd");
	}
	
	// 카카오 회원가입 > 추가 정보 받기
	@RequestMapping("kakaoAdd_write.do")
	public ModelAndView kakaoAddWriteCommand(HttpServletRequest request, MVO k_mvo) {
		ModelAndView mv = new ModelAndView("kakaoAdd_write");
		mv.addObject("k_mvo", k_mvo);
		return mv;
	}
	
	// 카카오 아이디로 페이지 이용하기
	@RequestMapping("kakaoAdd_ok.do")
	public ModelAndView kakaoAddOkCommand(HttpServletRequest request, MVO k_mvo) {
		ModelAndView mv = null;
		String m_id = k_mvo.getM_id();
		System.out.println("id : " + m_id);
		try {
			int idChkRes = dao.getIdChk(m_id);
			if (idChkRes > 0) {
				// 중복 아이디
				mv = new ModelAndView("kakaoAdd_error_id");
				return mv;
			} else {
				// 신규 회원 가입
				try {
					dao.getkakaoMemberAdd(k_mvo);
					mv = new ModelAndView("kakaoAdd_res");
					request.getSession().setAttribute("k_mvo", k_mvo);
					return mv;
				} catch (Exception e) {
					System.out.println(e);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

}
