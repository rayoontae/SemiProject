package dto;

public class ProfileImageDTO {

	private int seq;
	private String parentId;
	private String oriName;
	private String sysName;
	
	public ProfileImageDTO() {
		
	}

	public ProfileImageDTO(int seq, String parentId, String oriName, String sysName) {
		this.seq = seq;
		this.parentId = parentId;
		this.oriName = oriName;
		this.sysName = sysName;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
	}

	public String getSysName() {
		return sysName;
	}

	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	
	
}
