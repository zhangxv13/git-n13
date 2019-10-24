package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import bean.CropCategory;
import bean.MpData;
import bean.PageBaen;
import bean.Province;
import bean.SampleInfo;
import bean.Species;
import bean.Toxin;
import service.IMService;
import service.PersonService;
import service.ToxinServince;

@Controller
public class PersonController {
	@Autowired
	private PersonService ps;
	
	@Autowired
	private IMService is;
	
	@Autowired
	private ToxinServince ts;
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	@RequestMapping("person")
	public ModelAndView personshow(){
		ModelAndView mav = new ModelAndView();
		List<CropCategory> list = ps.findcategory();
		List<CropCategory> lsp = ps.findcategorytosi();
		for(CropCategory cc : list){
			for(CropCategory c : lsp){
				if(cc.getId()==c.getId()){
					cc.setFlg(false);
				}
			}
		}
		mav.addObject("categorys", list);
		mav.setViewName("person_first1");
		return mav;
	}
	@RequestMapping("toshow")
	public ModelAndView categoryinfo(int cid){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("person_first2");
		mav.addObject("id", cid);
		return mav;
	}
	@RequestMapping("showcondition")
	@ResponseBody
	public Map<String,Object> spcondition(int id){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Species> lsp = ps.findspebyid(id);
		List<Toxin> ltx = ps.findtoxin(id);
		List<String> ly =ps.findyearbyid(id);
		List<Province> lpro = is.findprovbyid(id);
		map.put("species", lsp);
		map.put("toxins", ltx);
		map.put("years", ly);
		map.put("provs", lpro);
		return map;
	}
	@RequestMapping("serachinfo")
	public ModelAndView serach(@RequestParam(defaultValue="0")int id,String[] crop_species,String[] input_time,
			String[] province,String[] toxin_type,@RequestParam(defaultValue="0-100")String pollution_rate,
			String text,String type,@RequestParam(defaultValue="0")int pagenum){
			ModelAndView mav = new ModelAndView();
			if(type!=null){
				pagenum=1;
				id=(Integer) map.get("id");
				crop_species=(String[]) map.get("breeds");
				input_time=(String[]) map.get("years");
				province=(String[]) map.get("provinces");
				toxin_type=(String[]) map.get("toxins");
				if(type.equals("pollutions")){
					pollution_rate=text;
					map.put(type, text);
				}else {
					String[] cond = (String[]) map.get(type);
					String[] cd=new String[cond.length-1];
					int index = 0;
					if(cond.length==1){
						cd =new String[1];
						cd[0]="0";
						map.put(type, cd);
					}else {
						for (int i = 0; i < cond.length; i++) {
							if(!cond[i].equals(text)){
								cd[index]=cond[i];
								index++;
							}
						}
						map.put(type, cd);
					}
				}
				input_time=(String[]) map.get("years");
			}else if(pagenum!=0){
				id=(Integer) map.get("id");
				crop_species=(String[]) map.get("breeds");
				input_time=(String[]) map.get("years");
				province=(String[]) map.get("provinces");
				toxin_type=(String[]) map.get("toxins");
				String[] pls=(String[]) map.get("pollutions");
				pollution_rate=pls[0]+"-"+pls[1];
			}else{
				pagenum=1;
				map.put("id", id);
				map.put("breeds", crop_species);
				map.put("years", input_time);
				map.put("provinces", province);
				map.put("toxins", toxin_type);
			}
			if(pollution_rate!=null){
				map.put("pollutions", pollution_rate.split("-"));
				mav.addObject("rate", pollution_rate);
			}
			PageBaen pagbean = new PageBaen();
			PageInfo<SampleInfo> info = is.findsample(pagenum,5,map);
			int colnumber = 0;
			int cur = info.getPrePage()+1;
			if(pagenum%5==0){
				colnumber = cur/5-1;
			}else {
				colnumber = cur/5;
			}
			pagbean.setCurrent(cur);
			pagbean.setColnumber(colnumber);
			pagbean.setPagenumber(info.getPages());
			pagbean.setList(info.getList());
			if(crop_species!=null){
				List<Species> sps = ps.showsearchspecies(map);
				mav.addObject("sps",sps);
			}
			if(toxin_type!=null){
				List<Toxin> txs = ps.showsearchtoxin(map);
				mav.addObject("txs",txs);
			}
			if(province != null){
				List<Province> provs = ps.showsearchprovince(map);
				mav.addObject("provs",provs);
			}
			for(SampleInfo sampleInfo : info.getList()){
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				String st = df.format(sampleInfo.getSamplingTime());
				String si = df.format(sampleInfo.getInputtime());
				sampleInfo.setSamptime(st);
				sampleInfo.setInptime(si);
			}
			mav.addObject("sample", pagbean);
			mav.addObject("id", id);
			String[] ys= (String[]) map.get("years");
			if(ys!=null){
				if(!ys[0].equals("0")){	
					mav.addObject("itime",input_time);
				}
			}
			mav.setViewName("cus");
		return mav;
	}
	@RequestMapping("showchart")
	public ModelAndView tochar(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer-chartview");
		return mav;
	}
	@RequestMapping("showmap")
	public ModelAndView tomap(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer-reqion");
		return mav;
	}
	@RequestMapping("findcategory")
	@ResponseBody
	public List<CropCategory> selectcategory(){
		List<CropCategory> list = ps.findcategorytosi();
		return list;
	}
	@RequestMapping("findspecies")
	@ResponseBody
	public List<Species> selectspecies(int id){
		List<Species> list = ps.findspebyid(id);
		return list;
	}
	@RequestMapping("findprov")
	@ResponseBody
	public List<Province> selectprov(int id){
		List<Province> list = is.findprovbyid(id);
		return list;
	}
	@RequestMapping("findyear")
	@ResponseBody
	public List<String> selectyear(int id){
		List<String> list = ps.findyearbyid(id);
		return list;
	}
	@RequestMapping("chartsp")
	@ResponseBody
	public Map<String, Object> charsp(@RequestParam(defaultValue="2")int id,String[] crop_species,String[] input_time,
			String[] province,String pollution_rate){
			Map<String, Object> mp =new HashMap<String, Object>();
			Map<String, Object> rp =new HashMap<String, Object>();
			mp.put("id", id);
			if(crop_species.length!=0){
				mp.put("breeds", crop_species);
			}
			if(input_time.length!=0){
				mp.put("years", input_time);
			}
			if(province.length!=0){
				mp.put("provinces", province);
			}
			mp.put("pollutions", pollution_rate.split("-"));
			PageInfo<SampleInfo> info  = is.findsample(1,5,mp);
			PageInfo<SampleInfo> infos  = is.findsample(1,(int)info.getTotal(),mp);
			List<Toxin> list = ts.findtoxin();
			rp.put("samp", infos.getList());
			rp.put("tx", list);
		return rp;
	}
	@RequestMapping("findcountry")
	@ResponseBody
	public List<MpData> findcy(String breed,String toxid,String year){
			Map<String, Object> dp = new HashMap<String, Object>();
			if(breed !=null && !breed.equals("")){
				dp.put("breed", breed);
			}
			if(year !=null && !year.equals("")){
				dp.put("year", year);
			}
			dp.put("toxid", toxid);
			List<MpData> list = ps.selectbymap(dp);
			for (MpData md : list) {
				int colid=Math.round(md.getNum());
				if(colid<=50 && colid>=0){
					md.setColorid(0);
				}else if(colid<=100 && colid>=50){
					md.setColorid(1);
				}else if(colid<=200 && colid>=100){
					md.setColorid(2);
				}else if(colid<=200 && colid>=400){
					md.setColorid(3);
				}
				md.setNum(md.getNum()/100);
			}
		return list;
	}
}
