package cn.wyy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.wyy.pojo.Leave;
import cn.wyy.pojo.Role;
import cn.wyy.pojo.User;

/**
 * 请假单接口
 * @author 古桥烟雨
 *
 */
public interface LeaveMapper {
	/**
	 * 查询请假单信息
	 * @return
	 */
	public List<Leave> getLeaveList();
	
	
	/**
	 * 查询用户姓名
	 * @return
	 */
	public List<User> getUserList();
	
	/**
	 * 查询职位名称
	 * @return
	 */
	public List<Role> getRoleList();
	
	/**
	 * 添加请假单信息
	 * @param leave
	 * @return
	 */
	public int addleave(Leave leave);
	
	/**
	 * 修改请假单信息
	 * @param leaveAdopt
	 * @param leave_userId
	 * @return
	 */
	public int updateleave(@Param("leaveAdopt")Integer leaveAdopt,@Param("leaveId") Integer leaveId);
}
