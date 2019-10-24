package bean;

public class SampleToxin {
    private Integer id;

    private Integer toxinId;

    private Float toxinCount;

    private Integer sampleInfoId;
    
    private Toxin toxin;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getToxinId() {
        return toxinId;
    }

    public void setToxinId(Integer toxinId) {
        this.toxinId = toxinId;
    }

    public Float getToxinCount() {
        return toxinCount;
    }

    public void setToxinCount(Float toxinCount) {
        this.toxinCount = toxinCount;
    }

    public Integer getSampleInfoId() {
        return sampleInfoId;
    }

    public void setSampleInfoId(Integer sampleInfoId) {
        this.sampleInfoId = sampleInfoId;
    }

	public Toxin getToxin() {
		return toxin;
	}

	public void setToxin(Toxin toxin) {
		this.toxin = toxin;
	}
}