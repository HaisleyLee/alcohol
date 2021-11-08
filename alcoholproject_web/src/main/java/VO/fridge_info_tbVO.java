package VO;

public class fridge_info_tbVO {
	
	/*
	 * create table fridge_info_tb ( fridge_num number, --술장고 데이터 축적 num: 데이터 삭제 수정용
	 * fridge_device_id number not null, --술장고 디바이스id : 술장고를 보유중인 회원의 id(해당되는 회원
	 * id(ateam_member테이블)) 
	 * fridge_position number not null, --술이 해당회원의 몇번 째 술인지의 숫자
	 * fridge_al_id number not null, --담긴 술 id (술 테이블의 술 id를 참조) constraint
	 * fridge_num_pk primary key(fridge_num), CONSTRAINT fridge_device_id_fk_cascade
	 * foreign key(fridge_device_id) REFERENCES mem_info_tb(mem_id) ON DELETE
	 * CASCADE );
	 */
	                             
	  int   fridge_num              ;
	  int   fridge_device_id          ;//not null
	  int   fridge_position        ;//not null
	  int   fridge_al_id           ;//not null
	  
	public int getFridge_num() {
		return fridge_num;
	}
	public void setFridge_num(int fridge_num) {
		this.fridge_num = fridge_num;
	}
	public int getFridge_device_id() {
		return fridge_device_id;
	}
	public void setFridge_device_id(int fridge_device_id) {
		this.fridge_device_id = fridge_device_id;
	}
	public int getFridge_position() {
		return fridge_position;
	}
	public void setFridge_position(int fridge_position) {
		this.fridge_position = fridge_position;
	}
	public int getFridge_al_id() {
		return fridge_al_id;
	}
	public void setFridge_al_id(int fridge_al_id) {
		this.fridge_al_id = fridge_al_id;
	}

	 
	
}
