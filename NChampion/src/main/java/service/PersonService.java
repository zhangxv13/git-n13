package service;

import java.util.List;
import java.util.Map;

import bean.CropCategory;
import bean.MpData;
import bean.Province;
import bean.Species;
import bean.Toxin;

public interface PersonService {
	List<CropCategory> findcategory();

	List<CropCategory> findcategorytosi();
	
	List<Species> findspebyid(int id);
	
	List<Toxin> findtoxin(int id);
	
	List<String> findyearbyid(int id);
	
	List<Species> showsearchspecies(Map<String, Object> map);
	
	List<Toxin> showsearchtoxin(Map<String, Object> map);
	
	List<Province> showsearchprovince(Map<String, Object> map);
	
	List<MpData> selectbymap(Map<String, Object> map);
}
