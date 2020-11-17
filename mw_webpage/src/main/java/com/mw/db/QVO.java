package com.mw.db;

public class QVO {

	private String q_idx, m_idx, q_title, q_content, q_group, q_step, q_regdate;
	
	public QVO() { }

	public QVO(String q_idx, String m_idx, String q_title, String q_content, String q_group, String q_step,
			String q_regdate) {
		super();
		this.q_idx = q_idx;
		this.m_idx = m_idx;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_group = q_group;
		this.q_step = q_step;
		this.q_regdate = q_regdate;
	}

	public String getQ_idx() {
		return q_idx;
	}

	public void setQ_idx(String q_idx) {
		this.q_idx = q_idx;
	}

	public String getM_idx() {
		return m_idx;
	}

	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_group() {
		return q_group;
	}

	public void setQ_group(String q_group) {
		this.q_group = q_group;
	}

	public String getQ_step() {
		return q_step;
	}

	public void setQ_step(String q_step) {
		this.q_step = q_step;
	}

	public String getQ_regdate() {
		return q_regdate;
	}

	public void setQ_regdate(String q_regdate) {
		this.q_regdate = q_regdate;
	}
	
}
