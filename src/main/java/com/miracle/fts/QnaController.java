package com.miracle.fts;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.miracle.fts.DTO.AnswerVO;
import com.miracle.fts.DTO.PageMaker;
import com.miracle.fts.DTO.QnaVO;
import com.miracle.fts.DTO.SearchCriteria;
import com.miracle.fts.service.AnswerService;
import com.miracle.fts.service.QnaService;



@Controller
public class QnaController {
	
	@Autowired
	QnaService service;
	
	@Autowired
	AnswerService answerService;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/q_writeView", method = RequestMethod.GET)
	public String writeView() throws Exception{
		return "qna/writeView";
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/q_write", method = RequestMethod.POST)
	public String write(QnaVO qnaVO) throws Exception{
		
		service.write(qnaVO);
		
		return "redirect:qna";
	}
	
	

	// qna 게시판 목록 조회

	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "qna/list";
		
	}
	
	
	// 게시판 조회
	
	
	@RequestMapping(value = "/q_readView", method = RequestMethod.GET)
	public String read(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
	
		model.addAttribute("read", service.read(qnaVO.getQ_uid()));
		model.addAttribute("scri", scri);
		
		List<AnswerVO> answerList = answerService.readAnswer(qnaVO.getQ_uid());
		model.addAttribute("answerList", answerList);
		return "qna/readView";
	}
	
	// 게시판 수정뷰

	
		@RequestMapping(value = "/q_updateView", method = RequestMethod.GET)
		public String updateView(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
	
			model.addAttribute("update", service.read(qnaVO.getQ_uid()));
			model.addAttribute("scri", scri);
			
			return "qna/updateView";
		}
	
	// 게시판 수정

	
		@RequestMapping(value = "/q_update", method = RequestMethod.POST)
		public String update(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{

			service.update(qnaVO);
			
			rttr.addAttribute("q_uid", qnaVO.getQ_uid());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:q_readView";
		}
	

	// 게시판 삭제

		@RequestMapping(value = "/q_delete", method = RequestMethod.POST)
		public String delete(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
	
			service.delete(qnaVO.getQ_uid());
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:qna";
		}
		
		//댓글 작성
		@RequestMapping(value="/q_answerWrite", method = RequestMethod.POST)
		public String answerWrite(AnswerVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		
			answerService.writeAnswer(vo);
			
			rttr.addAttribute("q_uid", vo.getQ_uid());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:q_readView";
		}
		
		//댓글 수정 GET
		@RequestMapping(value="/q_answerUpdateView", method = RequestMethod.GET)
		public String answerUpdateView(AnswerVO vo,QnaVO qnaVO, SearchCriteria scri, Model model) throws Exception {
			
			model.addAttribute("read", service.read(qnaVO.getQ_uid()));
			model.addAttribute("answerUpdate", answerService.selectAnswer(vo.getA_uid()));
			model.addAttribute("scri", scri);
			List<AnswerVO> answerList = answerService.readAnswer(qnaVO.getQ_uid());
			model.addAttribute("answerList", answerList);
			
			return "/qna/answerUpdateView";
		}
		
		//댓글 수정 POST
		@RequestMapping(value="/q_answerUpdate", method = RequestMethod.POST)
		public String answerUpdate(AnswerVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			
			answerService.updateAnswer(vo);
			
			rttr.addAttribute("q_uid", vo.getQ_uid());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:q_readView";
		}
		
		//댓글 삭제 GET
//		@RequestMapping(value="/q_answerDeleteView", method = RequestMethod.GET)
//		public String answerDeleteView(AnswerVO vo, SearchCriteria scri, Model model) throws Exception {
//			
//			model.addAttribute("answerDelete", answerService.selectAnswer(vo.getA_uid()));
//			model.addAttribute("scri", scri);
//			
//
//			return "board/q_answerDeleteView";
//		}
		
		//댓글 삭제 post
		@RequestMapping(value="/q_deleteAnswer", method = RequestMethod.POST)
		public String deleteAnswer(AnswerVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			
			answerService.deleteAnswer(vo.getA_uid());
			//service.delete(qnaVO.getQ_uid());
			
			rttr.addAttribute("q_uid", vo.getQ_uid());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:q_readView";
		}
	
	
}