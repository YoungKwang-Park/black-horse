package com.miracle.fts;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.miracle.fts.DTO.Criteria;
import com.miracle.fts.DTO.PageMaker;
import com.miracle.fts.DTO.ReplyDTO;
import com.miracle.fts.DTO.SearchCriteria;
import com.miracle.fts.DTO.StoreDTO;
import com.miracle.fts.DTO.StoreFileDTO;
import com.miracle.fts.service.ReplyService;
import com.miracle.fts.service.StoreFileService;
import com.miracle.fts.service.StoreService;

@Controller
public class StoreController {

	@Autowired StoreService StoreService;
	@Autowired ReplyService replyService;
	@Autowired StoreFileService storeFileService;
	
	public StoreController() {
		System.out.println("StoreService() 생성");
	}
	
	@RequestMapping(value = "/storeList", method = RequestMethod.GET)				
	public String list(Model model) throws Exception {
		model.addAttribute("list", StoreService.list());
		return "store/storeList";				
	}
	
//    @RequestMapping(value = "/listCriteria", method = RequestMethod.GET)
//    public String listCriteria(Model model, Criteria criteria) throws Exception {
//    	model.addAttribute("list", StoreService.listCriteria(criteria));
//    	return "store/list_criteria";
//    }
	
	
	
	@RequestMapping("/storeWrite") 	
	public String write(Model model) throws Exception {
		model.addAttribute("write", StoreService.list());
		return "store/storeWrite";									
	}
		
	@RequestMapping("/storeWriteOk")				
	public String writeOk(MultipartHttpServletRequest mprequest, Model model) {
//		System.out.println("테스트 중..."); 
//		System.out.println("validate 적용 후 ↓");
//		showErrors(bindingresult);
		
		String page;
		int cnt = StoreService.write(mprequest);
		if (cnt == 0) {
			page = "store/storeWrite";			
		} else {
			page = "store/storeWriteOk";
			model.addAttribute("result", cnt);
		}
//		if (bindingresult.hasErrors()) {
//			page = "store/write";			
//		} else {
//			page = "store/writeOk";
//			model.addAttribute("result", StoreService.write(dto));
//		}
		return page;	
	}
	
	
	@GetMapping("/storeView")
	public String view(int suid, StoreDTO dto, Model model, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		model.addAttribute("list", StoreService.selectBySuid(suid));
		List<ReplyDTO> replyList = replyService.readReply(cri);
		model.addAttribute("replyList", replyList);
		ReplyDTO vo = new ReplyDTO();
		model.addAttribute("suid", suid);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(replyService.listCount());
		model.addAttribute("pageMaker", pageMaker);
		List<StoreFileDTO> thList = storeFileService.getStoreFiles(suid);
		model.addAttribute("thList", thList);
		return "store/storeView";
	}
	
	@RequestMapping("/storeUpdate")
	public String update(int suid, Model model) {
		model.addAttribute("list", StoreService.selectBySuid(suid));
		return "store/storeUpdate";
	}
	
//	@RequestMapping("/updateOk")
//	public String updateOk(@Valid StoreDTO dto
//			, BindingResult bindingresult
//			, Model model) {
//		
//		System.out.println("테스트 중...");	
//		System.out.println("validate 적용 후 ↓");
//		showErrors(bindingresult);
//		
//		String page;
//		if (bindingresult.hasErrors()) {
//			page = "store/update";			
//		} else {
//			page = "store/updateOk";
//			model.addAttribute("result", StoreService.update(dto));
//		}
//		return page;	
//	}
	
	@RequestMapping("/storeUpdateOk")
	public String updateOk(StoreDTO dto, Model model) throws Exception {
		model.addAttribute("result", StoreService.update(dto));
		return "store/storeUpdateOk";
	}
	
	
	
	@RequestMapping("/storeDeleteOk")
	public String deleteOk(Integer suid, Model model) {
		model.addAttribute("result", StoreService.deleteBySuid(suid));
		return "store/storeDeleteOk";
	}
	
	
	
	//댓글 작성
	@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyDTO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
	
		replyService.writeReply(vo);

		rttr.addAttribute("suid", vo.getS_uid());
//		rttr.addAttribute("page", scri.getPage());
//		rttr.addAttribute("perPageNum", scri.getPerPageNum());
//		rttr.addAttribute("searchType", scri.getSearchType());
//		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/storeView";
	}
	
	//댓글 삭제 post
			@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
			public String deleteReply(ReplyDTO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
				
				replyService.deleteReply(vo.getC_uid());
				
				rttr.addAttribute("suid", vo.getS_uid());
//				rttr.addAttribute("page", scri.getPage());
//				rttr.addAttribute("perPageNum", scri.getPerPageNum());
//				rttr.addAttribute("searchType", scri.getSearchType());
//				rttr.addAttribute("keyword", scri.getKeyword());
//				
				return "redirect:/storeView";
			}
	
	
	
	
	
//	
//	// 에러 출력 도우미 메소드
//	private void showErrors(Errors errors) {
//		if(errors.hasErrors()) {
//			System.out.println("validate 진행 후 에러 개수: "+ errors.getErrorCount());
//			System.out.println("\t[field]\t|[code]");
//			errors.getFieldErrors();
//			List<FieldError> errList = errors.getFieldErrors();
//			
//			for(FieldError err : errList) {
//				System.out.println("\t"+err.getField() + "\t|" + err.getCode());
//			}			
//		} else {
//			System.out.println("에러 없음\n");
//		}		
//	}
//	
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		binder.setValidator(new TestValidator());
//	}
	
}



