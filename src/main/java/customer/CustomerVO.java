package customer;

public class CustomerVO {
    private int id, no;
    private String writer, product, usagePeriod, webHosting, hostingType, serverScale, webStorage;
    
    // Getter and setter for 'no'
    public int getNo() {
        return no;
    }
    public void setNo(int no) {
        this.no = no;
    }
    
    // Getter and setter for 'id'
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
 // Getter and setter for 'writer'
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

    // Getter and setter for 'product'
    public String getProduct() {
        return product;
    }
    public void setProduct(String product) {
        this.product = product;
    }
    
    // Getter and setter for 'usagePeriod'
    public String getUsagePeriod() {
        return usagePeriod;
    }
    public void setUsagePeriod(String usagePeriod) {
        this.usagePeriod = usagePeriod;
    }
    
    // Getter and setter for 'webHosting'
    public String getWebHosting() {
        return webHosting;
    }
    public void setWebHosting(String webHosting) {
        this.webHosting = webHosting;
    }
    
    // Getter and setter for 'hostingType'
    public String getHostingType() {
        return hostingType;
    }
    public void setHostingType(String hostingType) {
        this.hostingType = hostingType;
    }
    
    // Getter and setter for 'serverScale'
    public String getServerScale() {
        return serverScale;
    }
    public void setServerScale(String serverScale) {
        this.serverScale = serverScale;
    }
    
    // Getter and setter for 'webStorage'
    public String getWebStorage() {
        return webStorage;
    }
    public void setWebStorage(String webStorage) {
        this.webStorage = webStorage;
    }
}
