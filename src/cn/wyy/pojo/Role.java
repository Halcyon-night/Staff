package cn.wyy.pojo;

import java.util.Date;

/**
 * 权限表信息
 * @author 古桥烟雨
 *
 */
public class Role {
	//主键id
	private int roleId;
	//职位名称
	private String roleName;
	//职位创建时间
	private Date roleTime;
	//上级
	private int roleSuperior;
	
	
	//添加setter/getter方法
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Date getRoleTime() {
		return roleTime;
	}
	public void setRoleTime(Date roleTime) {
		this.roleTime = roleTime;
	}
	public int getRoleSuperior() {
		return roleSuperior;
	}
	public void setRoleSuperior(int roleSuperior) {
		this.roleSuperior = roleSuperior;
	}
	
}
