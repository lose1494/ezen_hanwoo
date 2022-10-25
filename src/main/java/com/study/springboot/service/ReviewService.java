package com.study.springboot.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import com.study.springboot.dao.IReviewDao;
import com.study.springboot.dto.ReviewDto;

@Component
public class ReviewService {
	@Autowired
	private	IReviewDao reviewdao;
	
	public List<ReviewDto> reviewList(String category, String value, String page, 
			int num_page_size, String sort, String word) {
		
		int num_page_no = Integer.parseInt( page );
		int startRowNum = (num_page_no - 1) * num_page_size + 1;
		int endRowNum = (num_page_no * num_page_size);
		
		List<ReviewDto> reviewList = reviewdao.reviewList(category, value, startRowNum,
				endRowNum, sort, word);
		return reviewList;
	}
	
	public int reviewCount(String sort, String value, String word) {
		int reviewCount = reviewdao.reviewCount(sort, value, word);
		return reviewCount;
	}
	
	public double reviewAvg(int product_idx) {
		double reviewAvg = reviewdao.reviewAvg(product_idx);
		return reviewAvg;
	}
	
	public List<ReviewDto> reviewGraph(int product_idx) {
		List<ReviewDto> reviewGraph = reviewdao.reviewGraph(product_idx);
		return reviewGraph;
	}
	
	private static String SAVE_PATH = "/img/customer/";
	private static String PREFIX_URL = "/img/customer/";
	
	public String restore(MultipartFile multipartFile, String users_id) {
		
		String url = null;
		String savefileName = "";
		
		//C:\Users\Gi7A-00\Documents\sprintboot\ex13_FileUploadWithParam\bin\main\static\ upload
		//C:\Users\Gi7A-00\Documents\sprintboot\ex13_FileUploadWithParam\src\main\resources\static\ upload
		try {
			System.out.println(users_id);
			String savepath = ResourceUtils.getFile("classpath:static/img/customer/").toPath().toString();
			System.out.println("savepath:" + savepath);
			savepath = savepath + "/" + users_id;
			System.out.println(users_id);
			
			savepath = savepath.replace("\\", "/");
			System.out.println("savepath2 : " + savepath);
			savepath = savepath.replace("/bin/main/static", "/src/main/resources/static");
			System.out.println("savepath3 : " + savepath);
			//C:/Users/i7D/Documents/springboot/ex13_FileUploadWithParam/src/main/resources/static/upload
			SAVE_PATH = savepath;
			PREFIX_URL = savepath;
			
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			//"20210114121803123.jpg"
			savefileName = genSaveFileName(extName);
			
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + savefileName);
			
			File file = new File(savepath);
			if(!file.exists()) {
				file.mkdirs();
				System.out.println("폴더 생성 완료");
			}
			
			writeFile(multipartFile, savefileName);
			url = PREFIX_URL + "/" + savefileName;
		}
		catch(IOException e) {
			System.out.println("파일설정 제대로 안됨");
		}
		
		// "/upload/20210114121803123.jpg"
		return "/img/customer/"+ users_id +"/"+ savefileName;
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
		System.out.println("savefile:" + SAVE_PATH + "/" + saveFileName );
		
		//C:/Users/i7D/Documents/springboot/ex13_FileUploadWithParam/src/main/resources/static/upload/20210114121803123.jpg
		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return;
	}
	
	public int insertReview(ReviewDto dto) {
		int insertReview = reviewdao.insertReview(dto);
		return insertReview;
	}
	
	public int deleteReview(int review_idx, String image) {
		
		int deleteReview = reviewdao.deleteReview(review_idx);
		String path = 
		("C:\\Users\\EZEN\\Documents\\springboot\\ezen_hanwoo\\src\\main\\resources\\static").replace("\\", "/") + image;
		
		System.out.println(path);
		File file = new File(path);
		if( file.delete() ) {
			System.out.println("파일 삭제 성공");
		}else {
			System.out.println("파일 삭제 실패");
		}
		return deleteReview;
	}

	public List<ReviewDto> review_result() {
		List<ReviewDto> review_result = reviewdao.review_result();
		return review_result;
	}


    public int review_count() { 
        int review_count = reviewdao.review_count();
        return review_count;
    }

    public List<ReviewDto> reviewResult(String searchType, String searchKeyword) {
       List<ReviewDto> reviewResult = reviewdao.reviewResult(searchType, searchKeyword);
        return reviewResult;
    }

    public List<ReviewDto> reviewDate (String fromDate, String toDate) {
        List<ReviewDto> reviewDate = reviewdao.reviewDate( fromDate , toDate);
        return reviewDate;
    }
	
//	public List<ReviewDto> searchProduct(String word, String sort) {
//		System.out.println(word);
//		List<ReviewDto> searchProduct = reviewdao.searchProduct(word, sort);
//		return searchProduct;
//	}

}
