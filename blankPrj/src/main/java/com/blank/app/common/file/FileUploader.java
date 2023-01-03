package com.blank.app.common.file;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.blank.app.goods.vo.GoodsVo;
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

	//// 프로젝트 - 파일 업로드
	public static String upload(HttpServletRequest req, ProjectVo vo) {

			String path = req.getSession().getServletContext().getRealPath("/resources/upload/goods/");
			String originName = vo.getPrjfile().get(0).getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf("."), originName.length());

			String changeName = "prj_" + System.nanoTime() + ext;
	
			File target = new File(path + changeName);
	

		return changeName;

	}

}
