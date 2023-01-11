package com.blank.app.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.blank.app.admin.common.PageVo;
import com.blank.app.admin.common.Pagination;
import com.blank.app.common.file.FileUploader;
import com.blank.app.member.vo.LikeMemberVo;
import com.blank.app.member.vo.MemberVo;
import com.blank.app.pay.vo.PayListVo;
import com.blank.app.project.service.ProjectService;
import com.blank.app.project.vo.LikeProjectVo;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;
import com.blank.app.project.vo.ItemVo;
import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("project")
@Controller
@Slf4j
public class ProjectController {

	@Autowired
	private ProjectService service;
	
	/*프로젝트 조회*/
	@GetMapping
	public String project(Model model, @RequestParam(name="p") int p ) {
		
		//프로젝트 정보
		ProjectVo prjVo = service.selectProject(p);
		//프로젝트의 아이템들의 정보
		List<ItemVo> itemVo = service.selectSet(p);
		
		int fundingSum = service.selectSum(p);
		int goal = Integer.parseInt(prjVo.getPrice());
		
		String fundingPrice = String.valueOf(fundingSum);
		prjVo.setFundingSum(fundingPrice);
		
		//달성률
//		int division1 = Math.floorMod(fundingSum,goal);
		int division1 = Math.floorMod(300,1000);
		int division = Math.floorDiv(300,1000);
		
//		int division = Math.floorMod(300,1000);
		System.out.println("1" + division1);
		System.out.println(division);
		
		int percent1 = division * 100;
		int percent = division / 10;
		System.out.println(percent1);
		System.out.println(percent);
		
		prjVo.setPercent(percent);
		
		//남은 기간
		int calDate = service.selectCalDate(p);
		String calDateCnt = String.valueOf(calDate);
		prjVo.setCalDate(calDateCnt);
		
		//후원자
		int fundingQuantity = service.selectFundingQuantity(p);
		String quantityCnt = String.valueOf(fundingQuantity);
		prjVo.setFundingQuantity(quantityCnt);
		
		model.addAttribute("prj", prjVo);
		model.addAttribute("set", itemVo);
		
		return "project/detail/info";
	}
	
	/*로그인멤버 찜한 프로젝트 확인*/
	@PostMapping("mylikePrj")
	@ResponseBody
	public String mylikePrj(HttpSession session, String pno, LikeProjectVo vo){
		
		System.out.println("받아온 플젝넘버 : " + pno);
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String nick = loginMember.getNo();
		vo.setMNo(nick);
		vo.setPrjNo(pno);
		
		int likeVo = service.selectMyLikePrj(vo);
		System.out.println(likeVo);
		if(likeVo != 1) {
			return "0";
		}
		return 1+"";
	}
	
	/*찜하기 ++*/
	@PostMapping("likePlusPrj")
	@ResponseBody
	public String likePlusPrj(HttpSession session, String pno, LikeProjectVo vo){
		
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String nick = loginMember.getNo();
		vo.setMNo(nick);
		vo.setPrjNo(pno);
		
		int likeVo = service.insertLikePrj(vo);
		if(likeVo != 1) {
			return "0";
		}
		return "1";
	}
	
	/*찜하기 --*/
	@PostMapping("likeMinusPrj")
	@ResponseBody
	public String likeMinusPrj(String pno, LikeProjectVo vo, HttpSession session){
		
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String nick = loginMember.getNo();
		vo.setMNo(nick);
		vo.setPrjNo(pno);
		
		int likeVo = service.deleteLikePrj(vo);
		if(likeVo != 1) {
			return "0";
		}
		return "1";
	}
	
	/*팔로우 확인*/
	@PostMapping("followCheck")
	@ResponseBody
	public String followCheck(Model model, HttpSession session, String creator, LikeMemberVo vo){
		
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String nick = loginMember.getNo();
		vo.setMNo(nick);
		vo.setLikeMemberNo(creator);
//		System.out.println("창작자 번호 : " + creator);
		
		int result = service.followCheck(vo);
		System.out.println(result);

		if(result == 1) {
			return "1";
		}
		return "0";
	}
	
	@GetMapping("news")
	public String prjNews() {
		return "project/detail/news";
	}
	
	@GetMapping("review")
	public String prjReview() {
		return "project/detail/review";
	}
	
	@GetMapping("agree")
	public String agree() {
		return "project/post/agree";
	}
	
	@PostMapping("agree")
	@ResponseBody
	public String postAgree(HttpSession session, ProjectVo vo, String random, Model model) {
		
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String nick = loginMember.getNo();
		vo.setCreator(nick);
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("vo", vo);
		map.put("random", random);
		
		int result = service.insertPrj(map);
		
		//원래 해당 난수의 프로젝트가 있는지 체크해줘야함 ^.^..
		//result == 1이면 select 다시 해와서 모델에 담아주고 콘솔에 찎어야 보인다..
		if(result == 1) {
			model.addAttribute("prjNo", random);
		}
		
		return "result";
	}
	
	@GetMapping("post/defaultInfo")
	public String postDefaultInfo(TimeVo timevo, @RequestParam HashMap<String, String> map, Model model) {
		
		List<HashMap<String, String>> category = service.selectCategory(map);
		List<TimeVo> timeVo = service.selectStartime(timevo);
		model.addAttribute("category", category);
		model.addAttribute("time", timeVo);
		return "project/post/defaultInfo";
	}
	
	@PostMapping("post/defaultInfo")
	public String postDefaultInfo(HttpSession session, ProjectVo vo, String postPrj){
		session.setAttribute("postDefault", vo);
		
		switch (postPrj) {
		case "약관정보":
			return "project/post/agree";
		case "기본정보":
			return "project/post/defaultInfo";
		case "옵션설계":
			return "project/post/optionSet";
		case "창작자정보":
			return "project/post/creatorInfo";
		}
		return postPrj;
	}
	
	@GetMapping("post/optionSet")
	public String postOptionSet() {
		return "project/post/optionSet";
	}
	
	@GetMapping("post/optionItem")
	public String postOptionItem() {
		return "project/post/optionItem";
	}
	
	@GetMapping("post/creatorInfo")
	public String postCreatorInfo() {
		return "project/post/creatorInfo";
	}
	
	@GetMapping("created")
	public String writing(HttpSession session, ProjectVo vo, Model model) {
		
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String nick = loginMember.getNo();
		vo.setCreator(nick);
		
		int resultcnt = service.writingCnt(vo);
		
		if(resultcnt == 0) {
			model.addAttribute("msg", "작성중인 프로젝트가 없습니다!");
		}else {
			List<ProjectVo> myPrj = service.selectMyPrj(vo);
			model.addAttribute("resultcnt", resultcnt);
			session.setAttribute("myPrj", myPrj);
			//System.out.println(myPrj);
		}
		return "project/created/status";
	}
	
//	@GetMapping("created/writing")
//	@ResponseBody
//	public String writing(String statusWriting, HttpSession session, ProjectVo vo, Model model) {	
//		
//		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
//		String nick = loginMember.getNo();
//		vo.setCreator(nick);
//		
//		//ProjectVo statusAll = service.selectStatusAll(vo);
//		//List<ProjectVo> statusAll = service.selectStatusAll(vo);
//		//model.addAttribute("statusAll", statusAll);
//		
//		HashMap<String,Object> map = new HashMap<String,Object>();
//		map.put("vo", vo);
//		map.put("statusWriting", statusWriting);
//		int resultcnt = service.writingCnt(map);
//		
//		if(resultcnt == 0) {
//			return 0+"";
//		}else {
//			List<ProjectVo> myPrj = service.selectMyPrj(map);
//			session.setAttribute("myPrj", myPrj);
//		}
//		String result = (String.valueOf(resultcnt));
//		return result;
//	}
	
	@GetMapping("created/examination")
	public String examination(HttpSession session, ProjectVo vo, Model model) {	
		
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String nick = loginMember.getNo();
		vo.setCreator(nick);
		
		int resultcnt = service.examinationCnt(vo);
		
		if(resultcnt == 0) {
			model.addAttribute("msg", "심사중인 프로젝트가 없습니다!");
		}else {
			List<ProjectVo> myPrj = service.selectexamination(vo);
			model.addAttribute("resultcnt", resultcnt);
			session.setAttribute("myPrj", myPrj);
		}
		return "project/created/examination";
	}
	
	@GetMapping("created/confirm")
	public String confirm(HttpSession session, ProjectVo vo, Model model) {	
		
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String nick = loginMember.getNo();
		vo.setCreator(nick);
		
		int resultcnt = service.confirmCnt(vo);
		
		if(resultcnt == 0) {
			model.addAttribute("msg", "승인중인 프로젝트가 없습니다!");
		}else {
			List<ProjectVo> myPrj = service.selectconfirm(vo);
			model.addAttribute("resultcnt", resultcnt);
			session.setAttribute("myPrj", myPrj);
		}
		return "project/created/confirm";
	}
	
	@GetMapping("created/proceed")
	public String proceed(HttpSession session, ProjectVo vo, Model model) {	
		
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String nick = loginMember.getNo();
		vo.setCreator(nick);
		
		int resultcnt = service.proceedCnt(vo);
		
		if(resultcnt == 0) {
			model.addAttribute("msg", "진행중인 프로젝트가 없습니다!");
		}else {
			List<ProjectVo> myPrj = service.selectproceed(vo);
			model.addAttribute("resultcnt", resultcnt);
			session.setAttribute("myPrj", myPrj);
		}
		return "project/created/proceed";
	}
	
	//프로젝트 삭제
	@GetMapping("created/delete")
	@ResponseBody
	public String deletePrj(String no) {	
		
		int result = service.deletePrj(no);
		if(result == 1) {
			String result2 = Integer.toString(result);
			return result2;
		}
		return "redirect:/project/created";
	}
	
	@GetMapping("created/list")
	public String createdList() {
		return "project/created/list";
	}

	/* 프로젝트 등록 (화면) */
	@GetMapping("post")
	public String post(@RequestParam(name="p") String p, HttpSession session, TimeVo timevo, ProjectVo prjVo, MemberVo MemberVo, ItemVo itemVo, @RequestParam HashMap<String, String> map, Model model) {
		
		List<HashMap<String, String>> category = service.selectCategory(map);
		List<TimeVo> starttimeVo = service.selectStartime(timevo);
		
		log.warn("pno : " + p);
		
		HashMap<String,Object> prjMap = new HashMap<String,Object>();
		prjMap.put("prjVo", prjVo);
		prjMap.put("p", p);
		
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String nick = loginMember.getNo();
		MemberVo.setNo(nick);
		
		itemVo.setPrjNo(p);
		
		ProjectVo prjInfo = service.selectPrjInfo(prjMap);
		MemberVo memberInfo = service.selectMemberInfo(MemberVo);
//		ItemVo itemInfo = service.selectItemInfo(itemVo);
		
		//JsonObject jsonObj = JsonParser.parseString(timeVo).getAsJsonObject();
		/*Gson gson = new Gson(); String timeVo = gson.toJson(starttimeVo);*/
		System.out.println("time" + starttimeVo);
		model.addAttribute("category", category);
		model.addAttribute("time", starttimeVo);
		model.addAttribute("prjInfo", prjInfo);
		model.addAttribute("memberInfo", memberInfo);
		
		return "project/post/post";
	}
	
	/* 임시저장 */
	@PostMapping(value = "savePrj", produces = "application/json; charset=utf8")
	@ResponseBody
//	public String savePrj(@RequestParam Map<String,String> map,HttpSession session, HttpServletRequest req) throws IllegalStateException, IOException {
		public String savePrj(ProjectVo prjVo, MemberVo MemberVo, ItemVo itemVo, HttpSession session, HttpServletRequest req) throws IllegalStateException, IOException {
		System.out.println(prjVo);
		System.out.println(MemberVo);
		System.out.println(itemVo);
		
//		System.out.println(map);
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String nick = loginMember.getNo();
		prjVo.setCreator(nick);
		prjVo.setNo(itemVo.getPrjNo());
		System.out.println(prjVo);
		MemberVo.setNo(nick);
		
		//파일 저장
		String changeName = "";
		if(!prjVo.isEmpty()) {
			changeName = (String) FileUploader.upload(req, prjVo);
		}
		prjVo.setChangeName(changeName);
		
		//file, form 먼저 보내기
		System.out.println("보냇음");
		int setResult = service.updateSet(itemVo);
		if(setResult < 10) {
			System.out.println("보냇음22");
			int prjResult = service.updatePrj(prjVo);
			
			if(prjResult < 10) {
				System.out.println("보냇음33");
				int creatorResult = service.updateCreator(MemberVo);
			}
		}
		return "1";
	}
	
	/* 심사 요청*/
	@PostMapping("post")
	public String prjPost(Model model, ProjectVo prjVo, MemberVo MemberVo, ItemVo itemVo, HttpSession session, HttpServletRequest req) throws IllegalStateException, IOException {
		
		System.out.println("심사요청");
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String nick = loginMember.getNo();
		prjVo.setCreator(nick);
		prjVo.setNo(itemVo.getPrjNo());
		MemberVo.setNo(nick);
		
		//파일 저장
		String changeName = "";
		if(!prjVo.isEmpty()) {
			changeName = (String) FileUploader.upload(req, prjVo);
		}
		prjVo.setChangeName(changeName);
		
		//int result = service.tempPrj(vo);
		int setResult = service.updateSet(itemVo);
		if(setResult > 1) {
			int prjResult = service.updateExamination(prjVo);
			
			if(prjResult > 1) {
				int creatorResult = service.updateCreator(MemberVo);
			}
		}
		//model.addAttribute("msg", "심사요청 완료!");
		return "redirect:/project/created/";
	}
	
	/*결제*/
	@PostMapping("pay")
	@ResponseBody
	public String pay(String no) {
		return "1";
	}
	
	// 검색
		@GetMapping("search")
		public String searchPrj(String keyword, String category, String p, String standard, Model model) {
			
			if(p == null) {
				p = "1";
			}
			
			Map<String, String> map = new HashMap<>();
			map.put("category", category);
			map.put("keyword", keyword);
			map.put("standard", standard);
			
			int listCount = service.searchListCount(map);
			int currentPage = Integer.parseInt(p);
			int boardLimit = 12;
			int pageLimit = 5;
			PageVo pageVo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
			
			List<ProjectVo> list = service.searchPrjList(map, pageVo);
			
			model.addAttribute("listCount", listCount);
			model.addAttribute("pageVo", pageVo);
			model.addAttribute("ProjectList", list);
			model.addAttribute("category", category);
			model.addAttribute("keyword", keyword);
			model.addAttribute("standard", standard);
			
			return "project/search";
			
		}
}