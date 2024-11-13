package admin.review;

public class ReviewVO {
	// review테이블
	private int idx;
	private String part;
	private int partIdx;
	private String mid;
	private String nickName;
	private String content;
	private int star;
	private String reviewDate;
	
	// reviewReply테이블
	private int replyIdx;
	//private int reviewIdx;
	private String replyMid;
	private String replyNickName;
	private String replyContent;
	private String replyDate;
	
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
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getReplyIdx() {
		return replyIdx;
	}
	public void setReplyIdx(int replyIdx) {
		this.replyIdx = replyIdx;
	}
	public String getReplyMid() {
		return replyMid;
	}
	public void setReplyMid(String replyMid) {
		this.replyMid = replyMid;
	}
	public String getReplyNickName() {
		return replyNickName;
	}
	public void setReplyNickName(String replyNickName) {
		this.replyNickName = replyNickName;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [idx=" + idx + ", part=" + part + ", partIdx=" + partIdx + ", mid=" + mid + ", nickName="
				+ nickName + ", content=" + content + ", star=" + star + ", reviewDate=" + reviewDate + ", replyIdx=" + replyIdx
				+ ", replyMid=" + replyMid + ", replyNickName=" + replyNickName + ", replyContent=" + replyContent
				+ ", replyDate=" + replyDate + "]";
	}
}
