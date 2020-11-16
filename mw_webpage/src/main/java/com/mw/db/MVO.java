package com.mw.db;

public class MVO {

	private String m_idx, m_sns, m_id, m_email, m_nickname, m_profile_img, m_thumbnail_img, m_age_range, m_gender, m_regdate;
	
	public MVO() { }

	public MVO(String m_idx, String m_sns, String m_id, String m_email, String m_nickname, String m_profile_img,
			String m_thumbnail_img, String m_age_range, String m_gender, String m_regdate) {
		super();
		this.m_idx = m_idx;
		this.m_sns = m_sns;
		this.m_id = m_id;
		this.m_email = m_email;
		this.m_nickname = m_nickname;
		this.m_profile_img = m_profile_img;
		this.m_thumbnail_img = m_thumbnail_img;
		this.m_age_range = m_age_range;
		this.m_gender = m_gender;
		this.m_regdate = m_regdate;
	}

	public String getM_idx() {
		return m_idx;
	}

	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}

	public String getM_sns() {
		return m_sns;
	}

	public void setM_sns(String m_sns) {
		this.m_sns = m_sns;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getM_profile_img() {
		return m_profile_img;
	}

	public void setM_profile_img(String m_profile_img) {
		this.m_profile_img = m_profile_img;
	}

	public String getM_thumbnail_img() {
		return m_thumbnail_img;
	}

	public void setM_thumbnail_img(String m_thumbnail_img) {
		this.m_thumbnail_img = m_thumbnail_img;
	}

	public String getM_age_range() {
		return m_age_range;
	}

	public void setM_age_range(String m_age_range) {
		this.m_age_range = m_age_range;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}

}
