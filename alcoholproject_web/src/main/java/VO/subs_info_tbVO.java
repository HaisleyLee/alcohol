package VO;

public class subs_info_tbVO {
	
	/* 개편한 테이블구조로 변경 */
	
	 int subs_id              ;//       number,                       --���� ���̺�pkŰ/ateam_subscribe���̺��� pkŰ
	 String subs_monthday;
	 int subs_mem_id          ;//    number not null,              --�����ϴ� ����� �ش��ϴ� ȸ�����̺�(member)�� member_id
	 String subs_order_dt        ;//       date,                         --���� ��û�� ����/��¥��
	 String subs_address         ;//       varchar2(500),                --���� ��۹��� �ּ�(ȸ�����̺��� �ּҿ� ����)
	 String subs_deliverydt      ;//     number default 1,              --��� �ް���� ��¥(�ſ��� '��'��) : ex) �ſ� '25'�� �� ��� : 25 / ������ ����Ÿ��
	 String subs_alcohol1;
	 String subs_alcohol2;
	 String subs_completion;
	 int subs_price           ;//       number,                       --�����������/����Ÿ���� ������ ex) 50000�̸� 50,000��
	 String subs_refund          ;//       varchar2(10) default 'F',     --ȯ�� ����--����Ŭ��booleanŸ���̾�� VARCHAR2Ÿ���� T/F�� ��ü
	 int subs_refund_price    ;//        number default 0,            -
	public int getSubs_id() {
		return subs_id;
	}
	public void setSubs_id(int subs_id) {
		this.subs_id = subs_id;
	}
	public String getSubs_monthday() {
		return subs_monthday;
	}
	public void setSubs_monthday(String subs_monthday) {
		this.subs_monthday = subs_monthday;
	}
	public int getSubs_mem_id() {
		return subs_mem_id;
	}
	public void setSubs_mem_id(int subs_mem_id) {
		this.subs_mem_id = subs_mem_id;
	}
	public String getSubs_order_dt() {
		return subs_order_dt;
	}
	public void setSubs_order_dt(String subs_order_dt) {
		this.subs_order_dt = subs_order_dt;
	}
	public String getSubs_address() {
		return subs_address;
	}
	public void setSubs_address(String subs_address) {
		this.subs_address = subs_address;
	}
	public String getSubs_deliverydt() {
		return subs_deliverydt;
	}
	public void setSubs_deliverydt(String subs_deliverydt) {
		this.subs_deliverydt = subs_deliverydt;
	}
	public String getSubs_alcohol1() {
		return subs_alcohol1;
	}
	public void setSubs_alcohol1(String subs_alcohol1) {
		this.subs_alcohol1 = subs_alcohol1;
	}
	public String getSubs_alcohol2() {
		return subs_alcohol2;
	}
	public void setSubs_alcohol2(String subs_alcohol2) {
		this.subs_alcohol2 = subs_alcohol2;
	}
	public String getSubs_completion() {
		return subs_completion;
	}
	public void setSubs_completion(String subs_completion) {
		this.subs_completion = subs_completion;
	}
	public int getSubs_price() {
		return subs_price;
	}
	public void setSubs_price(int subs_price) {
		this.subs_price = subs_price;
	}
	public String getSubs_refund() {
		return subs_refund;
	}
	public void setSubs_refund(String subs_refund) {
		this.subs_refund = subs_refund;
	}
	public int getSubs_refund_price() {
		return subs_refund_price;
	}
	public void setSubs_refund_price(int subs_refund_price) {
		this.subs_refund_price = subs_refund_price;
	}
	
	 
	
}
