package VO;

public class MySubsVO {
	String month, al_List, price_state;

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getAl_List() {
		return al_List;
	}

	public void setAl_List(String al_List) {
		if(al_List.trim().equals(",")) {
			al_List = "-";
			this.al_List = al_List;			
		}else {
			this.al_List = al_List;
		}
	}

	public String getPrice_state() {
		return price_state;
	}

	public void setPrice_state(String price_state) {
		this.price_state = price_state;
	}


	
	
}
