package service;

import java.util.List;

import bean.CropCategory;
import bean.Species;

public interface CropService {
	List<Species> findSpecies();
	
	List<CropCategory> findAllCategory();
	
	int deletecategory(int id);
	
	String isexist(String name);
	
	int addcate(CropCategory cate);
	
	CropCategory showcategory(int id);
	
	List<Species> showspecies(int id);
	
	int updatecategory(CropCategory cate);
	
	int addspecie(Species spc);
	
	int deletespecie(int id);
	
	String isexitsp(String name);
	
	Species selectonesp(int id);
	
	int updatespcies(Species spe);
}
