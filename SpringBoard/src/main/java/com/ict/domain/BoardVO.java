package com.ict.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

// lombok을 이용해 get-setter, 생성자, toString을 만들어 주세요.

@Data
public class BoardVO {
	private long bno;
	private List<Integer> numList;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;
	
}
