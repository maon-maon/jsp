package memberMessage;

public class MemberMessageVO {
	private int idx;
	private String senderId;
	private String receiverId;
	private String content;
	private String msgDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
	}
	
	@Override
	public String toString() {
		return "MemberMessageVO [idx=" + idx + ", senderId=" + senderId + ", receiverId=" + receiverId + ", content="
				+ content + ", msgDate=" + msgDate + "]";
	}
}
