package dao;

import java.util.List;

import bean.CropCategory;
import bean.Species;

public interface CropDao {
	List<CropCategory> findAllCategory();
	
	int addcate(CropCategory cate);
	
	CropCategory isexist(String name);
	
	Species isexitsp(String name);
	
	int deletecategory(int id);
	
	CropCategory showcategory(int id);

	Species selectonesp(int id);
	
	int updatecategory(CropCategory cate);
	
	List<Species> showspecies(int id);
	
	int addspecie(Species spc);
	
	List<Species> findSpecies();
	
	int deletespecie(int id);
	
	int updatespcies(Species spe);
}
