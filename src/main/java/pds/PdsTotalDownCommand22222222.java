package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsTotalDownCommand22222222 implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		// idx로 DB에 저장된 파일의 정보(업로드시파일명fName/서버저장파일명fSName)를 가져온다
		PdsDAO dao = new PdsDAO();
		PdsVO vo  = dao.getPdsContent(idx);
		
		// 원본파일명과 서버저장파일명을 각각 분리시켜준다.
		String[] fNames = vo.getfName().split("/"); // 
		String[] fSNames = vo.getfSName().split("/");
		
//		int i = 0;
//		for(String fName : fNames) {
//			System.out.print((i+1) + ".원본파일 : "+fName +", ");
//			System.out.println("서버파일 : "+fSNames[i]);
//			i++;
//		}
		
		// 파일 압축 다운로드시 필요한 객체를 준비. //기존서버에저장된파일 객체를 만듦
		FileInputStream fis = null;
		FileOutputStream fos = null;
		ZipOutputStream zos = null; //집 파일로 묶어야함
		ServletOutputStream sos = null; //웹을통해 받는 서블릿
		
		// 작업에 필요한 경로 설정 / 저장시킬 압축파일명설정
		String realPath = request.getServletContext().getRealPath("/images/pds/");
		String zipPath = request.getServletContext().getRealPath("/images/pds/temp/"); //압축파일경로설정
		//zip파일은 별도 장소 필요함:같은파일을 덮어쓸 위험이 있음: temp폴더에 파일이 압축을위해 넘어올때 기존에 동일한 이름을 가진 파이링 있으면 덮어쓸 수 있음
		String zipName = vo.getTitle() + ".zip";
		
		/*저장하는걸 먼저 만드는게 좋음: 저장을 읽은걸 저장= 읽는건 읽을 떄 생성 : input읽은후->output처리 순서*/
		//원본파일을 압축/저장시킬 객체 생성
		fos = new FileOutputStream(zipPath +zipName);
		zos = new ZipOutputStream(fos);
		
		byte[] buffer = new byte[2048];
		int size = 0;
		// zip 파일 만들기... 각각의 파일을 압축처리하기 위한 각 fis을 생성후 zos에 처리한다.
		for(int i=0; i<fSNames.length; i++) {
			//여기서 인풋 넣음
			File file = new File(realPath + fSNames[i]);
			fis = new FileInputStream(file);
			zos.putNextEntry(new ZipEntry(fNames[i])); //zip파일에 넣을 때는 원본이름으로 넣어준다.
			//생성된 zip파일에 집어넣기 //데이터베이스 오리지널 파일명을 넣음
			
			while((size = fis.read(buffer)) != 0) {
				zos.write(buffer, 0, size);
			}
			zos.flush();
			zos.closeEntry();
			fis.close();
		}
		zos.close();
		
		
		
	}

}
