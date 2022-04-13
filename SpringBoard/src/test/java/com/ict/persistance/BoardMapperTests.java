package com.ict.persistance;

import java.sql.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ict.domain.BoardVO;
import com.ict.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper boardMapper;
	
	//@Test
	public void testGetList() {
		List<BoardVO> result = boardMapper.getList();
		log.info("저장된 게시물 정보 : "+ result);
	}
	
	//@Test
	public void testInsert() {
		// vo를 입력받는 insert메서드 특성상
		// title, content, writer가 채워진 vo를 먼저 생성행 합니다.
		BoardVO vo = new BoardVO();
		log.info("채워넣기 전: "+ vo);
		
		vo.setTitle("테스트로 입력하는 제목");
		vo.setContent("테스트로 입력하는 본문");
		vo.setWriter("테스트로 입력하는 글쓴이");
		
		log.info("채워넣은 후 : "+ vo);
		// vo내부에 데이터가 바인딩된걸 확인했으니 메서드 호출
		boardMapper.insert(vo);
	}
	
	// select 메서드에 대한 테스트 코드 작성
	//@Test
	public void getSelect() {
		// 가져오기(글 번호는 두번째로 큰 번호로 해주세요.)
		boardMapper.select(5);
		// 로그 찍기
		// log.info(vo);
	}
	
	//@Test
	public void Delete() {
		// 가져오기(글 번호는 두번째로 큰 번호로 해주세요.)
		boardMapper.delete(5);
		// 로그 찍기
		// log.info(vo);
	}
	
	@Test
	public void Update() {
		BoardVO vo = new BoardVO();
		log.info("채워넣기 전: "+ vo);
		
		vo.setTitle("바뀜 입력하는 제목");
		vo.setContent("바뀐 테스트 입력하는 본문");
		vo.setBno(1);
		
		log.info("업데이트 데이터: "+vo);
		boardMapper.update(vo);
	}
}
