package admin.claim;

public class ClaimVO {
	private int idx;
	private String part;
	private int partIdx;
	private String claimMid ;
	private String claimContent ;
	private String claimDate ;
	
	private String title ;
	private String nickName ;
	private String mid ;
	
	private String claim ;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public int getPartIdx() {
		return partIdx;
	}

	public void setPartIdx(int partIdx) {
		this.partIdx = partIdx;
	}

	public String getClaimMid() {
		return claimMid;
	}

	public void setClaimMid(String claimMid) {
		this.claimMid = claimMid;
	}

	public String getClaimContent() {
		return claimContent;
	}

	public void setClaimContent(String claimContent) {
		this.claimContent = claimContent;
	}

	public String getClaimDate() {
		return claimDate;
	}

	public void setClaimDate(String claimDate) {
		this.claimDate = claimDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getClaim() {
		return claim;
	}

	public void setClaim(String claim) {
		this.claim = claim;
	}

	@Override
	public String toString() {
		return "ClaimVO [idx=" + idx + ", part=" + part + ", partIdx=" + partIdx + ", claimMid=" + claimMid
				+ ", claimContent=" + claimContent + ", claimDate=" + claimDate + ", title=" + title + ", nickName=" + nickName
				+ ", mid=" + mid + ", claim=" + claim + "]";
	}
	
}
