package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CropDao;
import bean.CropCategory;
import bean.Species;
import service.CropService;

@Service
public class CropServiceImpl implements CropService{
	@Autowired
	private CropDao cd;
	
	public List<Species> findSpecies() {
		return cd.findSpecies();
	}

	public List<CropCategory> findAllCategory() {
		return cd.findAllCategory();
	}

	public int deletecategory(int id) {
		return cd.deletecategory(id);
	}

	public String isexist(String name) {
		CropCategory cate = cd.isexist(name);
		String f;
		if(cate != null){
			f = "true";
		}else {
			f="false";
		}
		return f;
	}

	public int addcate(CropCategory cate) {
		return cd.addcate(cate);
	}

	public CropCategory showcategory(int id) {
		return cd.showcategory(id);
	}

	public List<Species> showspecies(int id) {
		return cd.showspecies(id);
	}

	public int updatecategory(CropCategory cate) {
		return cd.updatecategory(cate);
	}

	public int addspecie(Species spc) {
		return cd.addspecie(spc);
	}

	public String isexitsp(String name) {
		Species spe = cd.isexitsp(name);
		String f;
		if(spe != null){
			f = "true";
		}else {
			f="false";
		}
		return f;
	}

	public int deletespecie(int id) {
		return cd.deletespecie(id);
	}

	public Species selectonesp(int id) {
		return cd.selectonesp(id);
	}

	public int updatespcies(Species spe) {
		return cd.updatespcies(spe);
	}

}
