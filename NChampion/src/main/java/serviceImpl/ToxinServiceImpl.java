package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.Toxin;
import dao.ToxinDao;
import service.ToxinServince;

@Service
public class ToxinServiceImpl implements ToxinServince{
	@Autowired
	private ToxinDao td;


	public List<Toxin> findtoxin() {
		return td.findtoxin();
	}

	public String isexittx(String name) {
		Toxin tx = td.isexittx(name);
		String f;
		if(tx != null){
			f = "true";
		}else {
			f="false";
		}
		return f;
	}


	public int addtoxin(Toxin toxin) {
		return td.addtoxin(toxin);
	}


	public int deletetoxin(int id) {
		return td.deletetoxin(id);
	}


	public Toxin showtoxin(int id) {
		return td.showtoxin(id);
	}


	public int updatetoxin(Toxin toxin) {
		return td.updatetoxin(toxin);
	}
	
}
