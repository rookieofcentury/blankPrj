package com.blank.app.admin.common;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import lombok.Data;

@Data
public class PageVo {

	private int listCount;		//총 게시글 갯수
	private int currentPage;	//현재 페이지
	private int pageLimit;		//페이징 바 최대갯수
	private int boardLimit;		//게시글 최대갯수
	
	private int maxPage;		//가장 마지막 페이지
	private int startPage;		//페이징바 시작 페이지
	private int endPage;		//페이징바 종료 페이지
	
}
