package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.FAQService;
import com.example.demo.vo.FAQ;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class FAQController {

	@Autowired
	private FAQService faqService;

	@RequestMapping("/usr/home/main")
	public String home() {

		return "/usr/home/main";
	}

	@RequestMapping("/usr/FAQ/search")
	public String search(Model model, HttpServletRequest req, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "") String searchKeyword) {
		int faqCount = faqService.getFAQCount(searchKeyword);

		int itemsInAPage = 10;
		int pagesCount = (int) Math.ceil(faqCount / (double) itemsInAPage);

		List<FAQ> FAQ = faqService.getForPrintFAQ(itemsInAPage, page, searchKeyword);

		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("faqCount", faqCount);
		model.addAttribute("FAQ", FAQ);

		return "/usr/FAQ/search";
		
	}

}
