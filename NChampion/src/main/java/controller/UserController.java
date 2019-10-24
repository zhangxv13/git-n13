package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.CropCategory;
import bean.PageBaen;
import bean.Province;
import bean.Roles;
import bean.User;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService us;
	
	@RequestMapping("/findAllUser")
	public ModelAndView findAllUser(String pagenumber,String name){
		ModelAndView mav = new ModelAndView();
		List<User> list = new ArrayList<User>();
		int current = 1;
		if(pagenumber!=null && !"".equals(pagenumber)){
			current = Integer.parseInt(pagenumber);
		}
		PageHelper.startPage(current,5);
		PageBaen pagbean = new PageBaen();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", name);
		list = us.findAllUser(map);
		PageInfo<User> page = new PageInfo<User>(list);
		int colnumber = 0;
		int cur = page.getPrePage()+1;
		if(current%5==0){
			colnumber = cur/5-1;
		}else {
			colnumber = cur/5;
		}
		pagbean.setCurrent(cur);
		pagbean.setColnumber(colnumber);
		pagbean.setPagenumber(page.getPages());
		pagbean.setList(list);
		mav.addObject("sname",name);
		mav.addObject("users", pagbean);
		mav.setViewName("superadmin");
		return mav;
	}
	@RequestMapping("/deleteUserById")
	public ModelAndView deleteUser(int id){
		ModelAndView mav = new ModelAndView();
		us.deleteUser(id);
		mav.setViewName("redirect:/findAllUser");
		return mav;
	}
	@RequestMapping("/toaddUser")
	public ModelAndView toaddUser(){
		ModelAndView mav = new ModelAndView();
		List<CropCategory> clist = us.addCrops();
		List<Province> plist =us.addProvinces();
		List<Roles> rlist = us.addroles();
		mav.addObject("roles", rlist);
		mav.addObject("crops", clist);
		mav.addObject("provinces", plist);
		mav.setViewName("user-management-add");
		return mav;
	}
	@RequestMapping(value="addUser",method=RequestMethod.POST)
	public ModelAndView addUser(User user,String stime,String etime){
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		user.setIdcard("371428199005327531");
		user.setEmail("123456@163.com");
		user.setPhone("12345684322");
		user.setApplicationtime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		user.setCreatetime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		user.setIsdel(0);
		user.setCreatepeople("1");
		try {
			user.setStarttime(sdf.parse(stime));
			user.setEndtime(sdf.parse(etime));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		us.addUser(user);
		mav.setViewName("redirect:/findAllUser");
		return mav;
	}
	@RequestMapping("/showupdateUser")
	public ModelAndView showUser(int id){
		User user = us.showUpdateUser(id);
		if(user.getStarttime() != null && user.getEndtime() != null){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			user.setStime(sdf.format(user.getStarttime()));
			user.setEtime(sdf.format(user.getEndtime()));
		}
		ModelAndView mav = new ModelAndView();
		List<CropCategory> clist = us.addCrops();
		List<Province> plist =us.addProvinces();
		String category = user.getCategory();
		if(category!=null && !"".equals(category)){
			String[] categorys = category.split(",");
			List<Integer> lcategory = new ArrayList<Integer>(); 
			for (int i = 0; i < categorys.length; i++) {
				if(categorys[i]!=null && !"".equals(categorys[i])){
					lcategory.add(Integer.parseInt(categorys[i].trim()));
				}
			}	
			mav.addObject("lcategory", lcategory);
		}
		String area = user.getArea();
		if(area!=null && !"".equals(area)){
			String[] areas = area.split(",");
			List<Integer> larea = new ArrayList<Integer>(); 
			for (int i = 0; i < areas.length; i++) {
				if(areas[i]!=null && !"".equals(areas[i])){
					larea.add(Integer.parseInt(areas[i].trim()));
				}
			}	
			mav.addObject("larea", larea);
		}
		mav.addObject("crops", clist);
		mav.addObject("provinces", plist);
		mav.addObject("showupdata",user);
		mav.addObject("rid",us.findrid());
		mav.setViewName("user-management-modify");
		return mav;
	}
	@RequestMapping("/updateuser")
	public ModelAndView updateuser(User user,String stime,String etime){
		ModelAndView mav = new ModelAndView();
		if(stime!="" && etime!=""){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				user.setStarttime(sdf.parse(stime));
				user.setEndtime(sdf.parse(etime));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		us.UpdateUser(user);
		mav.setViewName("redirect:/findAllUser");
		return mav;
	}
}
