package service;

import java.util.List;

import bean.Toxin;

public interface ToxinServince {
	List<Toxin> findtoxin();
	
	String isexittx(String name);
	
	int addtoxin(Toxin toxin);
	
	int deletetoxin(int id);
	
	Toxin showtoxin(int id);
	
	int updatetoxin(Toxin toxin);
}
