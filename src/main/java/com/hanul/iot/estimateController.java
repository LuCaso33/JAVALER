package com.hanul.iot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class estimateController {
	//가견적 페이지로 이동
		@RequestMapping("/estimate")
		public String estimate() {
			return "include/estimate";
		}

}
