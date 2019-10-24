package serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import dao.IMDao;
import bean.City;
import bean.Province;
import bean.SampleInfo;
import bean.Town;
import service.IMService;

@Service
public class IMServiceImpl implements IMService{
	@Autowired
	IMDao idao;
	
	public List<Province> findProvince() {
		return idao.findProvince();
	}


	public List<City> findCity(String pcode) {
		return idao.findCity(pcode);
	}


	public List<Town> findTown(String tcode) {
		return idao.findTown(tcode);
	}

	public PageInfo<SampleInfo> findall(int pageNum,Map<String, Object> map) {
		PageHelper.startPage(pageNum, 5);
		List<SampleInfo> infos = idao.findsiid(map);
		PageInfo<SampleInfo> info = new PageInfo<SampleInfo>(infos);
		List<SampleInfo> infos2 = new ArrayList<SampleInfo>();
		for (SampleInfo sampleInfo : info.getList()) {
			map.put("sid", sampleInfo.getId());
			infos2.add(idao.findsimpleinfo(map));
		}
		info.setList(infos2);
		return info;
	}


	public List<Province> findprovbyid(int id) {
		return idao.findprovbyid(id);
	}


	public List<SampleInfo> serachinfo(Map<String, Object> map) {
		return idao.serachinfo(map);
	}


	public PageInfo<SampleInfo> findsample(int pageNum,int pagsize,Map<String, Object> map) {
			PageHelper.startPage(pageNum, pagsize);
			List<SampleInfo> infos = idao.serachinfo(map);
			PageInfo<SampleInfo> info = new PageInfo<SampleInfo>(infos);
			List<SampleInfo> infos2 = new ArrayList<SampleInfo>();
			for (SampleInfo sampleInfo : info.getList()) {
				map.put("sid", sampleInfo.getId());
				infos2.add(idao.findsimpleinfo(map));
			}
			
			info.setList(infos2);
		return info;
	}
}
