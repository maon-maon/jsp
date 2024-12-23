package schedule;

public class ScheduleVO {
	private int idx;
	private String mid;
	private String sDate;
	private String part;
	private String content;
	
	private int partCnt; //분류별 합계 출력을 위한 변수 

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPartCnt() {
		return partCnt;
	}

	public void setPartCnt(int partCnt) {
		this.partCnt = partCnt;
	}

	@Override
	public String toString() {
		return "ScheduleVO [idx=" + idx + ", mid=" + mid + ", sDate=" + sDate + ", part=" + part + ", content=" + content
				+ ", partCnt=" + partCnt + "]";
	}
	
}
