package common;

public class PageVO {
	
	int totalist;	//총 글의 건수
	int totalPage;	//총 페이지 수
	int totalBlock;	//총 블럭 수
	int pageList = 10;	//페이지당 보여질 목록의 수
	int blockPage = 10;	//블럭당 보여질 페이지의 수
	int curPage ;		//현재 페이지
	int beginList, endList;	//각 페이지의 보여질 목록 번호
	int curBlock;			//현재 블럭
	int beginPage, endPage;	//각 블럭에 보여질 페이지 번홓
	String search, keyword, viewType = "list";		//viewType은 list타입으로도 하고 grid 타입으로도 할 예정
	//검색조건, 검색어, 보기형태(List,Grid)//Grid : 카드뷰
	
	public int getTotalist() {
		return totalist;
	}
	public void setTotalist(int totalist) {
		//setTotalist에 토탈리스트 부분을 계산해서 사용
		totalPage = totalist / pageList ;	//총 페이지 수 = 총 건수 / 페이지당 글 건수
		if (totalist % pageList > 0) ++totalPage;//예) 51개이면 1페이지가 남아서 1을 더해준다.
		
		totalBlock = totalPage / blockPage ; //총 블록 수 = 총 페이지 수 / 블럭당 페이지 수
		if (totalPage % blockPage > 0 ) ++totalBlock;
		
		//현재 페이지에 따라 보여질 글의 시작 / 끝 목록이 결정이 된다.
		//각 페이지의 끝 목록번호 : 총 목록 수 - (페이지번호-1) * 페이지당 보여질 목록 수
		endList = totalist - (curPage - 1 ) * pageList;
		
		//각 페이지의 시작 번호 : 끝 목록번호 - (페이지당 보여질 목록 수 - 1 )
		beginList = endList - (pageList - 1 );
		
		//각 블럭에 보여질 페이지 번호는 현재 블럭에 따라 결정이 된다.
		curBlock = curPage / blockPage ;
		if(curPage % blockPage > 0 ) ++curBlock;
		
		//각 블럭의 끝 페이지 번호 : 블럭번호 * 블럭당 보여질 페이지 수
		endPage = curBlock * blockPage;
		
		//각 블럭의 시작 페이지 번호 : 끝 페이지 번호 - (블럭당 보여질 페이지 수 - 1)
		beginPage = endPage - (blockPage - 1);
		
		//마지막 블럭에서 끝 페이지 번호가 총 페이지 수보다 클 수 없으므로
		//총 페이지 수를 끝 페이지 번호로 한다.
		if(endPage > totalPage) endPage = totalPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getPageList() {
		return pageList;
	}
	public void setPageList(int pageList) {
		this.pageList = pageList;
	}
	public int getBlockPage() {
		return blockPage;
	}
	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getBeginList() {
		return beginList;
	}
	public void setBeginList(int beginList) {
		this.beginList = beginList;
	}
	public int getEndList() {
		return endList;
	}
	public void setEndList(int endList) {
		this.endList = endList;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getViewType() {
		return viewType;
	}
	public void setViewType(String viewType) {
		this.viewType = viewType;
	}
}