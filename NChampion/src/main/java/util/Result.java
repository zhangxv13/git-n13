package util;

import java.util.List;

import bean.PageBaen;
import bean.SampleInfo;

public class Result {
	private List<SampleInfo> list;
	private PageBaen page;
	public Result(List<SampleInfo> list, PageBaen page) {
		super();
		this.list = list;
		this.page = page;
	}
	public List<SampleInfo> getList() {
		return list;
	}
	public void setList(List<SampleInfo> list) {
		this.list = list;
	}
	public PageBaen getPage() {
		return page;
	}
	public void setPage(PageBaen page) {
		this.page = page;
	}
	
}
