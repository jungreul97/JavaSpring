package com.ict.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ict.domain.BoardVO;
import com.ict.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;



// 컨트롤러가 컨트롤러 기능을 할 수 있도록 처리해주세요.
@Controller
@Log4j
public class BoardController {
	
	// 전체 회원을 보려면, 회원목록을 들고오는 메서드를실행해야 하고
	// 그러면, 그메서드를 보유하고 있는 클래스를 선언하고 주입해줘야 합니다.
	// 참고) BoardMapperTests.java
	
	@Autowired
	private BoardMapper boardMapper;
	
	// 전체 글 목록을 불 수 있는 페이지인 boardList.jsp로 연결되는
	// boardList 주소를 get방식으로 선언해주세요.
	// 메서드 내부에서는 boardMapoper의 .getAllLIst를 호출해 그 결과를 바인딩 합니다.
	@GetMapping("/boardList")
	public String boardList(Model model) {
		List<BoardVO> boardList = boardMapper.getList();
		model.addAttribute("boardList",boardList);
		return "boardList";
	}
	
	// 글 하나만 조회할 수 있는 디테일 페이지인 boardDetail.jsp로 연결되는
	// /boardDetail 주소를 get방식으로 선언해주세요.
	// 주소 뒤에 ?bno=번호 형식으로 적힌 번 호 글만 조회합니다.
	@GetMapping("/boardDetail")
	public String boardDetail(long bno,Model model) {
		BoardVO board = boardMapper.select(bno);
		model.addAttribute("board",board);
		return "boardDetail";
	}
}