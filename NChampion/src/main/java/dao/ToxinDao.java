package dao;

import java.util.List;

import bean.Toxin;

public interface ToxinDao {
	List<Toxin> findtoxin();
	
	Toxin isexittx(String name);
	
	int addtoxin(Toxin toxin);
	
	int deletetoxin(int id);
	
	Toxin showtoxin(int id);
	
	int updatetoxin(Toxin toxin);
}
