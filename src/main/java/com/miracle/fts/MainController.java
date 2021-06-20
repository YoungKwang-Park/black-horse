package com.miracle.fts;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miracle.fts.DTO.ListDTO;
import com.miracle.fts.DTO.PageMaker;
import com.miracle.fts.DTO.SearchCriteria;
import com.miracle.fts.service.ListService;


@Controller
public class MainController {
	
	private ListService listService;
	
	@Autowired
	public void setListService(ListService listService) {
		this.listService = listService;
	}

	public MainController() {
		super();
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		model.addAttribute("list", listService.select(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(listService.selectCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);

		return "index";
	}
	
	@RequestMapping("/about")
	public String about(Model model) {
		return "about";
	}
	
	@RequestMapping(value ="/listmain", method = RequestMethod.GET)
	public String select (Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		model.addAttribute("list", listService.select(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(listService.selectCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "/list/listmain";
	}
	
	
	@RequestMapping("/favorite")
	public String favorite(Model model) {
		return "/favorite/favo";
	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		return "/login/login";
	}

	@RequestMapping("/contact")
	public String contact(Model model) {
		return "/contact";
	}
	
	
	
}
