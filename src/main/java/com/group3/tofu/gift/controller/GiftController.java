package com.group3.tofu.gift.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.group3.tofu.gift.service.GiftService;

@Controller
public class GiftController {
	@Autowired
	private GiftService gService;
	
	public String giftIndex() {
		return "";
	}
}
