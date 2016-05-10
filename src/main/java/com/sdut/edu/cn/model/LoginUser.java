/**
 * 
 */
package com.sdut.edu.cn.model;


/**
 * @author chenlf
 * 
 *         2014-3-24
 */
public class LoginUser {
	private String name;
	private String password;
	private Role role;

	public LoginUser() {

	}
	
	public LoginUser(String name, String password) {
		this.name = name;
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Role getRole() {
		return role;
	}

}