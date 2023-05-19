package com.group3.tofu.gift.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.group3.tofu.gift.model.bean.Gift;
import com.group3.tofu.gift.model.bean.ShoppingCart;
import com.group3.tofu.gift.service.GiftService;
import com.group3.tofu.gift.service.ShoppingCartService;

@Controller
public class GiftController {
	@Autowired
	private GiftService gService;
	
	@Autowired
	private ShoppingCartService spcService;
	
	@GetMapping("/showGift")
	public String giftIndex(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber, Model model) {
		
		List<Gift> gifts = gService.findAllGift();
		model.addAttribute("gifts", gifts);
		
		Page<Gift> page = gService.findByPage(pageNumber);
		model.addAttribute("page", page);
		
		
		List<ShoppingCart> carts = spcService.findByCustomerId(2);
		int count = carts.size();
		model.addAttribute("count", count);
		
		
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
		
		
		List<ShoppingCart> carts = spcService.findByCustomerId(2);
		int count = carts.size();
		model.addAttribute("count", count);

		return "gift/showGift";
	}
	
//顯示上傳商品頁面	
	@GetMapping("/gift/showUpload")
	public String uploadAction() {
	
		return "mgm/gift/uploadGift";
	}
//上傳商品	
	@PostMapping("/gift/upload")
	public String uploadAction(@RequestParam(name = "name",required = false) String name,
								@RequestParam(name = "desc",required = false) String desc,
								@RequestParam(name = "price",required = false) Integer price,
								@RequestParam(name = "type",required = false) String type,
								@RequestParam("file")MultipartFile  file) throws IOException {
		Gift gift = new Gift();
		gift.setName(name);
		gift.setDesc(desc);
		gift.setPrice(price);
		gift.setType(type);
		gift.setPhoto(file.getBytes());
		gService.save(gift);
		
		return "redirect:/gift/findGifts";
	}
	
//	顯示商品修改頁面
	@GetMapping("gift/showUpdate")
	public String showupdate(@RequestParam(name = "id",defaultValue = "1") Integer pageNumber, Model model) {
		
		Gift gift = gService.findById(pageNumber);
		model.addAttribute("gift", gift);
		
		return "mgm/gift/updateGift";
	}
//	商品修改	
	@GetMapping("gift/updateGift")
	public String updateGift(@RequestParam(name = "id") Integer id,
			@RequestParam(name = "name") String name,
			@RequestParam(name = "desc") String desc,
			@RequestParam(name = "price") Integer price,
			@RequestParam(name = "type") String type,Model model) {
		
		Gift gift = gService.findById(id);
		model.addAttribute("gift", gift);
		gift.setName(name);
		gift.setDesc(desc);
		gift.setPrice(price);
		gift.setType(type);
		gService.save(gift);
		
		return "redirect:/gift/findGifts";
	}
	
	
	@GetMapping("gift/findGifts")
	public String findGifts(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber, Model model) {
		
		Page<Gift> page = gService.findByPage(pageNumber);
		model.addAttribute("page", page);
		
		return "mgm/gift/showAllGift" ;
	}
	
	
	//商品上下架BY AJAX
	@ResponseBody
	@GetMapping("gift/isEnable")
	public Gift isEnable(@RequestParam(name = "id") Integer id) {
		
		Gift gift = gService.findById(id);

		if(gift.isEnabled()) {
			gift.setEnabled(false);
		}else {
			gift.setEnabled(true);
		}
		
		Gift savedGift = gService.save(gift);
		
//		return "redirect:/gift/findGifts" ;
		return gift;
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
		
		List<ShoppingCart> carts = spcService.findByCustomerId(2);
		int count = carts.size();
		model.addAttribute("count", count);
		
		
		
		
		
		return"gift/showGift2";
	}
}
