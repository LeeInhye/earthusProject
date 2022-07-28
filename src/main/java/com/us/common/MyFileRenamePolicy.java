package com.us.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	// 원본파일 전달 받아서 파일명 수정작업 후 수정된 파일 반환시켜주는 메소드
	@Override
	public File rename(File originFile) {
		
		// 원본파일명 ("abcd.jpg") 
		String originName = originFile.getName();
		
		// 수정파일명 ("20220729122430_23145.jpg" => 파일업로드한 년월일시분초 + 5자리랜덤값(10000~99999) + 원본파일확장자)		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format( new Date() );
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring( originName.lastIndexOf(".") );
		
		String changeName = currentTime + "_" + ranNum + ext;
		
		return new File(originFile.getParent(), changeName);
	}

}
