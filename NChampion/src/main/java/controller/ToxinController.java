package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import service.ToxinServince;
import bean.PageBaen;
import bean.Toxin;

@Controller
public class ToxinController {
	@Autowired
	private ToxinServince ts;
	
	@RequestMapping("selectToxin")
	@ResponseBody
	public List<Toxin> selectToxin(){
		List<Toxin> list = ts.findtoxin();
		return list;
	}
	@RequestMapping("findAlltoxin")
	public ModelAndView findetoxin(@RequestParam(value="pagenumber",required=false,defaultValue="1")int pagenumber){
		ModelAndView mav = new ModelAndView();
		PageHelper.startPage(pagenumber,5);
		PageBaen pagbean = new PageBaen();
		List<Toxin> list = ts.findtoxin();
		PageInfo<Toxin> page = new PageInfo<Toxin>(list);
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
		pagbean.setList(list);
		mav.addObject("toxins",pagbean);
		mav.setViewName("categorylist-dusu");
		return mav;
	}
	@RequestMapping(value="isexittx",method=RequestMethod.POST)
	public void isexit(String toxinname,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String flag = ts.isexittx(toxinname);
		response.getWriter().write(flag);
	}
	@RequestMapping(value="addtoxin",method=RequestMethod.POST)
	public ModelAndView addtoxin(Toxin tx){
		ModelAndView mav = new ModelAndView();
		ts.addtoxin(tx);
		mav.setViewName("redirect:findAlltoxin");
		return mav;
	}
	@RequestMapping(value="deletetoxinx",method=RequestMethod.POST)
	public String deletetoxin(int id){
		ts.deletetoxin(id);
		return "true";
	}
	@RequestMapping("showtoxin")
	public ModelAndView toedit(int id){
		ModelAndView mav = new ModelAndView();
		Toxin tx = ts.showtoxin(id);
		mav.addObject("toxin",tx);
		mav.setViewName("toxinedit");
		return mav;
	}
	@RequestMapping(value="updatetoxin",method=RequestMethod.POST)
	public ModelAndView updatetoxin(Toxin tx){
		ModelAndView mav = new ModelAndView();
		ts.updatetoxin(tx);
		mav.setViewName("redirect:findAlltoxin");
		return mav;
	}
}
