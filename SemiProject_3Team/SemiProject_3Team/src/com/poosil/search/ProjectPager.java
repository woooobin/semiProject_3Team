package com.poosil.search;

// 페이지 나누기 작업
public class ProjectPager {
	
	// 페이지당 게시물 수
	public static final int PAGE_SCALE = 10;
	
	// 화면당 페이지 수
	public static final int BLOCK_SCALE = 3;
	
	private int currPage;		// 현재 페이지
	private int prevPage;		// 이전 페이지
	private int nextPage;		// 다음 페이지
	private int totalPage;		// 전체 페이지 갯수
	private int totalBlock;		// 전페 페이지 블록 갯수
	private int currBlock;		// 현재 페이지 블록
	private int prevBlock;		// 이전 페이지 블록
	private int nextBlock;		// 다음 페이지 블록
	
	// WHERE rn BETWEEN #{start} AND #{end}
	private int pageBegin;		// #{start}
	private int pageEnd;		// #{end}
	
	// [이전] blockBegin -> 5 6 7 [다음]
	private int blockBegin;		// 현재 페이지를 블록의 시작 번호로
	// [이전] 5 6 7 <-blockEnd[다음]
	private int blockEnd;		// 현재 페이지를 블록의 끝 번호로
	
	// 생성자
	// ProjectPager(레코드 갯수, 페이지 번호)
	public ProjectPager(int count, int currPage) {
		currBlock = 1;			// 현재 페이지 블록 번호
		this.currPage = currPage;	// 전체 페이지 갯수 계산
		setTotalPage(count);	// 전체 페이지 갯수 계산
		setPageRange();			// 페이지 시작, 끝번호 계산
		setTotalBlock();		// 전체 페이지 블록갯수 계산
		setBlockRange();		// 페이지 블록의 시작, 끝번호 계산
	
	}

	private void setBlockRange() {
		// *현재 페이지가 몇번째 페이지 블록에 속하는지 계산
		// (현재 페이지 -1) / 페이지 블록 단위 + 1
		// 1페이지 => 1블록 (1-1) / 10 + 1 => 1
		// 9페이지 => 1블록 (9-1) / 10 + 1 => 1
		// 11페이지 => 2블록 (11-1) / 10 - 1 => 2
		// 57페이지 => 6블록 (57-1) / 10 + 1 = 6
		currBlock = (int)Math.ceil((currPage - 1) / BLOCK_SCALE) + 1;
		// *편재 페이지 블록의 시작, 끝번호 계산
		// 페이지 블록의 시작번호
		// (현재블록 - 1) * 블록 단위 + 1
		// 1블록 => (1-1) * 10 + 1 => 1
		// 2블록 => 11 + 10 - 1 => 11
		// 6블록 => (6 - 1) * 10 + 1 => 51
		blockBegin = (currBlock - 1) * BLOCK_SCALE + 1;
		// 페이지 블록의 끝번호
		// 블록시작 번호 + 블록 단위 - 1;
		// 1블록 => 1 + 10 - 1 => 10
		// 2블록 => 11 + 10 - 1 => 20
		// 6블록 => 51 + 10 - 1 => 60
		blockEnd = blockBegin + BLOCK_SCALE - 1;
		// *마지막 블록이 범위를 초과하지 않도록 계산
		// [이전] 61 62 => 이런 경우 70번 까지 나오지 않도록 하기 위한
		if(blockEnd > totalPage) blockEnd = totalPage;
		
		// *[이전]을 눌렀을 때 이동할 페이지 번호
		prevPage = (currPage == 1)? 1 : (currBlock-1)*BLOCK_SCALE;
		
		// *[다음]을 눌렀을 때 이동할 페이지 번호
		nextPage = currBlock > totalBlock ? (currBlock * BLOCK_SCALE) : (currBlock*BLOCK_SCALE)+1;
		
		// 마지막 페이지가 범위를 초과하지 않도록 처리
		if (nextPage >= totalPage) nextPage = totalPage;
		
	}
	
	public void setPageRange() {
		// WHERE rn BETWEEN #{start} AND #{end}
		// 시작 번호 = (현재페이지 - 1) * 페이지당 게시물 수 + 1
		pageBegin = (currPage - 1) * PAGE_SCALE + 1;
		// 끝 번호 = 시작번호 + 페이지당 게시물 수 - 1
		pageEnd = pageBegin + PAGE_SCALE - 1;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
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

	public void setTotalBlock() {
		// 전체 페이지 갯수 / 10
		// 91 / 10 = 9.1 => 10개
		totalBlock = (int)Math.ceil(totalPage / BLOCK_SCALE);
	}

	public int getCurrBlock() {
		return currBlock;
	}

	public void setCurrBlock(int currBlock) {
		this.currBlock = currBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

	public static int getPageScale() {
		return PAGE_SCALE;
	}

	public static int getBlockScale() {
		return BLOCK_SCALE;
	}

}
