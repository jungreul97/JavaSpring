package com.ict.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
// 클래스 위에 붙인 RequestMapping 은 해당 컨트롤러의 진입주소를 설정해 줍니ㅏㄷ.
@RequestMapping("/test")
public class TestController {
	
	@RequestMapping("/hello")
	public String sayHello() {
		return "Hello Hello";
	}
}
