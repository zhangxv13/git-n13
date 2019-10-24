package bean;

import java.util.Date;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;


import util.COUNT;

public class User implements HttpSessionBindingListener {
	private int id;
	private String loginName;
	private String username;
	private String managerName;
	private String createtime;
	private String createpeople;
	private int state;
	private int role;
	private String password;
	private String category;
	private String area;
	private String stime;
	private String etime;
	private Date starttime;
	private Date endtime;
	private String applicationtime;
	private String email;
	private String phone;
	private User uc;
	private Roles roleinfo;
	private String idcard;
	private int isdel;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getCreatepeople() {
		return createpeople;
	}
	public void setCreatepeople(String createpeople) {
		this.createpeople = createpeople;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public User getUc() {
		return uc;
	}
	public void setUc(User uc) {
		this.uc = uc;
	}
	
	public Roles getRoleinfo() {
		return roleinfo;
	}
	public void setRoleinfo(Roles roleinfo) {
		this.roleinfo = roleinfo;
	}
	public String getApplicationtime() {
		return applicationtime;
	}
	public void setApplicationtime(String applicationtime) {
		this.applicationtime = applicationtime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public int getIsdel() {
		return isdel;
	}
	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}
	public void valueBound(HttpSessionBindingEvent arg0) {
		COUNT.COUNT++;
		
	}
	public void valueUnbound(HttpSessionBindingEvent arg0) {
		COUNT.COUNT --;
	}
}
