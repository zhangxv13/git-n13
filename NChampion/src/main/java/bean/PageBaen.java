package bean;

import java.util.List;

public class PageBaen {
	private int total;//������
	private int current = 1;//��ǰҳ
	private int pagenumber;//��ҳ��
	private int colnumber;
	private List list;
	
	public int getColnumber() {
		return colnumber;
	}
	public void setColnumber(int colnumber) {
		this.colnumber = colnumber;
	}
	public int getPagenumber() {
		return pagenumber;
	}
	public void setPagenumber(int pagenumber) {
		this.pagenumber = pagenumber;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
//		pagenumber = total%6==0? total/6:(total/6)+1;
	}
	public int getCurrent() {
		return current;
	}
	public void setCurrent(int current) {
		this.current = current;
//		if(current%5==0){
//			colnumber = current/5-1;
//		}else {
//			colnumber = current/5;
//		}
		
	}
	
}
