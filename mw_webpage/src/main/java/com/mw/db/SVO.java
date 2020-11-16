package com.mw.db;

import org.springframework.web.multipart.MultipartFile;

public class SVO {

	private String s_idx, s_name, s_cat_b, s_cat_s, s_sub, s_img, s_hashtag, s_location, s_lat, s_lng, s_tel, s_hour, s_menu;
	private int s_like, s_comment, s_view;
	private MultipartFile file;
	
	public SVO() {}

	public SVO(String s_idx, String s_name, String s_cat_b, String s_cat_s, String s_sub, String s_img,
			String s_hashtag, String s_location, String s_lat, String s_lng, String s_tel, String s_hour, String s_menu,
			int s_like, int s_comment, int s_view, MultipartFile file) {
		super();
		this.s_idx = s_idx;
		this.s_name = s_name;
		this.s_cat_b = s_cat_b;
		this.s_cat_s = s_cat_s;
		this.s_sub = s_sub;
		this.s_img = s_img;
		this.s_hashtag = s_hashtag;
		this.s_location = s_location;
		this.s_lat = s_lat;
		this.s_lng = s_lng;
		this.s_tel = s_tel;
		this.s_hour = s_hour;
		this.s_menu = s_menu;
		this.s_like = s_like;
		this.s_comment = s_comment;
		this.s_view = s_view;
		this.file = file;
	}

	public String getS_idx() {
		return s_idx;
	}

	public void setS_idx(String s_idx) {
		this.s_idx = s_idx;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_cat_b() {
		return s_cat_b;
	}

	public void setS_cat_b(String s_cat_b) {
		this.s_cat_b = s_cat_b;
	}

	public String getS_cat_s() {
		return s_cat_s;
	}

	public void setS_cat_s(String s_cat_s) {
		this.s_cat_s = s_cat_s;
	}

	public String getS_sub() {
		return s_sub;
	}

	public void setS_sub(String s_sub) {
		this.s_sub = s_sub;
	}

	public String getS_img() {
		return s_img;
	}

	public void setS_img(String s_img) {
		this.s_img = s_img;
	}

	public String getS_hashtag() {
		return s_hashtag;
	}

	public void setS_hashtag(String s_hashtag) {
		this.s_hashtag = s_hashtag;
	}

	public String getS_location() {
		return s_location;
	}

	public void setS_location(String s_location) {
		this.s_location = s_location;
	}

	public String getS_lat() {
		return s_lat;
	}

	public void setS_lat(String s_lat) {
		this.s_lat = s_lat;
	}

	public String getS_lng() {
		return s_lng;
	}

	public void setS_lng(String s_lng) {
		this.s_lng = s_lng;
	}

	public String getS_tel() {
		return s_tel;
	}

	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}

	public String getS_hour() {
		return s_hour;
	}

	public void setS_hour(String s_hour) {
		this.s_hour = s_hour;
	}

	public String getS_menu() {
		return s_menu;
	}

	public void setS_menu(String s_menu) {
		this.s_menu = s_menu;
	}

	public int getS_like() {
		return s_like;
	}

	public void setS_like(int s_like) {
		this.s_like = s_like;
	}

	public int getS_comment() {
		return s_comment;
	}

	public void setS_comment(int s_comment) {
		this.s_comment = s_comment;
	}

	public int getS_view() {
		return s_view;
	}

	public void setS_view(int s_view) {
		this.s_view = s_view;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

}
