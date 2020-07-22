package cn.wyy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wyy.dao.LeaveMapper;
import cn.wyy.pojo.Leave;
import cn.wyy.pojo.Role;
import cn.wyy.pojo.User;
import cn.wyy.service.LeaveService;
@Service("leaveService")
public class LeaveServiceImpl implements LeaveService{
	@Autowired
	private LeaveMapper leaveMapper;
	public LeaveMapper getLeaveMapper() {
		return leaveMapper;
	}
	public void setLeaveMapper(LeaveMapper leaveMapper) {
		this.leaveMapper = leaveMapper;
	}



	@Override
	/**
	 * 查询请假单信息
	 */
	public List<Leave> getLeaveList() {
		return leaveMapper.getLeaveList();
	}
	
	@Override
	/**
	 * 展示下拉框信息
	 */
	public List<User> getUserList() {
		return leaveMapper.getUserList();
	}
	
	@Override
	/**
	 * 展示下拉框信息
	 */
	public List<Role> getRoleList() {
		return leaveMapper.getRoleList();
	}

	/**
	 * 添加请假单信息
	 * @param leave
	 * @return
	 */
	public int addleave(Leave leave) {
		return leaveMapper.addleave(leave);
	}
	
	@Override
	/**
	 * 修改请假单信息
	 */
	public int updateleave(Integer leaveAdopt, Integer leaveId) {
		return leaveMapper.updateleave(leaveAdopt, leaveId);
	}
}
