package common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SecurityUtil {
	public String encryptSHA256(String str){ //encryptSHA256메소드 : 외부에서 문자str을 받아서 처리
    String sha = "";
    try{
       MessageDigest sh = MessageDigest.getInstance("SHA-256");
//       int salt = (int)(Math.random()*100) +1;  //salt키를 난수로 생성 
//       str += salt; // 생성한 솔트키를 str에 붙이기
       
       sh.update(str.getBytes());
       byte byteData[] = sh.digest();
       StringBuffer sb = new StringBuffer(); //클래스에서 생성
       for(int i = 0 ; i < byteData.length ; i++){//여기서 만들어서 : 알고리즘 부분 : 이 부분을 자신의 것으로 바꿔서 사용해야 해킹 안 당함
           sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1)); //16진수로 변환처리
       }
       sha = sb.toString(); //sha=여기서 받음
   }catch(NoSuchAlgorithmException e){
       System.out.println("Encrypt Error - NoSuchAlgorithmException");
       sha = null;
   }
   return sha;
 } 
}
