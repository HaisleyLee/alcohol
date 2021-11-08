package com.ateam.web;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
//import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import VO.joindata1VO;
import VO.mem_info_tbVO;
import common.CommonService;
import member.MemberServiceImpl;

@Controller
public class MemberController {
	private String naverClientID = "9vVxFyu4g6qNOY3FqYV4";
	private String naverClientSecret = "I6gaJr7QgW";
	private String kakaoClientID = "7d86f17a1636ffa2099518c98427b7a0";

	// @Autowired private CommonService serviceMail;
	@Autowired
	private CommonService cmservice;

	@Autowired
	private MemberServiceImpl service;

	// 주소자동지정
	@Autowired
	private CommonService common;
	
	
	
	
	/*------- 이메일인증 ------*/
	/*
	 * @PostMapping("/CheckMail") // AJAX와 URL을 매핑시켜줌
	 * 
	 * @ResponseBody //AJAX후 값을 리턴하기위해 작성
	 * 
	 * public String SendMail(String mail) { Random random=new Random(); //난수 생성을 위한
	 * 랜덤 클래스 String key=""; //인증번호
	 * 
	 * SimpleMailMessage message = new SimpleMailMessage(); message.setTo(mail);
	 * //스크립트에서 보낸 메일을 받을 사용자 이메일 주소 //입력 키를 위한 코드 for(int i =0; i<3;i++) { int
	 * index=random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성 key+=(char)index; } int
	 * numIndex=random.nextInt(9999)+1000; //4자리 랜덤 정수를 생성 key+=numIndex;
	 * message.setSubject("인증번호 입력을 위한 메일 전송"); message.setText("인증 번호 : "+key);
	 * javaMailSender.send(message); return key; }
	 */
	
	
	
	/* ---------------------------------- 카카오로그인 */
	
	//소셜로그인 - 카카오//https://developers.kakao.com/
	@RequestMapping("/kakaologin")
	public String kakaoLogin(HttpSession session) {
		
		String state = UUID.randomUUID().toString();
		session.setAttribute("state", state);
		
		//카카오 로그인 샘플
		//https://kauth.kakao.com/oauth/authorize?response_type=code
										//&client_id={REST_API_KEY}
										//&redirect_uri={REDIRECT_URI}
		//http://192.168.0.12/iot/kakaocallback 콜백
		StringBuffer url = new StringBuffer(
				"https://kauth.kakao.com/oauth/authorize?response_type=code");
		url.append("&client_id=").append(kakaoClientID);
		url.append("&state=").append(state);
		url.append("&redirect_uri=http://221.156.48.92:8081/alcoholweb/kakaocallback");
		
		return "redirect:" + url.toString();//해당 리턴값은 주소창에 url을 입력하고 새로고침같은 엔터를 입력한다는 뜻
	}
	/*
	Name	Type	Description	Required
	code	String	토큰 받기 요청에 필요한 인가 코드	O
	state	String	CSRF 공격을 차단하기 위해 사용되는 파라미터로, 요청 시 보낸 state 값과 동일한 state 값이 전달됨	X
	error	String	인증 실패 시 반환되는 에러 코드	X
	error_description	String	인증 실패 시 반환되는 에러 메시지	X
	 */
	
	//카카오로그인 : 요청을 받을 준비 : 메소드선언
	@RequestMapping("/kakaocallback")
	public String kakaocallback(HttpSession session, String code, String state, String error, Model model) {
		if( error!=null 
				|| ! state.equals((String)session.getAttribute("state")) ) 
			return "redirect:/";
			//에러가 null이 아니다 : 문제가 발생했다.
		//state.equals((String)session.getAttribute("state")) ) : 혹은 state 값을 가져왔는데, 상태가 같다.
		//"redirect:/"; : 새로고침하는데, 메인으로~
			
		
		//아래 카카오에서 제공하는 샘플코드를 참고로하여
		/*curl -v -X POST "https://kauth.kakao.com/oauth/token" \
		 -H "Content-Type: application/x-www-form-urlencoded" \
		 -d "grant_type=authorization_code" \
		 -d "client_id={REST_API_KEY}" \
		 --data-urlencode "redirect_uri={REDIRECT_URI}" \
		 -d "code={AUTHORIZE_CODE}"*/
		
		//아래처럼 작성할 수 있어야 한다.
		StringBuffer url = new StringBuffer(
				"https://kauth.kakao.com/oauth/token?grant_type=authorization_code");
		url.append("&client_id=").append(kakaoClientID);
		url.append("&code=").append(code);
		
		/*
		Response: 성공
		HTTP/1.1 200 OK
		Content-Type: application/json;charset=UTF-8
		{
		    "token_type":"bearer",
		    "access_token":"{ACCESS_TOKEN}",
		    "expires_in":43199,
		    "refresh_token":"{REFRESH_TOKEN}",
		    "refresh_token_expires_in":25184000,
		    "scope":"account_email profile"
		}
		위 코드 보고 아래처럼 작성*/
		JSONObject json = new JSONObject( cmservice.requestAPI(url) );
		JSONObject jsonkakao_account = new JSONObject( cmservice.requestAPI(url) );
		JSONObject jsonprofile = new JSONObject( cmservice.requestAPI(url) );
		String token_type = json.getString("token_type");
		String access_token = json.getString("access_token");
		String social_email = "";
		//발급받은 토큰으로 사용자프로필정보를 요청한다.
		
		/*
		Request
		액세스 토큰 사용
		URL
		POST /v1/user/logout HTTP/1.1
		Host: kapi.kakao.com
		Authorization: Bearer {ACCESS_TOKEN}
		*/
		url = new StringBuffer("https://kapi.kakao.com/v2/user/me");
		
		json = new JSONObject(cmservice.requestAPI(url, token_type + " " + access_token) );
		//정상적으로 작동하는지 보는 태그
		System.out.println(token_type + " " + access_token);
		
		/* 사용자정보 가져오기 : https://developers.kakao.com/docs/latest/ko/kakaologin/rest-api#request-token
				Response: 성공
		HTTP/1.1 200 OK
		{
		    "id":123456789,
		    "kakao_account": { // kakao_account역시 {}로 엮인 json파일임.
		        "profile_needs_agreement": false,
		        "profile": {
		            "nickname": "홍길동",
		            "thumbnail_image_url": "http://yyy.kakao.com/.../img_110x110.jpg",
		            "profile_image_url": "http://yyy.kakao.com/dn/.../img_640x640.jpg",
		            "is_default_image":false
		        },
		        "email_needs_agreement":false, 
		        "is_email_valid": true,   
		        "is_email_verified": true,   
		        "email": "sample@sample.com",
		        "age_range_needs_agreement":false,
		        "age_range":"20~29",
		        "birthday_needs_agreement":false,
		        "birthday":"1130",
		        "gender_needs_agreement":false,
		        "gender":"female"
		    },  
		    "properties":{
		        "nickname":"홍길동카톡",
		        "thumbnail_image":"http://xxx.kakao.co.kr/.../aaa.jpg",
		        "profile_image":"http://xxx.kakao.co.kr/.../bbb.jpg",
		        "custom_field1":"23",
		        "custom_field2":"여"
		        ...
		    }
		}
		 */
		
		if( ! json.isEmpty() ) {
			
			System.out.println(json);
			
			
			mem_info_tbVO vo = new mem_info_tbVO();
			vo.setSocial_type("kakao");
			vo.setMem_social_type("kakao");//카카오를 소셜타입에 넣는다

			try {
				vo.setMem_email( Integer.toString(json.getInt("id")) );
				vo.setMem_kakao_id(json.getInt("id") );//
				/* vo.setMem_email( json.get("id").toString() ); */
			} catch (Exception e) {
				e.printStackTrace();
				vo.setMem_email( "null" );
			}
			/*try {
				vo.setMem_kakao_id( json.getInt("id") );
				System.out.println("카카오id : " + json.getInt("id"));
			} catch (Exception e) {
				e.printStackTrace();
				vo.setMem_kakao_id( 0 );
			}*/
			
			jsonkakao_account = json.getJSONObject("kakao_account");
			try {
				social_email = jsonkakao_account.getString("email");
				System.out.println("카카오이메일 : " +jsonkakao_account.getString("email"));
				vo.setMem_kakao( jsonkakao_account.getString("email") );
				System.out.println("vo.getMem_kakao() : "+ vo.getMem_kakao());
				vo.setSocial_email( jsonkakao_account.getString("email") );
			} catch (Exception e) {
				e.printStackTrace();
				vo.setSocial_email( "null" );
			}
			
			
			jsonprofile = jsonkakao_account.getJSONObject("profile");
			try {
				//닉네임넣기
				vo.setMem_kakao_nickname( jsonprofile.getString("nickname") );
				System.out.println("카카오카카오닉네임 : " +jsonprofile.getString("nickname"));
				vo.setMem_nickname( jsonprofile.getString("nickname") );
				System.out.println("카카오닉네임 : " +jsonprofile.getString("nickname"));
			} catch (Exception e) {
				e.printStackTrace();
				vo.setMem_nickname( "null" );
			}
			try {
				vo.setMem_profile_imgpath( jsonprofile.getString("thumbnail_image_url") );
				System.out.println("카카오프로필사진주소 : " +jsonprofile.getString("thumbnail_image_url"));
			} catch (Exception e) {
				e.printStackTrace();
				vo.setMem_profile_imgpath( "null" );
			}
			try {
				vo.setMem_gender( (jsonkakao_account.getString("gender")).equals("female") ? "F" : "M" );//해당 회원의 성별 정보를 카카오으로부터 json타입으로 받아와서 vo에 넣는다.
				System.out.println("카카오성별 : " +jsonkakao_account.getString("gender"));
			} catch (Exception e) {
				vo.setMem_gender ( "F" );
			}
			//json.getJSONObject("profile");//뽑는 정보가 2개 이상이면 리스트선언해야하지만,
			//현재는 1개 뿐이므로 바로 뽑아서 선언 가능
			
			System.out.println("service.member_social_email_kakao(vo) : " + service.member_social_email_kakao(vo));
			
			model.addAttribute("vo",vo);
			
			//위의 카카오정보가 존재하면 이미 로그인해본 적 있는 회원
			if(service.member_social_email_kakao(vo)) {//DB에 데이터가 있는 경우: 회원정보를 업데이트 한다.
				System.out.println("기존에 로그인한 내역이 있는 카카오소셜회원입니다.");
				System.out.println("카카오업데이트 시도 vo.getMem_email(): " +vo.getMem_email());
				System.out.println("카카오업데이트 시도 social_email: " +social_email);
				vo = service.member_select_email(vo.getMem_email());
				vo.setSocial_email(social_email);
				
				System.out.println("카카오업데이트 시도 social_id: " +vo.getMem_id());
				
				Boolean resultupdate = service.member_social_update_kakao(vo);
				if(resultupdate) {
					System.out.println("카카오로그인성공 : " + vo.getMem_id());
					session.setAttribute("loginInfo", vo);
					session.setAttribute("mem_profile_imgpath", vo.getMem_profile_imgpath());
				} else {
					System.out.println("카카오로그인실패 : 어딘가 오류남");					
				}
				
			} else {//DB에 데이터가 없는 경우: 회원정보를 인서트 한다.
				System.out.println("처음 카카오소셜로그인한 회원입니다.");
				
				/* service.member_social_update_kakao(vo); */
				//추가적인 취향 데이터 넣기!!
				System.out.println("회원가입1차성공");
				//service.member_social_insert_kakao(vo); //추가 정보 더 받고 인서트
				session.setAttribute("loginInfo", vo);
				session.setAttribute("mem_profile_imgpath", vo.getMem_profile_imgpath());
				
				return "member/login/socialupdate";
			}
			//세션에 로그인정보 담기
			/* session.setAttribute("loginInfo", vo); */
			
		
		}
		
		
		return "redirect:/";
	}//kakaocallback()
	
	
	/* -------------------------------------- 네이버 소셜로그인 */
	
	
	//소셜로그인 - 네이버 : https://developers.naver.com/main/
		@RequestMapping("/naverlogin")
		public String naverLogin(HttpSession session) {
			
			//네이버개발자센터 -> 개발가이드 -> 네아로 개발가이드 -> 요청문 샘플
			//https://nid.naver.com/oauth2.0/authorize?response_type=code
			//&client_id=CLIENT_ID
			//&state=STATE_STRING
			//위의 state는 임의로 만들어낸 값임.
			//&redirect_uri=CALLBACK_URL
			
			String state = UUID.randomUUID().toString();//이 값을  세션에 넣어두고
			//파라미터로 넣은 값과 같은지 확인하는 절차가 필요함
			session.setAttribute("state", state);
			
			StringBuffer url = new StringBuffer("https://nid.naver.com/oauth2.0/authorize?response_type=code");
			url.append("&client_id=").append(naverClientID);//변수에 담은 값을 get방식으로 넘기도록
			url.append("&state=").append(state);//변수에 담은 값을 get방식으로 넘기도록
			url.append("&redirect_uri=http://221.156.48.92:8081/alcoholweb/navercallback");//네이버개발자센터에서 미리입력한 uri
			
			return "redirect:"+url.toString();
			//return "redirect:"+url.toString(); 해당 리턴값은 주소창에 url을 입력하고 새로고침같은 엔터를 입력한다는 뜻
		}
		/*
		네이버 로그인과 정보 제공 동의 과정이 완료되면 콜백 URL에 code값과 state 값이 URL 문자열로 전송됩니다. code 값은 접근 토큰 발급 요청에 사용합니다.
		API 요청 실패시에는 에러 코드와 에러 메시지가 전송됩니다.
		
		Callback 응답 정보
		
		API 요청 성공시 : http://콜백URL/redirect?code={code값}&state={state값}
		API 요청 실패시 : http://콜백URL/redirect?state={state값}&error={에러코드값}&error_description={에러메시지}
		성공할 때만 code값이 넘어온다.
		실패할 때만 error에러코드값이 넘어온다.
		 */
		@RequestMapping("navercallback")
		public String navercallback(String state, String code, String error, HttpSession session) {
			//성공하면 파라미터값에 데이터가 담기고,
			//실패하면 파라미터값에 데이터가 담기지 않고 null
			
			//state는 naverLogin메소드에서 session에 담은 적 있음.
			//상태토큰이 일치하지 않거나 요청실패시 바로 홈으로 연결
			if( !state.equals((String)session.getAttribute("state")) || code==null ) {
				//문자열비교 : 일치하지 않으면 혹은 code가 null이면(실패했으면)
				//문자열비교를 위해 String캐스팅이 필요하다
				
				//네이버의 로그인 사용자 정보를 가져오는 처리
				return "redirect:/";
				//return "redirect:/";리다이렉트를 root루트로 보내서 새로고침
				
			} else {//문자열비교 : 일치하면
				//네이버의 로그인 사용자 정보를 가져오는 처리를 할 수 없다.
				/*
				Callback으로 전달받은 정보를 이용하여 접근 토큰을 발급받을 수 있습니다. 
				접근 토큰은 사용자가 인증을 완료했다는 것을 보장할 수 있는 인증 정보입니다.
				이 접근 토큰을 이용하여 프로필 API를 호출하거나 오픈API를 호출하는것이 가능합니다.
				메서드		요청 URL								출력 포맷	설명
				GET / POST	https://nid.naver.com/oauth2.0/token	json	접근토큰 발급 요청
				요청 변수명	타입	필수 여부	기본값	설명
	grant_type	string	Y	-	인증 과정에 대한 구분값
	1) 발급:'authorization_code'
	2) 갱신:'refresh_token'
	3) 삭제: 'delete'
	client_id	string	Y	-	애플리케이션 등록 시 발급받은 Client ID 값
	client_secret	string	Y	-	애플리케이션 등록 시 발급받은 Client secret 값
	code	string	발급 때 필수	-	로그인 인증 요청 API 호출에 성공하고 리턴받은 인증코드값 (authorization code)
	state	string	발급 때 필수	-	사이트 간 요청 위조(cross-site request forgery) 공격을 방지하기 위해 애플리케이션에서 생성한 상태 토큰값으로 URL 인코딩을 적용한 값을 사용
	refresh_token	string	갱신 때 필수	-	네이버 사용자 인증에 성공하고 발급받은 갱신 토큰(refresh token)
	access_token	string	삭제 때 필수	-	기 발급받은 접근 토큰으로 URL 인코딩을 적용한 값을 사용
	service_provider	string	삭제 때 필수	'NAVER'	인증 제공자 이름으로 'NAVER'로 세팅해 전송

	그 아래
	요청문 샘플 : https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=jyvqXeaVOVmV&client_secret=527300A0_COq1_XV33cf&code=EIc5bFrl4RibFls1&state=9kgsGTfH4j7IyAkg
	//사용자 프로필API를 호출할 때 사용할 접근토큰 발행요청
	요청문 샘플 : https://nid.naver.com/oauth2.0/token?grant_type=authorization_code
	&client_id=jyvqXeaVOVmV
	&client_secret=527300A0_COq1_XV33cf
	&code=EIc5bFrl4RibFls1
	&state=9kgsGTfH4j7IyAkg
				 */
				StringBuffer url = new StringBuffer("https://nid.naver.com/oauth2.0/token?grant_type=authorization_code");
				url.append("&client_id=").append(naverClientID);
				url.append("&client_secret=").append(naverClientSecret);
				url.append("&code=").append(code);
				url.append("&state=").append(state);
				/*
				접근 토큰 요청에 성공하면 다음과 같이 접근 토큰과 갱신 토큰이 포함된 JSON 형식의 결괏값을 반환받습니다.
				*/
				
				// import org.json.JSONObject; 형태로 받아오기
				//JSON 형식의 결괏값을 반환받습니다
				JSONObject json = new JSONObject( cmservice.requestAPI(url) );
				String access_token = json.getString("access_token"); //접근토큰
				String token_type = json.getString("token_type"); //토큰타입
				
				//네이버의 로그인 사용자프로필 정보 가져오기
				//요청 URL 정보 : https://openapi.naver.com/v1/nid/me
				//Authorization: {토큰 타입] {접근 토큰]
				url = new StringBuffer("https://openapi.naver.com/v1/nid/me");
				
				//그 다음, 헤더에 정보를 넣어줘야 함
				//그것을 위해 CommonService에 requestAPI를 오버로드한 메소드를 만듦.
				
				
				
				
				
				cmservice.requestAPI(url, token_type + " " + access_token);//필요한 데이터 넣어주기
				//										ㄴ공백임
				//Authorization: {토큰 타입] {접근 토큰]
				//							ㄴ여기가 공백
				
				//출력 결과 참고 : https://developers.naver.com/docs/login/devguide/devguide.md#3-4-5-%EC%A0%91%EA%B7%BC-%ED%86%A0%ED%81%B0%EC%9D%84-%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC-%ED%94%84%EB%A1%9C%ED%95%84-api-%ED%98%B8%EC%B6%9C%ED%95%98%EA%B8%B0
				//출력 결과도 JSON형식이다.
				// resultcode : "00" 문자열임.
				
				/*
				사용자 프로필 조회 요청에 성공하면 다음과 같이 JSON 형식으로 된 결괏값을 반환받습니다.
				
				https://developers.naver.com/docs/login/web/web.md 참고
				{
				  "resultcode": "00",
				  "message": "success",
				  "response": {
				    "email": "openapi@naver.com",
				    "nickname": "OpenAPI",
				    "profile_image": "https://ssl.pstatic.net/static/pwe/address/nodata_33x33.gif",
				    "age": "40-49",
				    "gender": "F",
				    "id": "32742776",
				    "name": "오픈 API",
				    "birthday": "10-01"
				  }
				}
				*/
				
				//출력결과가 json이므로 ↓
				json = new JSONObject( cmservice.requestAPI(url, token_type+" "+access_token));
				if(json.getString("resultcode").equals("00")) {//resultcode가 "00"과 일치하면 데이터 가져올 수 있다.
					//resultcode : API 호출 결과 코드
					
					System.out.println(json);
					
					json = json.getJSONObject("response");//출력결과 json코드 중 사용자의 정보 담긴 부분은 "response": { 임.
					mem_info_tbVO vo = new mem_info_tbVO(); // 멤버VO에 담기위해
					/*
					 * System.out.println("json.getString(\'profile_image\') : " +
					 * json.getString("profile_image"));
					 */
				
					vo.setSocial_type("naver");
					vo.setMem_social_type("naver");
					/* vo.setId(json.getString("id")); */
					try {
						vo.setMem_email(json.getString("id"));
					} catch (Exception e) {
						e.printStackTrace();
						vo.setMem_email("null");
					}
					try {
						vo.setMem_naver_id(json.getString("id"));					
					} catch (Exception e) {
						e.printStackTrace();
						vo.setMem_naver_id("null");					
					}
					try {
						vo.setMem_naver(json.getString("email"));//멤버vo의 email지역변수가 아닌Social_email에 담음 
					} catch (Exception e) {
						e.printStackTrace();
						vo.setMem_naver("null");//멤버vo의 email지역변수가 아닌Social_email에 담음 
					}
					try {
						vo.setSocial_email(json.getString("email"));//멤버vo의 email지역변수가 아닌Social_email에 담음 
					} catch (Exception e) {
						e.printStackTrace();
						vo.setMem_naver("null");//멤버vo의 email지역변수가 아닌Social_email에 담음 
					}
					try {
						vo.setMem_gender(json.getString("gender").equals("F") ? "F" : (json.getString("gender").equals("M") ? "M" : "U") );
					} catch (Exception e) {
						e.printStackTrace();
						vo.setMem_gender( "F" );
					}
					try {
						//네이버에서 성별은 F, M, U로 체크되어있음.
						vo.setMem_name(json.getString("name"));
					} catch (Exception e) {
						e.printStackTrace();
						vo.setMem_name("null");
					}
					try {
						vo.setMem_nickname(json.getString("nickname"));
					} catch (Exception e) {
						e.printStackTrace();
						vo.setMem_nickname("null");
					}
					/*
					 * try { vo.setMem_profile_imgpath(json.getString("profile_image")); } catch
					 * (Exception e) { e.printStackTrace(); vo.setMem_profile_imgpath("null"); }
					 */
					try {
						vo.setMem_phone(json.getString("mobile").replace("-", ""));
					} catch (Exception e) {
						e.printStackTrace();
						vo.setMem_phone("null");
					}
					
					System.out.println("vo.getMem_email() :" + vo.getMem_email());
					System.out.println("vo.getMem_id :" + vo.getMem_id());
					System.out.println("vo.getSocial_email() :" + vo.getSocial_email());
					System.out.println("vo.getMem_profile_imgpath() :" + vo.getMem_profile_imgpath());
					//네아로 로 처음 로그인 한 경우 회원정보를 insert, 아니면 update를 한다.
					//처음 로그인했는지 여부 : id가 존재하는지 검증하는 메소드
					if(service.member_social_email_naver(vo)) {
						//true이면 예전에 회원가입해서 회원정보가 있는 소셜회원
						//있는 경우 update
						service.member_social_update_naver(vo);
						session.setAttribute("loginInfo", vo);
						session.setAttribute("mem_profile_imgpath", vo.getMem_profile_imgpath());
						
					} else {
						//false이면 회원정보가 없음.
						//없는 경우 insert
						service.member_social_insert_naver(vo);
					}
					//위와 같이 회원정보 insert혹은 update 후,
					//세션에 로그인 정보를 넣어놓자!
					session.setAttribute("loginInfo", vo);
					
					System.out.println("네이버로그인+회원가입성공");
					
				}
				
				return "redirect:/";
			}
		}
	
	
	/*----------------------------- 회원가입 */

	@RequestMapping("/join")
	public String join(HttpSession session) {
		return "member/join/join";
	}

	@RequestMapping("/join2")
	public String join2(HttpSession session, Model model, joindata1VO vo) {
		model.addAttribute("vo", vo);
		return "member/join/join2";
	}

	@RequestMapping("/join4")
	public String join4(HttpSession session, Model model, joindata1VO vo) {
		model.addAttribute("vo", vo);
		
		
		
		return "redirect:login";
	}

	@RequestMapping("/join3")
	public String join3(HttpSession session, MultipartFile file, Model model, mem_info_tbVO vo) {
		model.addAttribute("vo", vo);

		// 첨부파일이 있다면
		if (!file.isEmpty()) {
			vo.setMem_profile_imgname(file.getOriginalFilename());

			// common.fileUpload(HttpSession, MultipartFile, "저장할 경로");
			vo.setMem_profile_imgpath(common.fileUpload(session, file, "board"));
		}

		System.out.println("vo.getMem_email() : " + vo.getMem_email());
		System.out.println("vo.getMem_name()" + vo.getMem_name());
		System.out.println("vo.getMem_gender()" + vo.getMem_gender());
		System.out.println("vo.getMem_phone()" + vo.getMem_phone());
		System.out.println("vo.getMem_address()" + vo.getMem_address());
		System.out.println("vo.getMem_post()" + vo.getMem_post());
		System.out.println("vo.getMem_pw()" + vo.getMem_pw());
		System.out.println("vo.getMem_nickname()" + vo.getMem_nickname());
		System.out.println("vo.getMem_body()" + vo.getMem_body());
		System.out.println("vo.getMem_alcohol_bv()" + vo.getMem_alcohol_bv());
		System.out.println("vo.getMem_alcohol_type()" + vo.getMem_alcohol_type());
		System.out.println("vo.getMem_flavor()" + vo.getMem_flavor());
		System.out.println("vo.getMem_smell()" + vo.getMem_smell());
		System.out.println("vo.getMem_profile_imgname()" + vo.getMem_profile_imgname());
		System.out.println("vo.getMem_profile_imgpath()" + vo.getMem_profile_imgpath());

		String updatebirth = vo.getMem_birth().replaceAll("-", "");
		vo.setMem_birth(updatebirth);
		System.out.println("vo.getMem_birth()" + vo.getMem_birth());
		service.member_join(vo);

		model.addAttribute("vo", vo);
		
		System.out.println("일반회원가입성공");

		return "member/join3";
	}

	/* -------------------------------- 로그인 */

	@RequestMapping("/login")
	public String login(HttpSession session, HttpServletRequest httpServletRequest) {

		return "member/login/login";
	}

	@ResponseBody
	@RequestMapping("/login2") // 로그인페이지에서 로그인버튼 클릭시 여기로 옮.
	// public int iotlogin(String id, String pw, HttpSession session) {
	// 이상하게 boolean이나 int타입으로 리턴하는 경우에 안 먹음. ↓ String으로..
	// 위와 같을 때 pom.xml에 Jackson Core , Jackson Databind 을 추가해서 설치하면 String이외에도
	// boolean이나 int도 쓸 수 있게 됨.
	public boolean iotlogin(String mem_email, String mem_pw, HttpServletResponse response , HttpSession session, HttpServletRequest httpServletRequest,
			String loginse) {
		System.out.println(loginse);
		String ip = "";
		String mem_auto_ip = "";
		String comname = "";
	      //기존에 로그인 세션값이 존재한다면 기존 값을 제거한다.
	      /*if(session.getAttribute("loginInfo") != null) {
	         session.removeAttribute("loginInfo");
	      }*/

		/* 자동로그인 */
		if (loginse != null) {
			if (loginse.equals("auto")) {
				// 회원번호를 쿠키에 지정한다
			    Cookie c = new Cookie("loginCookie", mem_email) ;
			     
			    // 쿠키에 설명을 추가한다
			    c.setComment("자동로그인이메일") ;
			     
			    // 쿠키 유효기간을 설정한다. 초단위 : 60*60*24*7 = 7일
			    c.setMaxAge(60*60*24*7) ;
			     
			    // 응답헤더에 쿠키를 추가한다.
			    response.addCookie(c) ;
				/*
				 * 아이피가져오기 ip = getClientIp(httpServletRequest); System.out.println("ip : "+ip);
				 * 
				 * 기기명가져오기 comname =
				 */
				try {
					// local host의 InetAddress 객체 가져오기
					InetAddress loopbackAddress = InetAddress.getLoopbackAddress();
					System.out.println("loopbackAddress : " + loopbackAddress.toString());

					InetAddress inad = InetAddress.getLocalHost();
					/* comname / ip주소 */
					System.out.println("getLocalHost : " + inad.toString());
					mem_auto_ip = inad.toString();
					/* ip주소 */
					/* ip = inad.getHostAddress(); */
					System.out.println("hostAddress : " + inad.getHostAddress());
					/* comname */
					comname = inad.getHostName();
					System.out.println("hostName : " + inad.getHostName());
					System.out.println("canonicalHostName : " + inad.getCanonicalHostName());
					System.out.println("isSiteLocalAddress : " + inad.isSiteLocalAddress());
					System.out.println("isLinkLocalAddress : " + inad.isLinkLocalAddress());
					System.out.println("isReachable : " + inad.isReachable(10));

					byte[] byteArr = inad.getAddress();
					for (byte b : byteArr) {
						System.out.println("byte : " + b);
					}

					InetAddress[] inetArr = InetAddress.getAllByName("localhost");
					for (InetAddress i : inetArr) {
						System.out.println("inetArr : " + i);
					}
				} catch (UnknownHostException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_email", mem_email);
		map.put("mem_pw", mem_pw);
		if (mem_auto_ip != null) {
			map.put("mem_auto_ip", mem_auto_ip);
			int autoresult = service.member_loginauto(map);
			System.out.println("autoresult : " + autoresult);
		}
		mem_info_tbVO vo = null;
		try {
			vo = service.member_login(map);
		} catch (Exception e) {
			System.out.println("로그인실패1: 회원정보없음.");
		}
		// System.out.println(vo.getName());
		try {
			if(vo == null) {
				System.out.println("로그인실패2: 회원정보없음.");
			} else {
				session.setAttribute("loginInfo", vo);
				session.setAttribute("mem_profile_imgpath", vo.getMem_profile_imgpath());
				System.out.println("일반로그인성공");
				System.out.println(vo.getMem_email());
				System.out.println(vo.getMem_id());
				System.out.println(vo.getMem_pw());
			}			
		} catch (Exception e) {
			System.out.println("로그인실패3: 회원정보없음.");
		}
		
		
		return vo == null ? false : true;
	}

	/* ---------------------------------- 로그아웃 */

	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response ) {

		// 카카오 로그인인 경우 카카오서비스 로그아웃도 함께
		/*mem_info_tbVO vo = (mem_info_tbVO) session.getAttribute("loginInfo");*/
		Object object = session.getAttribute("loginInfo"); //세션에 저장되어있는 값을 가져온다.
		mem_info_tbVO vo = null;
		vo = (mem_info_tbVO) object;
		if(object != null) {   //세션으로부터 값이 존재하는 경우
			session.removeAttribute("loginInfo");
			session.invalidate();// 세션 전체를 날려버림
		}
		String social = null;
		try {
			if (vo.getMem_social_type() != null) {
				social = vo.getMem_social_type();// vo.getSocial_type()이 값으로 naver인지 kakao인지, null인지 알아야 함.
			}
		} catch (Exception e) {
			social = null;
		}
		int ipdeletesult = 0;
		try {
			Cookie user = new Cookie("loginCookie", "");
			//새로운 user 인스턴스 생성 (값 초기화)
			user.setMaxAge(0);
			response.addCookie(user);//쿠키에 초기화된 user정보를 보냄
			/*
			 * response.sendRedirect("loginFrm.jsp");//로그아웃 후 로그인페이지로 연결
			 */
			} catch (Exception e) {
			
		}
		

		try {
			if (vo.getMem_auto_ip() != null) {
				ipdeletesult = service.member_ipdelete(vo);
				System.out.println("로그아웃성공! : " + ipdeletesult);
			}			
		} catch (Exception e) {
			System.out.println("일반로그아웃실패");
		}

		if (social != null && social.equals("kakao")) {
			// 소셜값이 null이 아니고, kakao에 해당될 때.
			// 아래는 카카오디벨로퍼의 로그아웃시 사용되는 샘플코드
			// curl -v -X GET "https://kauth.kakao.com/oauth/logout
			// ?client_id={YOUR_REST_API_KEY} 변수값1
			// &logout_redirect_uri={YOUR_LOGOUT_REDIRECT_URI}" 변수값2

			StringBuffer url = new StringBuffer("https://kauth.kakao.com/oauth/logout");
			url.append("?client_id=").append(kakaoClientID);
			url.append("&logout_redirect_uri=http://221.156.48.92:8081/alcoholweb/");

			return "redirect:" + url.toString();
			// 만약 카카오소셜로그인이 되어있으면, 카카오소셜로그인을 로그아웃시킨다.
			
			/*
			 * session.removeAttribute("loginInfo"); session.invalidate();// 세션 전체를 날려버림
			 */			
			
		} else {
			
		}
		return "redirect:/";

	}

	
	
	/*
	 * // Member매핑 이용해서 join.jsp까지 이동하는것.
	 * 
	 * @RequestMapping("member") public String member(HttpSession session) {
	 * session.setAttribute("category", "join"); return "member/join"; }
	 */

	
	/* ------------------------------- ip주소 가져오기 */
	
	public static String getClientIp(HttpServletRequest req) {
		String ip = req.getHeader("X-Forwarded-For");
		if (ip == null)
			ip = req.getRemoteAddr();
		return ip;
	}
	
	
	
	
	//소셜로그인 때, 회원정보 없는 최초 로그인시 회원정보 입력하게 하기
	@RequestMapping("/socialupdatego")
	public String socialupdatego(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model, mem_info_tbVO vo, String real_mem_profile_imgpath, MultipartFile file) {
		System.out.println("카카오회원 가입 처리중 socialupdatego : " + vo.getMem_nickname());
		
		// 첨부파일이 있다면
		if (!file.isEmpty()) {
			vo.setMem_profile_imgname(file.getOriginalFilename());

			// common.fileUpload(HttpSession, MultipartFile, "저장할 경로");
			vo.setMem_profile_imgpath(common.fileUpload(session, file, "board"));
		}
		//작성자가 작성한 정보 가져왔는지 확인 : vo
		System.out.println("vo.getMem_id() : " + vo.getMem_id());
		System.out.println("vo.getMem_kakao_id() : " + vo.getMem_kakao_id());
		System.out.println("vo.getMem_email() : " + vo.getMem_email());
		System.out.println("vo.getMem_name()" + vo.getMem_name());
		System.out.println("vo.getMem_gender()" + vo.getMem_gender());
		System.out.println("vo.getMem_phone()" + vo.getMem_phone());
		System.out.println("vo.getMem_address()" + vo.getMem_address());
		System.out.println("vo.getMem_post()" + vo.getMem_post());
		System.out.println("vo.getMem_pw()" + vo.getMem_pw());
		System.out.println("vo.getMem_nickname()" + vo.getMem_nickname());
		System.out.println("vo.getMem_body()" + vo.getMem_body());//취향
		System.out.println("vo.getMem_alcohol_bv()" + vo.getMem_alcohol_bv());//취향
		System.out.println("vo.getMem_alcohol_type()" + vo.getMem_alcohol_type());//취향
		System.out.println("vo.getMem_flavor()" + vo.getMem_flavor());//취향
		System.out.println("vo.getMem_smell()" + vo.getMem_smell());//취향
		System.out.println("vo.getMem_profile_imgname()" + vo.getMem_profile_imgname());
		System.out.println("vo.getMem_profile_imgpath()" + vo.getMem_profile_imgpath());
		if(vo.getMem_profile_imgpath() == null) {
			vo.setMem_profile_imgpath(real_mem_profile_imgpath);
			System.out.println("회원이 프로필사진 안 바꿔서 기존 카카오프로필사진 사용시 vo.getMem_profile_imgpath()" + vo.getMem_profile_imgpath());
		}
		String updatebirth = vo.getMem_birth().replaceAll("-", "");
		vo.setMem_social_type("kakao");
		vo.setMem_birth(updatebirth);
		System.out.println("변경된 vo.getMem_birth()" + vo.getMem_birth());//생일에서 '-'을 제외 
		vo.setMem_pw("kakao");//카카오회원은 비번이 없으므로 kakao로 통일
		vo.setMem_profile_imgname("kakao");//카카오회원은 이미지url로 프로필사진을 가져오므로, 파일명은 kakao로 통일
		//이제 소셜 가입시킴
		boolean resultkakaoinsert = service.member_social_insert_kakao(vo);
		System.out.println("카카오회원 첫 로그인 결과 resultkakaoinsert : " + resultkakaoinsert);
		if(resultkakaoinsert) {
			System.out.println("카카오회원 첫 로그인 성공함. DB에 추가됨");
		} else {
			System.out.println("카카오회원 첫 로그인 실패. 어딘가 오류남 ");			
		}
		mem_info_tbVO vo2 = (mem_info_tbVO)service.member_select_email(Integer.toString(vo.getMem_kakao_id()));//바뀐 소셜회원정보를 가져오기
		session.setAttribute("loginInfo", vo2);
		session.setAttribute("mem_profile_imgpath", vo2.getMem_profile_imgpath());
		
		
		return "member/resultsocialupdate";
	}
	
	
	//이메일검증:이메일검증되었는지
	@ResponseBody
	@RequestMapping(value = "/mem_email_check", method = { RequestMethod.POST })	
	public String mem_email_check(@RequestParam("mem_email") String mem_email, HttpSession session) {
		System.out.println("mem_email : " +mem_email);
		String result = "";
		int resultnum = service.mem_email_check(mem_email);
		if(resultnum == 1) {
			result = "no";//이미 존재해서 쓸 수 없음
		} else {
			result = "ok";//존재하는 이메일이 아니라서 쓸 수 있음.
		}
		
		return result;
	}//mem_email_check
	
	
	
	//이메일검증:이메일보내기
	@ResponseBody
	@RequestMapping(value = "/emailsendcode", method = { RequestMethod.POST })	
	public String emailsendcode(@RequestParam("mail") String mail, HttpSession session) {
		//이메일검증
			System.out.println("도달 mail : " + mail);
	        String recipient = mail;//받는사람
	        String code = "";//난수코드
	        
	        //난수생성
	        Random random=new Random();  //난수 생성을 위한 랜덤 클래스
			String key="";  //인증번호 

			//입력 키를 위한 난수코드
			for(int i =0; i<3;i++) {
				int index=random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성
				key+=(char)index;
			}
			int numIndex=random.nextInt(9999)+1000; //4자리 랜덤 정수를 생성
			key+=numIndex;
			System.out.println("난수코드 : " + key);
			code = key;
			
	        // 1. 발신자의 메일 계정과 비밀번호 설정
	        final String user = "testlee1112@gmail.com";
	        final String password = "test0000.";
	 
	        // 2. Property에 SMTP 서버 정보 설정
	        Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.port", 465);
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.ssl.enable", "true");
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	 
	        // 3. SMTP 서버정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스 생성
	        Session session2 = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });
	 
	        // 4. Message 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성한다.
	        // 5. Transport 클래스를 사용하여 작성한 메세지를 전달한다.
	 
	        MimeMessage message = new MimeMessage(session2);
	        try {
	            message.setFrom(new InternetAddress(user));
	 
	            // 수신자 메일 주소
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
	 
	            //제목
	            message.setSubject("술장고 회원가입을 위한 이메일 확인 코드입니다.");
	 
	            //내용
	            message.setText("술장고 가입을 환영합니다. ["+code+"]를 회원가입 코드란에 입력해주세요.");
	 
	            //보내기
	            Transport.send(message);
	 
	 
	        } catch (AddressException e) {
	            e.printStackTrace();
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        }
	 
	    
	    return code;
	}
	
	
	//@ResponseBody
	@RequestMapping("/emailsearch")	
	public String emailsearch() {
	
		return "member/emailsearch";
	}
	//@ResponseBody
	@RequestMapping("/pwsearch")	
	public String pwsearch() {
		
		return "member/pwsearch";
	}
	//@ResponseBody
	@RequestMapping("/emailsearch2")	
	public String emailsearch2(String mem_nickname, String mem_phone, Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_nickname", mem_nickname);
		map.put("mem_phone", mem_phone);
		try {
			mem_info_tbVO mvo = service.emailsearch2(map);
			
			System.out.println("mvo.getMem_email(): "+ mvo.getMem_email());
			model.addAttribute("mem_email", mvo.getMem_email());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("해당되는 이메일 결과 없음");
		}
		
		return "member/emailsearchresult";
	}
	//@ResponseBody
	@RequestMapping("/pwsearch2")	
	public String pwsearch2(String mem_email, String mem_nickname, String mem_phone, Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_email", mem_email);
		map.put("mem_nickname", mem_nickname);
		map.put("mem_phone", mem_phone);
		
		try {
			mem_info_tbVO mvo = service.pwsearch2(map);
			
			System.out.println("mvo.getMem_pw(): "+ mvo.getMem_pw() );
			model.addAttribute("mem_pw", mvo.getMem_pw());
		} catch (Exception e) {
			System.out.println("해당되는 비밀번호 찾기 결과 없음");
		}
		
		return "member/pwsearchresult";
	}
	
	
}
