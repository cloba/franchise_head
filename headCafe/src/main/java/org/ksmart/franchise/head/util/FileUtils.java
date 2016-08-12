package org.ksmart.franchise.head.util;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	//파일이 저장될 위치를 지정합니다
	private static final String filePath = "C:\\franchise\\contracts\\";
     
    public Map<String,Object> parseInsertFileInfo(HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
         
        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
         
        //클라이언트에서 전송된 파일정보들을 담아서 반환해줄 list를 만듭니다
        Map<String, Object> fileMap = null; 
         
        //지정한 저장경로에 해당폴더가 없으면 폴더를 생성합니다
        File file = new File(filePath);
        if(file.exists() == false){
            file.mkdirs();
        }
        
        //파일 정보를 받아서 새로운 이름으로 변경합니다
    	multipartFile = multipartHttpServletRequest.getFile("file");
    	
        if(multipartFile.isEmpty() == false){
            originalFileName = multipartFile.getOriginalFilename();
            originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            storedFileName = CommonUtils.getRandomString() + originalFileExtension;
             
            file = new File(filePath + storedFileName);
            //지정된 경로에 파일을 저장합니다
            multipartFile.transferTo(file);
             
            //위에서 만든 정보를 list에 추가합니다
            fileMap = new HashMap<String,Object>();
            fileMap.put("originalName", originalFileName);
            fileMap.put("storedName", storedFileName);
            fileMap.put("fileSize", multipartFile.getSize());
        }
        
        return fileMap;
    }
}
