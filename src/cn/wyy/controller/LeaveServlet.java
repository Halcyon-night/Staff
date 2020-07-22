package cn.wyy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.sx.utils.ReturnResult;

import cn.wyy.pojo.Leave;
import cn.wyy.pojo.Role;
import cn.wyy.pojo.User;
import cn.wyy.service.LeaveService;

@Controller
public class LeaveServlet {
	@Autowired
	private LeaveService leaveService;
	public LeaveService getLeaveService() {
		return leaveService;
	}
	public void setLeaveService(LeaveService leaveService) {
		this.leaveService = leaveService;
	}
	
	/**
	 * 跳转到请假单页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/leave")
	public String leave(Model model) {
		List<Leave> leavelist = leaveService.getLeaveList();
		model.addAttribute("leavelist", leavelist);
		return "leave";
	}
	
	/**
	 * 跳转到添加请假单页面
	 * @return
	 */
	@RequestMapping("/addleave")
	public String addleave(Model model) {
		List<User> userlist = leaveService.getUserList();
		model.addAttribute("userlist", userlist);
		List<Role> rolelist = leaveService.getRoleList();
		model.addAttribute("rolelist", rolelist);
		return "addLeave";
	}
	
	/**
	 * 添加请假请求
	 * @param response
	 * @param leave
	 */
	@RequestMapping("/addleave2")
	public void addleave2(HttpServletResponse response,Leave leave) {
		ReturnResult result = new ReturnResult();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int row = leaveService.addleave(leave);
		String json = null;
		if(row >0) {
			json = JSONObject.toJSONString(result.getSuccess("添加成功!"));
		}else {
			json = JSONObject.toJSONString(result.getFail("添加失败!"));
		}
		out.print(json);
		out.flush();
		out.close();
	}
	
	/**
	 * 修改请假信息
	 * @param response
	 * @param leaveAdopt
	 * @param leaveId
	 */
	@RequestMapping("/updateleave")
	public void updateleave(HttpServletResponse response,Integer leaveAdopt,Integer leaveId) {
		ReturnResult result = new ReturnResult();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int row = leaveService.updateleave(leaveAdopt, leaveId);
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
