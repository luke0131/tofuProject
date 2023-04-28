package com.group3.tofu.gift.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group3.tofu.gift.model.bean.Gift;
import com.group3.tofu.gift.service.GiftService;

@Controller
public class GiftController {
	@Autowired
	private GiftService gService;
	
	@GetMapping("/showGift")
	public String giftIndex(Model model) {
		List<Gift> gifts = gService.findAllGift();
		model.addAttribute("gifts", gifts);
		
		Gift gift = gService.findById(1);
		model.addAttribute("gift", gift);
		return "gift/showGift";
	}
}
