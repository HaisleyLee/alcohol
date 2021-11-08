package common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Authenticator;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service // 서비스이므로 어노테이션
//자동주입위함
public class CommonService {

	// 네이버로그인 요청API + 공공데이터약국정보 쓸 때도 사용한 요청API
	public String requestAPI(StringBuffer apiURL) {
		String result = "";
		try {
			URL url = new URL(apiURL.toString());
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.print("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
				// 스트링데이터 가져올 때 인코딩처리 없으면 한글 깨진다.

			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			result = res.toString();// res의 데이터를 스트링화해서 담는 변수result
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	// 위 메소드를 복사해서 오버로딩
	public String requestAPI(StringBuffer apiURL, String property) {
		String result = "";
		try {
			URL url = new URL(apiURL.toString());
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", property);// 이 코드를 추가해줬음.
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.print("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
				// 스트링데이터 가져올 때 인코딩처리 없으면 한글 깨진다.

			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			result = res.toString();// res의 데이터를 스트링화해서 담는 변수result
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	// 공공데이터 약국 정보를 요청해서 반환하는 메소드
	// 오픈API를 json형태로 요청하는 메소드
	public Map<String, Object> json_requestAPI(StringBuffer url) {
		org.json.JSONObject json = new org.json.JSONObject(requestAPI(url));

		json = json.getJSONObject("response");// json오브젝트변수 재사용//json내용 중 필요한 부분만 자름
		json = json.getJSONObject("body");// json오브젝트변수 재사용//json내용 중 필요한 부분만 또 자름
		int count = 0;
		if (json.has("totalCount")) {
			count = json.getInt("totalCount");
		}
		// org.json.JSONObject인 이유는 JSONObject를 다른 패키지에서 변수명으로 쓰고 있어서.
		if (json.get("items") instanceof org.json.JSONObject) {
			json = json.getJSONObject("items");
			if (json.get("item") instanceof org.json.JSONObject)// 1건이어서 items가 아니라 item이면! 추가 처리해주는 것.
				json.put("item", new org.json.JSONArray().put(0, json.get("item")));
			// 데이터가 1건만 있으면 문제가 생겨서 배열로 만들어서 보내줘야 한다.
		}

		json.put("count", count);
		return json.toMap();
	}

	// 파일 다운로드 메소드
	public void fileDownload(HttpSession session, String filepath, String filename, HttpServletResponse response) {
		session.getServletContext().getRealPath("resources");// resources오타주의

		File file = new File(session.getServletContext().getRealPath("resources") + "/" + filepath);

		String mime = session.getServletContext().getMimeType(filepath);// filepath을 통해 확장자를 뽑아내는 것

		// 혹시 확장자가 없을 수도 있어서 처리!
		if (mime == null)
			mime = "application/octet-stream";

		response.setContentType(mime);

		// 한글파일명이 깨지지 않고 저장이 되도록 하려면 아래 utf-8처리를 URLEncoder로 해줘야한다.
		try {
			filename = URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20");
			// "\\+"인 이유는 \+면 기호문자 +를 표현하고 이것을 한번 더 \로 아스키화해서 \기호문자+임.
			// 원래 파일명에 +인 것은 그대로 +로 표현됨.

			// 파일명의 띄어쓰기가 +로 바뀌어서 저장되는데,
			// 이것을 원래대로 띄어쓰로 표현 : 출력가능 아스키 문자표에서 띄어쓰기 : 20
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		response.setHeader("content-disposition", "attachment; filename=" + filename);
		// response.setHeader : 리스판스에 헤더를 셋팅하는 것.
		// 리스판스에 content-disposition를 셋팅했다고 알리는 것.

		// getOutputStream은 서블릿의 아웃풋스트림
		try {
			ServletOutputStream out = response.getOutputStream();
			// 예전에는 buffer와 flush를 썼었는데 지금은 따로 클래스가 해준다.
			FileCopyUtils.copy(new FileInputStream(file), out);// static선언된 메소드는 객체생성 안 해도 사용 가능~

			out.flush();
			// 플러쉬로 나머지도 내보내기.

		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("ServletOutputStream : " + e.getMessage());
		} // try/catch

	}

	// 파일 업로드 메소드
	public String fileUpload(HttpSession session, MultipartFile file, String category) {
		// 서버의 물리적 위치
		String resources = session.getServletContext().getRealPath("resources");// 리소스파일의 절대경로 찾아오기

		String upload = resources + "/upload";
		String folder = upload + "/" + category + "/" + new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		// Date은 java.util

		File f = new File(folder);

		if (!f.exists())
			f.mkdirs();

		String uuid = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		// 중복 안되도록.
		System.out.println(resources);

		try {
			file.transferTo(new File(folder, uuid));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return folder.substring(resources.length() + 1) + "/" + uuid;

	}
	
	
	
	
	

}
