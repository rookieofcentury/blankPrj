package com.blank.app.common.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.blank.app.goods.vo.GoodsVo;
import com.blank.app.goods.vo.ReviewVo;
import com.blank.app.project.vo.ProjectVo;

public class FileUploader {

	// 굿즈 - 파일 업로드
	public static List<String> upload(HttpServletRequest req, GoodsVo vo) {

		List<String> list = new ArrayList<String>();
		
		for(int i = 0; i < vo.getThumbnailFile().size(); i++) {
			
			String path = req.getSession().getServletContext().getRealPath("/resources/upload/goods/");
			String originName = vo.getThumbnailFile().get(i).getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf("."), originName.length());
			// xxxxxxx.png (뒤에서부터 3자리. , 파일명 길이)
	
			String changeName = "goods_" + System.nanoTime() + ext; // goods_현재 시간
	
			File target = new File(path + changeName);
	
			try {
				vo.getThumbnailFile().get(i).transferTo(target);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			list.add(changeName);
			
		}

		return list;

	}

	// 프로젝트 - 파일 업로드
	public static String upload(HttpServletRequest req, ProjectVo vo) throws IllegalStateException, IOException {

		String path = req.getSession().getServletContext().getRealPath("/resources/upload/project/");
		String originName = vo.getPrjfile().getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."), originName.length());

		String changeName = "prj_" + System.nanoTime() + ext;

		File target = new File(path + changeName);
		vo.getPrjfile().transferTo(target);
	
		return changeName;
	}
	
	// 리뷰 - 파일 업로드
	public static String upload(HttpServletRequest req, ReviewVo vo) throws IllegalStateException, IOException {
		
		String path = req.getSession().getServletContext().getRealPath("/resources/upload/review/");
		String originName = vo.getReviewFile().getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."), originName.length());

		String changeName = "review_" + System.nanoTime() + ext;

		File target = new File(path + changeName);
		vo.getReviewFile().transferTo(target);
		
		return changeName;
		
	}

}
