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
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping("/findByEnable")
	public String findByEnable(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber, Model model) {
		
		Page<Gift> page = gService.findByEnable(pageNumber);
		List<Gift> gifts = page.getContent();
		for (Gift gift : gifts) {
			System.out.println(gift.getName());
		}
		model.addAttribute("page", page);

		return "gift/showGift";
	}
	
	//商品修改
//	@GetMapping("gift/updateGift")
//	public String updateGift(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber, Model model) {
//		
//		Page<Gift> page = gService.findByPage(pageNumber);
//		model.addAttribute("page", page);
//		
//		return "gift/showAllOrder";
//	}
	
	
	@GetMapping("gift/findGifts")
	public String findGifts(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber, Model model) {
		
		Page<Gift> page = gService.findByPage(pageNumber);
		model.addAttribute("page", page);
		
		return "mgm/gift/showAllOrder" ;
	}
	
	
	
//	@ResponseBody
	@GetMapping("gift/isEnable")
	public String isEnable(@RequestParam(name = "id",defaultValue = "1") Integer id) {
		
		Gift gift = gService.findById(id);

		if(gift.isEnabled()) {
			gift.setEnabled(false);
		}else {
			gift.setEnabled(true);
		}
		
		Gift savedGift = gService.save(gift);
		
		return "redirect:/gift/findGifts" ;
//		return gift;
	}
	
	@GetMapping("/showGift/{id}")
	public ResponseEntity<byte[]> findPhotoById(@PathVariable Integer id) {
		Gift gift = gService.findById(id);
		byte[] photo = gift.getPhoto();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		
		return new ResponseEntity<byte[]>(photo, headers, HttpStatus.OK);
	}
	@GetMapping("showGift/findBySearch")
	public String findBySearch(@RequestParam(name = "search",required = false)String search,
							   @RequestParam(name = "p",defaultValue = "1") Integer pageNumber,
							   Model model) {
		int startItem = 0 + (pageNumber-1)*9;
		List<Gift> gifts;
		if(!search.equals("")) {
			gifts = gService.findBySearch(search, startItem);			
		}else {
			return"redirect:/showGift";
		}
		model.addAttribute("gifts", gifts);
		return"gift/showGift2";
	}
	
	@GetMapping("showGift/findByOption")
	public String findByOption(@RequestParam(name = "tool",required = false)String tool,
							   @RequestParam(name = "food",required = false)String food,
							   @RequestParam(name = "elec",required = false)String elec,
							   @RequestParam(name = "drink",required = false)String drink,
							   @RequestParam(name = "outdoor",required = false)String outdoor,
							   @RequestParam(name = "min",required = false)Integer min,
							   @RequestParam(name = "max",required = false)Integer max,
							   @RequestParam(name = "p",defaultValue = "1") Integer pageNumber,
							   Model model) {
		int startItem = 0 + (pageNumber-1)*9;
		

		if(tool==null && food==null && elec==null && drink==null && outdoor==null && min==null && max==null) {
			return"redirect:/showGift";
		}
		
		
		List<Gift> gifts = gService.findByOption(tool, food, elec, drink, outdoor, min, max,startItem);
		
		model.addAttribute("gifts", gifts);
		
		return"gift/showGift2";
	}
}
