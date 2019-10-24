package bean;

import java.util.Date;
import java.util.List;

public class SampleInfo {
	private int id;
	private String sampleid;
	private int speciesid;
	private int flag;
	private int categoryid;
	private String province;
    private String city;
    private String county;
    private String household;
    private Date harvestTime;
    private Date samplingTime;
    private String samptime;
    private String samplingPeople;
    private Float pollutionRate;
    private Species species;
    private Date inputtime;
    private String inptime;
    private Province pro;
    private City cit;
    private Town tw;
    private List<SampleToxin> txinfo;
    private PageBaen pb;
	public PageBaen getPb() {
		return pb;
	}
	public void setPb(PageBaen pb) {
		this.pb = pb;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSampleid() {
		return sampleid;
	}
	public void setSampleid(String sampleid) {
		this.sampleid = sampleid;
	}
	public int getSpeciesid() {
		return speciesid;
	}
	public void setSpeciesid(int speciesid) {
		this.speciesid = speciesid;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getHousehold() {
		return household;
	}
	public void setHousehold(String household) {
		this.household = household;
	}
	public Date getHarvestTime() {
		return harvestTime;
	}
	public void setHarvestTime(Date harvestTime) {
		this.harvestTime = harvestTime;
	}
	public Date getSamplingTime() {
		return samplingTime;
	}
	public void setSamplingTime(Date samplingTime) {
		this.samplingTime = samplingTime;
	}
	public String getSamplingPeople() {
		return samplingPeople;
	}
	public void setSamplingPeople(String samplingPeople) {
		this.samplingPeople = samplingPeople;
	}
	public Float getPollutionRate() {
		return pollutionRate;
	}
	public void setPollutionRate(Float pollutionRate) {
		this.pollutionRate = pollutionRate;
	}
	public Species getSpecies() {
		return species;
	}
	public void setSpecies(Species species) {
		this.species = species;
	}
	public Date getInputtime() {
		return inputtime;
	}
	public void setInputtime(Date inputtime) {
		this.inputtime = inputtime;
	}
	public Province getPro() {
		return pro;
	}
	public void setPro(Province pro) {
		this.pro = pro;
	}
	public City getCit() {
		return cit;
	}
	public void setCit(City cit) {
		this.cit = cit;
	}
	public Town getTw() {
		return tw;
	}
	public void setTw(Town tw) {
		this.tw = tw;
	}
	public List<SampleToxin> getTxinfo() {
		return txinfo;
	}
	public void setTxinfo(List<SampleToxin> txinfo) {
		this.txinfo = txinfo;
	}
	public String getSamptime() {
		return samptime;
	}
	public void setSamptime(String samptime) {
		this.samptime = samptime;
	}
	public String getInptime() {
		return inptime;
	}
	public void setInptime(String inptime) {
		this.inptime = inptime;
	}
}
