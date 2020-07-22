package cn.wyy.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.wyy.dao.UserMapper;
import cn.wyy.pojo.Menu;
import cn.wyy.pojo.Role;
import cn.wyy.pojo.User;
import cn.wyy.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	/**
	 * 登录
	 */
	public User getUserLogin(String userName, String password) {
		return userMapper.getUserLogin(userName, password);
	}

	@Override
	/**
	 * 注册
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	public int addUserRegister(Map<String, Object> MapUser) {
		return userMapper.addUserRegister(MapUser);
	}

	@Override
	/**
	 * 判断重复
	 */
	public boolean checkUserName(String userName) {
		return userMapper.checkUserName(userName);
	}

	@Override
	/**
	 * 查询职位
	 */
	public List<Role> getRoleList() {
		return userMapper.getRoleList();
	}

	@Override
	/**
	 * 	查询菜单
	 */
	public List<Menu> getMenuList() {
		return userMapper.getMenuList();
	}

	/**
	 * 	查询用户信息
	 * 	@return
	 */
	public List<User> getUserList(){
		return userMapper.getUserList();
	}

	@Override
	/**
	 * 二级联动
	 */
	public Role getRole(Integer roleId) {
		return userMapper.getRole(roleId);
	}

	@Override
	/**
	 * 新增用户信息
	 */
	public int addUser(Map<String,Object>MapUser) {
		return userMapper.addUser(MapUser);
	}

	@Override
	/**
	 * 批量删除用户信息
	 */
	public void deleteUser(List<String> delList) {
		userMapper.deleteUser(delList);
	}

	@Override
	/**
	 * 删除单条信息
	 */
	public int deleteById(Integer userId) {
		return userMapper.deleteById(userId);
	}

	@Override
	/**
	 * 信息回显
	 */
	public User echoUser(Integer userId) {
		return userMapper.echoUser(userId);
	}

	@Override
	/**
	 * 修改用户信息
	 */
	public int updateUser(Map<String, Object> MapUser) {
		return userMapper.updateUser(MapUser);
	}

}
