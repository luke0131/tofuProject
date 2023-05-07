package com.group3.tofu.gift.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.group3.tofu.gift.model.bean.Gift;
import com.group3.tofu.gift.service.GiftService;

@Controller
public class GiftController {
	@Autowired
	private GiftService gService;
	
	@GetMapping("/showGift")
	public String giftIndex(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber, Model model) {
		
		List<Gift> gifts = gService.findAllGift();
		model.addAttribute("gifts", gifts);
		
		Page<Gift> page = gService.findByPage(pageNumber);
		model.addAttribute("page", page);
		
		for (Gift gift : page.getContent()) {
			System.out.println(gift.getId());		
		}

		return "gift/showGift";
	}
	
	@GetMapping("/showGift/{id}")
	public ResponseEntity<byte[]> findPhotoById(@PathVariable Integer id) {
		Gift gift = gService.findById(id);
		byte[] photo = gift.getPhoto();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		
		return new ResponseEntity<byte[]>(photo, headers, HttpStatus.OK);
	}
}