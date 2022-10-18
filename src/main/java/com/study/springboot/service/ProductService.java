package com.study.springboot.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import com.study.springboot.dao.IProductDao;
import com.study.springboot.dto.ProductDto;
@Component
public class ProductService {
	@Autowired
	private	IProductDao productdao;
	
	public List<ProductDto> productlist(String category) {
		List<ProductDto> productlist = productdao.productlist(category);
		return productlist;
	}
	
	public ProductDto productDetail(int product_idx) {
		ProductDto productDetail = productdao.productDetail(product_idx);
		return productDetail;
	}

	public List<ProductDto> item_list() {
		List<ProductDto> item_list = productdao.item_list();
		return item_list;
	}

	public int item_Count() {
		int item_Count = productdao.item_Count();
		return item_Count;
	}

	public List<ProductDto> item_result(String search, String text) {
		List<ProductDto> item_result = productdao.item_result(search,text);
		return item_result;
	}

	public int deleteProduct(int idx) {
		int deleteProduct = productdao.deleteProduct(idx);
		return deleteProduct;
	}

	public int product_count(String category) {
		int product_count = productdao.product_count(category);
		return product_count;
	}

	public List<ProductDto> productDetail(String product_idx) {
		List<ProductDto> productDetail = productdao.productDetail(product_idx);
		return productDetail;
	}

	private static String SAVE_PATH = "/upload/";
	private static String PREFIX_URL = "/upload/";
	
	public String restore(MultipartFile multipartFile) {
		
		String url = null;
		String savefileName = "";
		
		try {
			String savepath = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			System.out.println("savepath:" + savepath);
			
			savepath = savepath.replace("\\", "/");
			System.out.println("savepath2 : " + savepath);
			savepath = savepath.replace("/bin/main/static", "/src/main/resources/static");
			System.out.println("savepath3 : " + savepath);
			SAVE_PATH = savepath;
			PREFIX_URL = savepath;
			
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length()); //lastIndexOf(".")확장자
			Long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			//"20210114121803123.jpg"
			savefileName = genSaveFileName(extName);
			
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + savefileName);
			
			writeFile(multipartFile, savefileName);
			url = PREFIX_URL + "/" + savefileName;
		}
		catch(IOException e) {
			
		}

		return "/upload/" + savefileName;
	}
	
	// 현재 시간을 기준으로 파일 이름 생성
	// "20210114121803123.jpg"
	private String genSaveFileName(String extName) {
		String fileName = "";
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		return fileName;
	}
		
	// 파일을 실제로 write 하는 메서드
	private void writeFile(MultipartFile multipartFile, String saveFileName) throws IOException{
		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();
		return;
	}

	public int insert_Product(ProductDto dto) {
		int insert_Product = productdao.insert_Product();
		return insert_Product;
	}

	public int revise_result(ProductDto dto) {
		int revise_result = productdao.revise_result();
		return revise_result;
	}

	public int product_revise(Map<String, Object> map) {
		int product_revise = productdao.product_revise(map);
		return product_revise;
	}

	public List<ProductDto> searchProduct(String word, String sort, String page, 
			int num_page_size) {
		
		int num_page_no = Integer.parseInt( page );
		int startRowNum = (num_page_no - 1) * num_page_size + 1;
		int endRowNum = (num_page_no * num_page_size);
		
		System.out.println(startRowNum +","+endRowNum);
		
		List<ProductDto> searchProduct = productdao.searchProduct(word, sort, 
				startRowNum, endRowNum);
		System.out.println(searchProduct);
		return searchProduct;
	}

	public int productCount(String word) {
		int productCount = productdao.productCount(word);
		return productCount;
	}

}
