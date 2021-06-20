package com.miracle.fts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.miracle.fts.DTO.FaqDTO;
import com.miracle.fts.service.FaqService;


@Controller
public class FaqController {
	private FaqService faqService;
	
	@Autowired
	public void setfaqService(FaqService faqService) {
		this.faqService = faqService;
	}
	

	public FaqController() {
//		System.out.println("faqController() 생성");
	}
	
	@RequestMapping("/f_list")
	public String list(Model model) {
		model.addAttribute("list", faqService.list());
		return "faq/f_list";
	}
	
	@RequestMapping("/f_write")
	public String write(Model model) {
		return "faq/f_write";
	}
	
	@RequestMapping("/f_writeOk")
	public String writeOk(FaqDTO dto, Model model) {
		
		//dto.setId("abcd");//TODO 나중에 사용자 아이디 받아서 생성하기
		
		model.addAttribute("result", faqService.write(dto));
		return "faq/f_writeOk";
	}
	
	@GetMapping("/f_view")
	public String view(int uid, Model model) {
		model.addAttribute("list", faqService.viewByUid(uid));
		return "faq/f_view";
	}
	
	@RequestMapping("/f_update")
	public String update(int uid, Model model) {
		model.addAttribute("list", faqService.selectByUid(uid));		
		return "faq/f_update";
	}

	@PostMapping("/f_updateOk")
	public String updateOk(FaqDTO dto, Model model) {
		model.addAttribute("result", faqService.update(dto));
		return "faq/f_updateOk";
	}

	@GetMapping("/f_deleteOk")
	public String deleteOk(int uid, Model model) {
		model.addAttribute("result", faqService.deleteByUid(uid));
		return "faq/f_deleteOk";
	}
}
	