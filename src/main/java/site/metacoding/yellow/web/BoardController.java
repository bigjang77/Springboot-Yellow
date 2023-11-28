package site.metacoding.yellow.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;

import site.metacoding.yellow.domain.Board;
import site.metacoding.yellow.domain.BoardRepository;

@Controller
public class BoardController {


	@Autowired
	private BoardRepository boardRepository;

	@GetMapping("/board")//보드테이블의 데이터를 뷰에 담아줘
	public String getBoard(Model model) {
		//더미 데이터 만들기

		return "board/list";
	}
	

	
	@GetMapping("/board/{id}")
	public String getBoardOne(@PathVariable Integer id, Model model) {
		

		




		return "board/detail";
	}

	@PutMapping("/board/save")
	public String saveBoard() {
		


		return "board/save";
	}
}
