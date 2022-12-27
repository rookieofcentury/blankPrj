package com.blank.app.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.blank.app.member.service.MemberService;
import com.blank.app.project.service.ProjectService;
import com.blank.app.project.vo.ProjectVo;
import com.blank.app.project.vo.TimeVo;

@RequestMapping("project")
@Controller
public class ProjectController {

	@Autowired
	private ProjectService service;
	
	@GetMapping
	public String project(ProjectVo vo, Model model, @RequestParam(name="p") int p ) {
		
		ProjectVo prjVo = service.selectProject(vo,p);
		model.addAttribute("prj", prjVo);
		
		return "project/detail/info";
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
	public String postAgree() {
		return "project/post/agree";
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
	
//	@GetMapping("created")
//	public String createdStatus() {
//		return "project/created/status";
//	}
//	
	@GetMapping("created")
	public String creating(String myPrjAll, HttpSession session, ProjectVo vo, Model model) {	//myPrjAll을 MemberVo로 바꾸기
		
		List<ProjectVo> myPrj = service.selectMyPrj(vo);
		List<ProjectVo> statusAll = service.selectStatusAll(vo);
		//System.out.println(myPrj);
		session.setAttribute("myPrj", myPrj);
		model.addAttribute("statusAll", statusAll);
		return "project/created/status";
	}
	
	@GetMapping("created/delete")
	public String deletePrj(ProjectVo vo) {	//MemberVo로 바꾸기 (no)
		int result = service.deletePrj(vo);
		return "redirect:/project/created";
	}
	
	@GetMapping("created/list")
	public String createdList() {
		return "project/created/list";
	}
	

	@GetMapping("post")
	public String post() {
		return "project/post/post";
	}
	
	
	
	
	
	
	
	
	
	/*
	@PostMapping("/fileupload.do")
	@ResponseBody
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) throws IOException {
	
		//Json 객체 생성
		JsonObject json = new JsonObject();
		// Json 객체를 출력하기 위해 PrintWriter 생성
		PrintWriter printWriter = null;
		OutputStream out = null;
		//파일을 가져오기 위해 MultipartHttpServletRequest 의 getFile 메서드 사용
		MultipartFile file = multiFile.getFile("upload");
		//파일이 비어있지 않고(비어 있다면 null 반환)
		if (file != null) {
			// 파일 사이즈가 0보다 크고, 파일이름이 공백이 아닐때
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {

					try {
						//파일 이름 설정
						String fileName = file.getName();
						//바이트 타입설정
						byte[] bytes;
						//파일을 바이트 타입으로 변경
						bytes = file.getBytes();
						//파일이 실제로 저장되는 경로 
						String uploadPath = request.getServletContext().getRealPath("/resources/ckimage/");
						//저장되는 파일에 경로 설정
						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						//파일이름을 랜덤하게 생성
						fileName = UUID.randomUUID().toString();
						//업로드 경로 + 파일이름을 줘서  데이터를 서버에 전송
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);
						
						//클라이언트에 이벤트 추가
						printWriter = response.getWriter();
						response.setContentType("text/html");
						
						//파일이 연결되는 Url 주소 설정
						String fileUrl = request.getContextPath() + "/resources/ckimage/" + fileName;
						
						//생성된 jason 객체를 이용해 파일 업로드 + 이름 + 주소를 CkEditor에 전송
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.println(json);
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if(out !=null) {
							out.close();
						}
						if(printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
			return null;
	}*/

}

