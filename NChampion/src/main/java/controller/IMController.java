package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import bean.City;
import bean.PageBaen;
import bean.Province;
import bean.SampleInfo;
import bean.Town;
import service.IMService;

@Controller
public class IMController {
	@Autowired
	private IMService is;
	
	@RequestMapping("selectProvince")
	@ResponseBody
	public List<Province> selectProvince(){
		List<Province> list = is.findProvince();
		return list;
	}
	
	@RequestMapping("selectCity")
	@ResponseBody
	public List<City> selectCity(String pcode){
		List<City> list = is.findCity(pcode);
		return list;
	}
	
	@RequestMapping("selectTown")
	@ResponseBody
	public List<Town> selectTown(String ccode){
		List<Town> list = is.findTown(ccode);
		return list;
	}
	@RequestMapping("findAllSample")
	public ModelAndView findallsample(@RequestParam(value="pagenumber",required=false,defaultValue="1")int pagenumber){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		PageBaen pagbean = new PageBaen();
		PageInfo<SampleInfo> page = is.findall(pagenumber, map);
		for(SampleInfo sampleInfo : page.getList()){
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String st = df.format(sampleInfo.getSamplingTime());
			String si = df.format(sampleInfo.getInputtime());
			sampleInfo.setSamptime(st);
			sampleInfo.setInptime(si);
		}
		int colnumber = 0;
		int cur = page.getPrePage()+1;
		if(pagenumber%5==0){
			colnumber = cur/5-1;
		}else {
			colnumber = cur/5;
		}
		pagbean.setCurrent(cur);
		pagbean.setColnumber(colnumber);
		pagbean.setPagenumber(page.getPages());
		pagbean.setList(page.getList());
		mav.addObject("sample",pagbean);
		mav.setViewName("IM");
		return mav;
	}
	@RequestMapping(value="searchsample",method=RequestMethod.POST)
	@ResponseBody
	public PageBaen searchsp(@RequestParam(value="pagenumber",required=false,defaultValue="1")int pagenumber,String sampleid,String wuranluv,String year,String month,String day,String toxintype ,
			String cropspecies ,String province ,String city, String town){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sampleid", sampleid);
			map.put("cropspecies",cropspecies);
			map.put("province", province);
			map.put("city", city);
			map.put("town",town );
			map.put("toxintype",toxintype);
			if (wuranluv != null && !"".equals(wuranluv)) {
				map.put("min",wuranluv.split("-")[0] );
				map.put("max",wuranluv.split("-")[1] );
			}
			if (year!= null && !"0".equals(year)) {
				if (month!= null && !"0".equals(month)) {
					if (day!= null && !"0".equals(day)) {
						if(Integer.parseInt(month)<10){
							if(Integer.parseInt(day)<10){
								map.put("date", year+"-0"+month + "-0" + day);
							}else {
								map.put("date", year+"-0"+month + "-" + day);
							}
						}else {
							map.put("date", year+"-"+month + "-" + day);
						}
					}else{
						if(Integer.parseInt(month)<10){
							map.put("date", year+"-0"+month);
						}else {
							map.put("date", year+"-"+month);
						}
					}
				}else{
					map.put("date", year);
				}
			}
			PageBaen pagbean = new PageBaen();
			PageInfo<SampleInfo> page = is.findall(pagenumber,map);
			int colnumber = 0;
			int cur = page.getPrePage()+1;
			if(pagenumber%5==0){
				colnumber = cur/5-1;
			}else {
				colnumber = cur/5;
			}
			pagbean.setCurrent(cur);
			pagbean.setColnumber(colnumber);
			pagbean.setPagenumber(page.getPages());
			pagbean.setList(page.getList());
//			Map<String, Object> m2 = new HashMap<String, Object>();
//			m2.put("toxintype",toxintype);
//			List<SampleInfo> tlist = is.findToxinall(m2);
//			List<SampleInfo> tlist1 = is.findToxinall(null);
//			for (int i = 0; i < tlist.size(); i++) {
//				SampleInfo si = tlist.get(i);
//				for (int j = 0; j < tlist1.size(); j++) {
//					if(si.getSampleid().equals(tlist1.get(j).getSampleid())){
//						si.setTxinfo(tlist1.get(j).getTxinfo());
//						break;
//					}
//				}
//			}
//			PageHelper.startPage(pagenumber,5);
//			List<SampleInfo> list = is.findSampleinfo(m1);
//			for (int i = 0; i < list.size(); i++) {
//				SampleInfo si = list.get(i);
//				for (int j = 0; j < tlist.size(); j++) {
//					if(si.getSampleid().equals(tlist.get(j).getSampleid())){
//						si.setTxinfo(tlist.get(j).getTxinfo());
//						break;
//					}
//				}
//			}
//			PageInfo<SampleInfo> page = new PageInfo<SampleInfo>(list);
//			PageBaen pagbean = new PageBaen();
//			int colnumber = 0;
//			int cur = page.getPrePage()+1;
//			if(pagenumber%5==0){
//				colnumber = cur/5-1;
//			}else {
//				colnumber = cur/5;
//			}
//			pagbean.setCurrent(cur);
//			pagbean.setColnumber(colnumber);
//			pagbean.setPagenumber(page.getPages());
//			Result result = new Result(list, pagbean); 
		return pagbean;
	}
}
