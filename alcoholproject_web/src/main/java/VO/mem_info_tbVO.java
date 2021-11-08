package VO;

public class mem_info_tbVO {
    int mem_id               ;    
	String mem_email            ; 
	String mem_pw               ; 
	String mem_name             ; 
	String mem_nickname         ; 
	String mem_body             ;    
	String mem_alcohol_type     ;      
	String mem_flavor           ;      
	String mem_smell            ;      
	String mem_alcohol_bv       ;     
	String mem_birth            ;  
	String mem_adult            ;  
	String mem_subs             ;  
	String mem_social_type      ;  
	String mem_kakao            ;
	
	String mem_kakao_nickname   ;  
	int mem_kakao_id         ;     
	String mem_naver            ;  
	String mem_naver_nickname   ;  
	String mem_naver_id         ;  
	String mem_join_dt          ;  
	String mem_profile_imgname  ;  
	String mem_profile_imgpath  ;  
	String mem_address          ;  
	String mem_post             ;  
	String mem_gender           ;  
	String mem_phone            ;  
	String mem_card             ;  
	String mem_event_dt_brew    ;  
	String mem_event_dt_mini    ;
	String mem_auto;
	String mem_auto_ip;
    private String  social_type   ;//naver와 kakao 중 어떤 소셜 타입인지
    private String  social_email   ;//소셜이메일이 담기는 부분
	
	
    
	public String getSocial_type() {
		return social_type;
	}
	public void setSocial_type(String social_type) {
		this.social_type = social_type;
	}
	public String getSocial_email() {
		return social_email;
	}
	public void setSocial_email(String social_email) {
		this.social_email = social_email;
	}
	public String getMem_auto_ip() {
		return mem_auto_ip;
	}
	public void setMem_auto_ip(String mem_auto_ip) {
		this.mem_auto_ip = mem_auto_ip;
	}
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_body() {
		return mem_body;
	}
	public void setMem_body(String mem_body) {
		this.mem_body = mem_body;
	}
	public String getMem_alcohol_type() {
		return mem_alcohol_type;
	}
	public void setMem_alcohol_type(String mem_alcohol_type) {
		this.mem_alcohol_type = mem_alcohol_type;
	}
	public String getMem_flavor() {
		return mem_flavor;
	}
	public void setMem_flavor(String mem_flavor) {
		this.mem_flavor = mem_flavor;
	}
	public String getMem_smell() {
		return mem_smell;
	}
	public void setMem_smell(String mem_smell) {
		this.mem_smell = mem_smell;
	}
	public String getMem_alcohol_bv() {
		return mem_alcohol_bv;
	}
	public void setMem_alcohol_bv(String mem_alcohol_bv) {
		this.mem_alcohol_bv = mem_alcohol_bv;
	}
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_adult() {
		return mem_adult;
	}
	public void setMem_adult(String mem_adult) {
		this.mem_adult = mem_adult;
	}
	public String getMem_subs() {
		return mem_subs;
	}
	public void setMem_subs(String mem_subs) {
		this.mem_subs = mem_subs;
	}
	public String getMem_social_type() {
		return mem_social_type;
	}
	public void setMem_social_type(String mem_social_type) {
		this.mem_social_type = mem_social_type;
	}
	public String getMem_kakao() {
		return mem_kakao;
	}
	public void setMem_kakao(String mem_kakao) {
		this.mem_kakao = mem_kakao;
	}
	public String getMem_kakao_nickname() {
		return mem_kakao_nickname;
	}
	public void setMem_kakao_nickname(String mem_kakao_nickname) {
		this.mem_kakao_nickname = mem_kakao_nickname;
	}
	public int getMem_kakao_id() {
		return mem_kakao_id;
	}
	public void setMem_kakao_id(int mem_kakao_id) {
		this.mem_kakao_id = mem_kakao_id;
	}
	public String getMem_naver() {
		return mem_naver;
	}
	public void setMem_naver(String mem_naver) {
		this.mem_naver = mem_naver;
	}
	public String getMem_naver_nickname() {
		return mem_naver_nickname;
	}
	public void setMem_naver_nickname(String mem_naver_nickname) {
		this.mem_naver_nickname = mem_naver_nickname;
	}
	public String getMem_naver_id() {
		return mem_naver_id;
	}
	public void setMem_naver_id(String mem_naver_id) {
		this.mem_naver_id = mem_naver_id;
	}
	public String getMem_join_dt() {
		return mem_join_dt;
	}
	public void setMem_join_dt(String mem_join_dt) {
		this.mem_join_dt = mem_join_dt;
	}
	public String getMem_profile_imgname() {
		return mem_profile_imgname;
	}
	public void setMem_profile_imgname(String mem_profile_imgname) {
		this.mem_profile_imgname = mem_profile_imgname;
	}
	public String getMem_profile_imgpath() {
		return mem_profile_imgpath;
	}
	public void setMem_profile_imgpath(String mem_profile_imgpath) {
		this.mem_profile_imgpath = mem_profile_imgpath;
	}
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public String getMem_post() {
		return mem_post;
	}
	public void setMem_post(String mem_post) {
		this.mem_post = mem_post;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_card() {
		return mem_card;
	}
	public void setMem_card(String mem_card) {
		this.mem_card = mem_card;
	}
	public String getMem_event_dt_brew() {
		return mem_event_dt_brew;
	}
	public void setMem_event_dt_brew(String mem_event_dt_brew) {
		this.mem_event_dt_brew = mem_event_dt_brew;
	}
	public String getMem_event_dt_mini() {
		return mem_event_dt_mini;
	}
	public void setMem_event_dt_mini(String mem_event_dt_mini) {
		this.mem_event_dt_mini = mem_event_dt_mini;
	}
	public String getMem_auto() {
		return mem_auto;
	}
	public void setMem_auto(String mem_auto) {
		this.mem_auto = mem_auto;
	}
	
	
}