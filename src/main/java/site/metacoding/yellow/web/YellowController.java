package site.metacoding.yellow.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class YellowController {

	@GetMapping("/yellow")
	public String yellow() {
		return "index";
	}

	@GetMapping("/blue")
	public String blue() {
		return "blue";
	}

	@GetMapping("/red")
	public String red() {
		return "red";
	}



	@PostMapping("/save")
	public String save() {
		System.out.println("좌표입력완료");
		return null;
	}
	



}