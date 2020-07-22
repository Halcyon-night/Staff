package cn.wyy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.wyy.pojo.Menu;
import cn.wyy.pojo.Role;
import cn.wyy.pojo.User;


/**
 * 	用户信息
 * 	@author 古桥烟雨
 *
 */
public interface UserMapper {
	/**
	 * 	用户登录
	 * 	@param userName
	 * 	@param password
	 * 	@return
	 */
	public User getUserLogin(@Param("userName")String userName, @Param("password")String password);
	
	/**
	 * 	用户注册
	 * 	@param user
	 * 	@return
	 */
	public int addUserRegister(Map<String,Object>MapUser);
	
	/**
	 * 	判断用户名是否存在
	 * 	@param userName
	 * 	@return
	 */
	public boolean checkUserName(@Param("userName")String userName);
	
	/**
	 * 	查询职位信息
	 * 	@return
	 */
	public List<Role> getRoleList();
	
	/**
	 * 	查询菜单
	 * 	@return
	 */
	public List<Menu> getMenuList();
	
	/**
	 * 	查询用户信息
	 * 	@return
	 */
	public List<User> getUserList();
	
	/**
	 * 	查询二级联动
	 * 	@param roleId
	 * 	@return
	 */
	public Role getRole(@Param("roleId")Integer roleId);
	
	/**
	 * 新增用户信息
	 * @param user
	 * @return
	 */
	public int addUser(Map<String,Object>MapUser);
	
	/**
	 * 批量删除用户信息
	 * @param userId
	 * @return
	 */
	public void deleteUser(List<String> delList);
	
	/**
	 * 删除单条信息
	 * @param userId
	 * @return
	 */
	public int deleteById(@Param("userId")Integer userId);
	
	/**
	 * 数据回显
	 * @param userId
	 * @return
	 */
	public User echoUser(@Param("userId")Integer userId);
	
	/**
	 * 修改用户信息
	 * @param MapUser
	 * @return
	 */
	public int updateUser(Map<String,Object>MapUser);
}
