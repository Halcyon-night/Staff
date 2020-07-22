package cn.wyy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.wyy.pojo.Role;
import cn.wyy.pojo.User;
import cn.wyy.service.LeaveService;

@Controller
public class Test {
	@Autowired
	private LeaveService leaveService;
	
	
	public LeaveService getLeaveService() {
		return leaveService;
	}


	public void setLeaveService(LeaveService leaveService) {
		this.leaveService = leaveService;
	}


	@RequestMapping("/test")
	public String test() {
		return "Test1";
	}
	
	
	@RequestMapping("/Test2")
	public String addleave(Model model) {
		List<User> userlist = leaveService.getUserList();
		model.addAttribute("userlist", userlist);
		List<Role> rolelist = leaveService.getRoleList();
		model.addAttribute("rolelist", rolelist);
		return "Test2";
	}
	@RequestMapping("/Test3")
	public String addleave2(Model model) {
		List<User> userlist = leaveService.getUserList();
		model.addAttribute("userlist", userlist);
		List<Role> rolelist = leaveService.getRoleList();
		model.addAttribute("rolelist", rolelist);
		return "Test1";
	}
}
