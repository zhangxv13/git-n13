package bean;

public class CropCategory {
	private int id;
	private String cropCategory;
	private int state;
	private boolean flg = true;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCropCategory() {
		return cropCategory;
	}
	public void setCropCategory(String cropCategory) {
		this.cropCategory = cropCategory;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public boolean isFlg() {
		return flg;
	}
	public void setFlg(boolean flg) {
		this.flg = flg;
	}
}
