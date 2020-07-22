package cn.wyy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.sx.utils.ReturnResult;

import cn.wyy.utils.PrintUtil;

import cn.wyy.utils.SecurityUtils;
import cn.wyy.pojo.Menu;
import cn.wyy.pojo.Role;
import cn.wyy.pojo.User;
import cn.wyy.service.UserService;

@Controller
public class UserServlet {
	@Autowired
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	private static final Logger log = Logger.getLogger("log4j.properties");

	/**
	 * 访问登录页面
	 * 
	 * @return
	 */
	@RequestMapping({ "/login", "/" })
	public String index() {
		return "login";
	}

	/**
	 * 登录
	 * 
	 * @return
	 */
	@RequestMapping("/index")
	public String login(@RequestParam("userName") String userName, @RequestParam("password") String password,HttpSession session, HttpServletRequest request,Model model) {
		// 调用方法
		User user = userService.getUserLogin(userName, SecurityUtils.md5Hex(password));
		if (user != null) {
			// 登陆成功
			session.setAttribute("user", user);
			List<Menu> menulist = userService.getMenuList();
			model.addAttribute("menulist", menulist);
			return "index";
		} else {
			request.setAttribute("error", "用户名或密码错误");
			return "login";
		}
	}

	/**
	 * 	跳转到注册页面--展示下拉框列表信息
	 * 	@return
	 */
	@RequestMapping("/register")
	public String register(Model model) {
		List<Role> roleList = userService.getRoleList();
		model.addAttribute("roleList", roleList);
		return "register";
	}

	/**
	 * 	注册页面显示二级联动
	 *	@return
	 */
	@RequestMapping("/linkage")
	public void linkage(Model model,Integer roleId,HttpServletResponse response) {
		ReturnResult result = new ReturnResult();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Role role = userService.getRole(roleId-1);
		model.addAttribute("role", role);
		String json = null;
		if(role != null	) {
			json = JSONObject.toJSONString(result.getSuccess("上级:" + role.getRoleName() ));
		}else {
			json = JSONObject.toJSONString(result.getFail("上级:董事长呀,最高了,总经理全是他儿子"));
		}
		out.print(json);
		out.flush();
		out.close();
	}
	
	/**
	 *	判断用户名是否存在
	 * 	@param request
	 *	@param response
	 * 	@param userName
	 */
	@RequestMapping("/checkUserName")
	public void checkUserName(HttpServletRequest request, HttpServletResponse response, String userName) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		boolean flag = false;
		flag = userService.checkUserName(userName);
		String str = "[{\"result\":\"" + flag + "\"}]";
		out.print(str);
		out.flush();
		out.close();
	}

	/**
	 * 	实行注册
	 * 	@param response
	 * 	@param user
	 */
	@RequestMapping("/addregister")
	public void addregister(HttpServletResponse response,String name,String userName,String password,Integer roleId) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> MapUser = new HashMap<String,Object>();
		MapUser.put("name", name);
		MapUser.put("userName",userName);
		MapUser.put("password", SecurityUtils.md5Hex(password));
		MapUser.put("roleId", roleId);
		int row = userService.addUserRegister(MapUser);
		String str = "[{\"result\":\"" + row + "\"}]";
		out.print(str);
		out.flush();
		out.close();
	}
	
	/**
	 * 	首页展示信息
	 *	@return
	 */
	@RequestMapping("/welcome")
	public String welcome() {
		return "welcome";
	}
	
	/**
	 * 	跳转到用户信息页面--展示用户信息
	 * 	@param model
	 * 	@return
	 */
	@RequestMapping("/userList")
	public String userList(Model model) {
		List<User> userlist = userService.getUserList();
		model.addAttribute("userlist", userlist);
		return "user";
	}
	
	/**
	 * 	跳转到添加用户信息页面
	 * 	@param model
	 * 	@return
	 */
	@RequestMapping("/addUser")
	public String addUser(Model model) {
		List<Role> roleList = userService.getRoleList();
		model.addAttribute("roleList", roleList);
		return "addUser";
	}
	
	/**
	 * 添加用户信息
	 * @param response
	 * @param name
	 * @param userName
	 * @param password
	 * @param roleId
	 */
	@RequestMapping("/addUser2")
	public void addUser(HttpServletResponse response,String name,String userName,String password,Integer roleId) {
		ReturnResult result = new ReturnResult();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> MapUser = new HashMap<String,Object>();
		MapUser.put("name", name);
		MapUser.put("userName",userName);
		MapUser.put("password", SecurityUtils.md5Hex(password));
		MapUser.put("roleId", roleId);
		int row = userService.addUser(MapUser);
		String json = null;
		if(row > 0) {
			json = JSONObject.toJSONString(result.getSuccess("添加信息成功"));
		}else {
			json = JSONObject.toJSONString(result.getFail("添加信息失败"));
		}
		out.print(json);
		out.flush();
		out.close();
	}
	
	/**
	 * 批量删除
	 * @param tag
	 * @return
	 */
	@RequestMapping("/deleteall")
	public void deleteAll(HttpServletRequest request, HttpServletResponse response) {
		ReturnResult result = new ReturnResult();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String items = request.getParameter("delitems");
		List<String> delList = new ArrayList<String>();
		String[] strs = items.split(",");
		for (String str : strs) {
			delList.add(str);
		}
		userService.deleteUser(delList);
		String json = null;
		json = JSONObject.toJSONString(result.getSuccess("批量删除成功"));
		out.print(json);
		out.flush();
		out.close();
	}
	
	
	/**
	 * 删除单条信息
	 * @param response
	 * @param userId
	 */
	@RequestMapping("/deleteUser")
	public void delete(HttpServletResponse response,Integer userId) {
		ReturnResult result = new ReturnResult();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int row = userService.deleteById(userId);
		String json = null;
		if(row >0) {
			json = JSONObject.toJSONString(result.getSuccess("删除成功!"));
		}else {
			json = JSONObject.toJSONString(result.getFail("删除失败!"));
		}
		out.print(json);
		out.flush();
		out.close();
	}
	/**
	 * 跳转到修改用户页面
	 * @param model
	 * @param userId
	 * @return
	 */
	@RequestMapping("/updateUser")
	public String updateUser(Model model,Integer userId) {
		User user = userService.echoUser(userId);
		model.addAttribute("user", user);
		List<Role> roleList = userService.getRoleList();
		model.addAttribute("roleList", roleList);
		return "updateUser";
	}
	
	/**
	 * 执行修改的方法
	 * @param response
	 * @param userId
	 * @param name
	 * @param userName
	 * @param password
	 * @param roleId
	 */
	@RequestMapping("/updateUser2")
	public void updateUser(HttpServletResponse response,Integer userId,String name,String userName,Integer roleId) {
		ReturnResult result = new ReturnResult();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> MapUser = new HashMap<String,Object>();
		MapUser.put("userId", userId);
		MapUser.put("name", name);
		MapUser.put("userName",userName);
		MapUser.put("roleId", roleId);
		int row = userService.updateUser(MapUser);
		String json = null;
		if(row >0) {
			json = JSONObject.toJSONString(result.getSuccess("修改成功!"));
		}else {
			json = JSONObject.toJSONString(result.getFail("修改失败!"));
		}
		out.print(json);
		out.flush();
		out.close();
		
	}
}
