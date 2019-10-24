package dao;

import java.util.List;
import java.util.Map;

import bean.City;
import bean.Province;
import bean.SampleInfo;
import bean.Town;

public interface IMDao {
	List<Province> findProvince();
	
	List<City> findCity(String pcode);
	
	List<Town> findTown(String tcode);
	
	SampleInfo findsimpleinfo(Map<String, Object> map);
	
	List<SampleInfo> findsiid(Map<String, Object> map);
	
	List<Province> findprovbyid(int id);
	
	List<SampleInfo> serachinfo(Map<String, Object> map);
}
