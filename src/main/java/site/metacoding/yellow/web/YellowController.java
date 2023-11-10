package site.metacoding.yellow.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;

@Controller
public class YellowController {

	@GetMapping("/yellow")
	public String yellow() {
		return "index";
	}

	@PutMapping("/addCoord")
	public String addCoord(Model model){
		
		return null;
	}
}