package com.group3.tofu.employee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group3.tofu.employee.model.EmployeeService;

@Controller
public class LoginController {
	
	@Autowired
	private EmployeeService employeeService;

	@GetMapping("/login_emp")
	public String showLoginPage() {
		return "employee/login";
	}
    
    @ResponseBody
    @GetMapping("/info/employee/role")
    public List<String> getUserRole(Authentication authentication) {
        List<String> roles = new ArrayList<>();
        authentication.getAuthorities().forEach(authority -> {
            roles.add(authority.getAuthority());
        });
        return roles;
    }

    @ResponseBody
    @GetMapping("/info/employee/user")
    public Map<String, String> getUserName(Authentication authentication) {
        Map<String, String> user = new HashMap<>();
        user.put("name", authentication.getName());
        
        return user;
    }

    @ResponseBody
    @GetMapping("/info/employee/userId")
    public Map<String, Integer> getUserId(Authentication authentication) {
        Map<String, Integer> user = new HashMap<>();
        user.put("id", employeeService.findIdByName(authentication.getName()));
        
        return user;
    }
    
    
    
    
}
