package com.miracle.fts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miracle.fts.DTO.LoginDTO;
import com.miracle.fts.service.LoginService;

@Controller
public class LoginController {
	
	private LoginService loginService;
	
	@Autowired
	public void setloginService(LoginService loginService) {
		this.loginService = loginService;
	}
	
	
	

	public LoginController() {
//		System.out.println("LoginController() 생성");
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", loginService.list());
		return "login/list";
	}
	
	@RequestMapping("/write")
	public String write(Model model) {
		return "login/write";
	}
	
	@RequestMapping("/writeOk")
	public String writeOk(LoginDTO dto, Model model) {
		model.addAttribute("result", loginService.write(dto));
		
		int result = loginService.idChk(dto);
		try {
			if(result == 1) {
				return "login/writeOk";
			}else if(result == 0) {
				loginService.write(dto);
			}
			// 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		return "login/index";
	}
	
//	@GetMapping("/view")
//	public String view(String id, Model model) {
//		model.addAttribute("list", loginService.viewById(id));
//		return "login/view";
//	}
	
	@RequestMapping("/update")
	public String update(String id, Model model) {
		model.addAttribute("list", loginService.selectById(id));		
		return "login/update";
	}

	@PostMapping("/updateOk")
	public String updateOk(LoginDTO dto, Model model) {
		model.addAttribute("result", loginService.update(dto));
		return "login/updateOk";
	}

	@GetMapping("/deleteOk")
	public String deleteOk(String id, Model model) {
		model.addAttribute("result", loginService.deleteById(id));
		return "login/deleteOk";
	}
	
	   // 아이디 중복 체크

    @ResponseBody
    @RequestMapping(value="/idChk", method = RequestMethod.POST)
    public int idChk(LoginDTO dto) throws Exception {
        int result = loginService.idChk(dto);
        return result;

    }
	
	
}
