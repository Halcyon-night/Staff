package cn.wyy.pojo;

import java.util.Date;

/**
 * 请假单
 * @author 古桥烟雨
 *
 */
public class Leave {
	private int leaveId;
	private int leave_userId;
	private int leave_roleId;
	private int leaveState;
	private Date leaveTime;
	private int leaveDays;
	private int leaveAdopt;
	
	
	private User user;
	private Role Role;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Role getRole() {
		return Role;
	}
	public void setRole(Role role) {
		Role = role;
	}
	public int getLeaveId() {
		return leaveId;
	}
	public void setLeaveId(int leaveId) {
		this.leaveId = leaveId;
	}
	public int getLeave_userId() {
		return leave_userId;
	}
	public void setLeave_userId(int leave_userId) {
		this.leave_userId = leave_userId;
	}
	public int getLeave_roleId() {
		return leave_roleId;
	}
	public void setLeave_roleId(int leave_roleId) {
		this.leave_roleId = leave_roleId;
	}
	public int getLeaveState() {
		return leaveState;
	}
	public void setLeaveState(int leaveState) {
		this.leaveState = leaveState;
	}
	public Date getLeaveTime() {
		return leaveTime;
	}
	public void setLeaveTime(Date leaveTime) {
		this.leaveTime = leaveTime;
	}
	public int getLeaveDays() {
		return leaveDays;
	}
	public void setLeaveDays(int leaveDays) {
		this.leaveDays = leaveDays;
	}
	public int getLeaveAdopt() {
		return leaveAdopt;
	}
	public void setLeaveAdopt(int leaveAdopt) {
		this.leaveAdopt = leaveAdopt;
	}
	
	
}
