package serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PersonDao;
import bean.CropCategory;
import bean.MpData;
import bean.Province;
import bean.Species;
import bean.Toxin;
import service.PersonService;

@Service
public class PersonServiceImpl implements PersonService{
	@Autowired
	private PersonDao pd;
	
	public List<CropCategory> findcategory() {
		return pd.findcategory();
	}
	public List<CropCategory> findcategorytosi() {
		return pd.findcategorytosi();
	}
	public List<Species> findspebyid(int id) {
		return pd.findspebyid(id);
	}
	public List<Toxin> findtoxin(int id) {
		return pd.findtoxin(id);
	}
	public List<String> findyearbyid(int id) {
		return pd.findyearbyid(id);
	}
	public List<Species> showsearchspecies(Map<String, Object> map) {
		return pd.showsearchspecies(map);
	}
	public List<Toxin> showsearchtoxin(Map<String, Object> map) {
		return pd.showsearchtoxin(map);
	}
	public List<Province> showsearchprovince(Map<String, Object> map) {
		return pd.showsearchprovince(map);
	}
	public List<MpData> selectbymap(Map<String, Object> map) {
		return pd.selectbymap(map);
	}
}
