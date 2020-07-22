package cn.wyy.pojo;

/**
 * 	用户信息表
 * 	@author 古桥烟雨
 *
 */
public class User {
	//主键id	
	private int userId;
	//真实姓名
	private String name;
	//用户名
	private String userName;
	//密码
	private String password;
	//职位外键
	private int roleId;
	
	//一对一的形式
	private Role role;
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
	
	
	//添加setter/getter方法
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	
	
	
}
