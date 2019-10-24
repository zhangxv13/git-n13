package serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import bean.CropCategory;
import bean.Province;
import bean.Roles;
import bean.User;
import service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao udao;

	public int deleteUser(int id) {
		return udao.deleteUser(id);
	}

	public List<Roles> addroles() {
		return udao.addroles();
	}

	public List<CropCategory> addCrops() {
		return udao.addCrops();
	}

	public List<Province> addProvinces() {
		return udao.addProvinces();
	}

	public int addUser(User user) {
		return udao.addUser(user);
	}

	public User showUpdateUser(int id) {
		return udao.showUpdateUser(id);
	}

	public int findrid() {
		return udao.findrid();
	}

	public int UpdateUser(User user) {
		return udao.UpdateUser(user);
	}

	public List<User> findAllUser(Map<String, Object> map) {
		return udao.findAllUser(map);
	}
}
