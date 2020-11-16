package com.mw.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mw.db.MVO;

@RestController
public class KakaoMember {
	@RequestMapping(value = "k_member.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	private String memberChk(HttpSession session) {
		String access_token = (String)session.getAttribute("access_token");
		String refresh_token = (String)session.getAttribute("refresh_token");
		String header = "Bearer " + access_token; 
		String apiURL = "https://kapi.kakao.com/v2/user/me";

		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("Authorization", header);
		String responseBody = get(apiURL, requestHeaders);
		
		// JSON parsing
		try {
			JSONParser parsing = new JSONParser();
			Object obj = parsing.parse(responseBody.toString());
			JSONObject jsonobj = (JSONObject) obj;
			
			String m_id = jsonobj.get("id").toString();
			session.setAttribute("m_id", m_id);
			System.out.println("m_id : " + m_id);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		System.out.println("responseBody : " + responseBody);
		return responseBody;
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders){
	    HttpURLConnection con = connect(apiUrl);
	    try {
	        con.setRequestMethod("POST");
	        con.setDoOutput(true);
	        
	        for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	            con.setRequestProperty(header.getKey(), header.getValue());
	        }

	        int responseCode = con.getResponseCode();
	        if (responseCode == HttpURLConnection.HTTP_OK) { 
	        	// 정상 호출
	            return readBody(con.getInputStream());
	        } else { 
	        	// 에러 발생
	            return readBody(con.getErrorStream());
	        }
	    } catch (IOException e) {
	        throw new RuntimeException("API 요청 및 응답 실패", e);
	    } finally {
	        con.disconnect();
	    }
	}
	
	private static HttpURLConnection connect(String apiUrl){
	    try {
	        URL url = new URL(apiUrl);
	        return (HttpURLConnection)url.openConnection();
	    } catch (MalformedURLException e) {
	        throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	    } catch (IOException e) {
	        throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	    }
	}
	
	private static String readBody(InputStream body) {
	    InputStreamReader streamReader = new InputStreamReader(body);
	    try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	        
	    	StringBuilder responseBody = new StringBuilder();
	        String line;
	        while ((line = lineReader.readLine()) != null) {
	            responseBody.append(line);
	        }
	        return responseBody.toString();
	    } catch (IOException e) {
	        throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	    }
	}
}
