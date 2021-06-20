package com.miracle.fts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.miracle.fts.DTO.NoticeDTO;
import com.miracle.fts.service.NoticeService;


@Controller
public class NoticeController {
	private NoticeService noticeService;
	
	@Autowired
	public void setnoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	

	public NoticeController() {
//		System.out.println("NoticeController() 생성");
	}
	
	@RequestMapping("/n_list")
	public String list(Model model) {
		model.addAttribute("list", noticeService.list());
		return "notice/n_list";
	}
	
	@RequestMapping("/n_write")
	public String write(Model model) {
		return "notice/n_write";
	}
	
	@RequestMapping("/n_writeOk")
	public String writeOk(NoticeDTO dto, Model model) {
		
		// dto.setId("abcd");//TODO 나중에 사용자 아이디 받아서 생성하기
		
		model.addAttribute("result", noticeService.write(dto));
		return "notice/n_writeOk";
	}
	
	@GetMapping("/n_view")
	public String view(int uid, Model model) {
		model.addAttribute("list", noticeService.viewByUid(uid));
		return "notice/n_view";
	}
	
	@RequestMapping("/n_update")
	public String update(int uid, Model model) {
		model.addAttribute("list", noticeService.selectByUid(uid));		
		return "notice/n_update";
	}

	@PostMapping("/n_updateOk")
	public String updateOk(NoticeDTO dto, Model model) {
		model.addAttribute("result", noticeService.update(dto));
		return "notice/n_updateOk";
	}

	@GetMapping("/n_deleteOk")
	public String deleteOk(int uid, Model model) {
		model.addAttribute("result", noticeService.deleteByUid(uid));
		return "notice/n_deleteOk";
	}
}
	