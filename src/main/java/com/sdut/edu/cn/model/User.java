package com.sdut.edu.cn.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;



@Entity
/*@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })*/ // 序列化时候忽略的属性
																			// hibernateLazyinitinalizer
/*<cache usage="read-write"/>	*/																		// handler
@Table(name = "users", schema = "public")
/*@Cache(usage = CacheConcurrencyStrategy.READ_ONLY) */
public class User implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */

	private Integer id;
	private String username;
	private String password;
	private Integer phone;
	private String role;

	public User() {
	}

	public User(String username, Integer id, String role, String password, Integer phone) {
		super();
		this.username = username;
		this.id = id;
		this.phone = phone;

		this.role = role;
		this.password = password;
	}

	/*
	 * @OneToOne(cascade = CascadeType.ALL)
	 * 
	 * @JoinColumn public Message getMessage() { return message; }
	 */
	/*
	 * public void setMessage(Message message) { this.message = message; }
	 */

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Id

	@GeneratedValue()
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "username")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "phone")
	public Integer getPhone() {
		return phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	@Column(name = "role")
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Transient
	public String getRoleName() {
		if ("admin".equals(role)) {
			return "管理人员";
		} if ("user".equals(role)) {
			return "普通用户";
		}else if("root".equals(role)){
			return "超级管理员";
		}
		return null;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", id=" + id + ", phone=" + phone + ", role=" + role + ", psd=" + password
				+ "]";
	}

}