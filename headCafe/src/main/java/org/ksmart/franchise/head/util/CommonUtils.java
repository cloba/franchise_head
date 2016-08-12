package org.ksmart.franchise.head.util;

import java.util.UUID;

public class CommonUtils {
	//32글자의 랜덤문자를 만들어서 반환하는 메서드입니다
	 public static String getRandomString(){
	        return UUID.randomUUID().toString().replaceAll("-", "");
	    }
}
