package com.study.springboot.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import com.study.springboot.dao.IOne2oneDao;
import com.study.springboot.dto.One2oneDto;

@Component
public class One2oneService {
	@Autowired
	private	IOne2oneDao one2onedao;
	
    /*
     * public List<One2oneDto> one2oneList(String one2one_id, String page, int
     * num_page_size){
     * 
     * int num_page_no = Integer.parseInt( page );
     * int startRowNum = (num_page_no - 1) * num_page_size + 1;
     * int endRowNum = (num_page_no * num_page_size);
     * 
     * List<One2oneDto> one2oneList = one2onedao.one2oneList(one2one_id,
     * startRowNum, endRowNum);
     * return one2oneList;
     * }
     */
	
	public One2oneDto one2oneDetail(int one2one_idx) {
		One2oneDto one2oneDetail = one2onedao.one2oneDetail(one2one_idx);
		return one2oneDetail;
	}
	
	public int one2oneCount(String one2one_id) {
		int one2oneCount = one2onedao.one2oneCount(one2one_id);
		return one2oneCount;
	}
	
	//사진 업로드
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
	
	public int insertOne2one(One2oneDto dto) {
		int insertOne2one = one2onedao.insertOne2one(dto);
		return insertOne2one;
	}
	
	public int updateStatus(One2oneDto dto) {
	    int updateStatus = one2onedao.updateStatus(dto);
	    return updateStatus;
	}
	
	public int deleteOne2one(int one2one_idx) {
	    int deleteOne2one = one2onedao.deleteOne2one(one2one_idx);
	    return deleteOne2one;
	}
}
