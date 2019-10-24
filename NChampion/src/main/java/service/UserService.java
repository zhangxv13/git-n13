package service;

import java.util.List;
import java.util.Map;

import bean.CropCategory;
import bean.Province;
import bean.Roles;
import bean.User;

public interface UserService {
	List<User> findAllUser(Map<String, Object> map);
	
	int deleteUser(int id);
	
	List<Roles> addroles();
	
	List<CropCategory> addCrops();
	
	List<Province> addProvinces();
	
	int addUser(User user);
	
	User showUpdateUser(int id);
	
	int findrid();
	
	int UpdateUser(User user);
}
