package member;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import VO.mem_info_tbVO;
import common.CommonService;

//로그인 처리를 담당하는 인터셉터
//세션에서 로그인이 되어있는 경우는 그대로 놔두고, 
//세션이 비어있는경우(브라우저를 종료) 쿠키가 null인지 아닌지를 판단해서 객체를반환받도록 작업한다
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private MemberServiceImpl service;

	// 주소자동지정
	@Autowired
	private CommonService common;
	
	//컨트롤러보다 먼저 수행되는 메소드를 만든다
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		/*String mem_auto_ip = "";
		mem_info_tbVO vo = null;
		int mem_id = 0;
		
		try {
			// local host의 InetAddress 객체 가져오기
			InetAddress loopbackAddress = InetAddress.getLoopbackAddress();
			System.out.println("loopbackAddress : " + loopbackAddress.toString());

			InetAddress inad = InetAddress.getLocalHost();
			//comnameip주소
			mem_auto_ip = inad.toString();
			System.out.println("getLocalHost : " + inad.toString());
			System.out.println("hostAddress : " + inad.getHostAddress());
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
			try {
				mem_id = service.member_loginokno(mem_auto_ip);
				System.out.println(mem_id);
			} catch (Exception e) {
				e.printStackTrace();
				mem_id = 0;
			}
				if(mem_id > 0) {
					vo = service.member_loginautogetid(mem_id);
					session.setAttribute("loginInfo", vo);
				}
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return true;*/
		
		
		
		//세션 객체를 가지고 온다
		HttpSession session = request.getSession();
		//loginInfo세션에 저장되어있는 사용자 정보를 가져온다
		Object object = null;
		if(session.getAttribute("loginInfo") != null) {
			object = session.getAttribute("loginInfo");
		}
		//로그인 세션이 없는 경우 -> 브라우저 종료 등으로 인한 세션 X
		if(object == null) {
			//로그인 당시 생성했던 쿠키를 가져온다. ("loginCookie")
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				//로그인 쿠키가 존재하는 경우 이전에 생성했던 쿠키가 있음 -> 일단 쿠키에 저장된 세션ID를 가져온다
				String sessionEmail = loginCookie.getValue();
				System.out.println("sessionEmail  : " + sessionEmail);
				//세션이 유효한지 파악 (즉, 자동 로그인 유지 했을 당시 쿠키를 7일간 저장한다고 했음 -> 7일 이후라면 세션을 생성하지 않고, 그 이전이라면 세션을 생성함)
				mem_info_tbVO vo = service.member_select_email(sessionEmail);
				if(vo != null) {
					System.out.println("vo  : " + vo.getMem_email());
					//사용자가 존재한다면
					session.setAttribute("loginInfo", vo);
					return true;	//Controller로 요청이 가게됨
				}else {
					//사용자가 존재하지 않음 : 로그인도 되어있지 않고, 쿠키도 존재하지 않음
					//로그인 폼으로 돌려보낸다.
					response.sendRedirect("/login");
					return false;	//Controller로 요청이 가지 않음
				}
			}
		}
		//preHandle의 return : 컨트롤러 요청 URI로 가도 되느냐 혹은 안되냐를 허가하는 의미
		//true로 설정해야 컨트롤러로 이동한다.
		return true;
		
	}
	
	
	
	// 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
        super.postHandle(request, response, handler, modelAndView);
    }

}
