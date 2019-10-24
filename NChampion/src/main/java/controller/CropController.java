package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import bean.CropCategory;
import bean.PageBaen;
import bean.Species;
import service.CropService;


@Controller
public class CropController {
	@Autowired
	private CropService cs;
	
	@RequestMapping("selectspecise")
	@ResponseBody
	public List<Species> selectspecise(){
		List<Species> list = cs.findSpecies();
		return list;
	}
	
	@RequestMapping("/findAllCategory")
	public ModelAndView findAllCategory(String pagenumber){
		ModelAndView mav = new ModelAndView();
		int current = 1;
		if(pagenumber!=null && !"".equals(pagenumber)){
			current = Integer.parseInt(pagenumber);
		}
		PageHelper.startPage(current,6);
		PageBaen pagbean = new PageBaen();
		List<CropCategory> list = cs.findAllCategory();
		PageInfo<CropCategory> page = new PageInfo<CropCategory>(list);
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
		mav.addObject("categorys",pagbean);
		mav.setViewName("categorylist");
		return mav;
	}
	@RequestMapping("deleteCategory")
	public ModelAndView delete(int id){
		ModelAndView mav = new ModelAndView();
		cs.deletecategory(id);
		mav.setViewName("redirect:findAllCategory");
		return mav;
	}
	@RequestMapping(value="isexist",method=RequestMethod.POST)
	public void isexit(String speciesname,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String flag = cs.isexist(speciesname);
		response.getWriter().write(flag);
	}
	@RequestMapping(value="addCategory",method=RequestMethod.POST)
	public ModelAndView addcate(CropCategory cate){
		ModelAndView mav = new ModelAndView();
		cs.addcate(cate);
		mav.setViewName("redirect:findAllCategory");
		return mav;
	}
	@RequestMapping("cropfindByid")
	public ModelAndView showcate(int id){
		ModelAndView mav = new ModelAndView();
		CropCategory category = cs.showcategory(id);
		List<Species> list = cs.showspecies(id);
		mav.addObject("species",list);
		mav.addObject("category",category);
		mav.setViewName("categoryedit");
		return mav;
	}
	@RequestMapping(value="updateCategory",method=RequestMethod.POST)
	public ModelAndView updatecate(CropCategory cate){
		ModelAndView mav = new ModelAndView();
		cs.updatecategory(cate);
		mav.setViewName("redirect:findAllCategory");
		return mav;
	}
	@RequestMapping("tospadd")
	public ModelAndView tospadd(int cid){
		ModelAndView mav = new ModelAndView();
		mav.addObject("cid", cid);
		mav.setViewName("speciesadd");
		return mav;
	}
	@RequestMapping(value="addspecies",method=RequestMethod.POST)
	public ModelAndView addspe(Species spc){
		ModelAndView mav = new ModelAndView();
		cs.addspecie(spc);
		mav.setViewName("redirect:cropfindByid?id="+spc.getCatgoryid());
		return mav;
	}
	@RequestMapping(value="isexitsp",method=RequestMethod.POST)
	public void isexitsp(String toxinname,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String flag = cs.isexitsp(toxinname);
		response.getWriter().write(flag);
	}
	@RequestMapping("deletespecies")
	public ModelAndView deletespec(int id,int cid){
		ModelAndView mav = new ModelAndView();
		cs.deletespecie(id);
		mav.setViewName("redirect:cropfindByid?id="+cid);
		return mav;
	}
	@RequestMapping("tospedit")
	public ModelAndView tospedit(int id,int cid){
		ModelAndView mav = new ModelAndView();
		Species species = cs.selectonesp(id);
		mav.addObject("cid",cid);
		mav.addObject("species", species);
		mav.setViewName("speciesedit");
		return mav;
	}
	@RequestMapping(value="updatespecies",method=RequestMethod.POST)
	public ModelAndView updatesp(Species spe){
		ModelAndView mav = new ModelAndView();
		cs.updatespcies(spe);
		mav.setViewName("redirect:cropfindByid?id="+spe.getCatgoryid());
		return mav;
	}
}
