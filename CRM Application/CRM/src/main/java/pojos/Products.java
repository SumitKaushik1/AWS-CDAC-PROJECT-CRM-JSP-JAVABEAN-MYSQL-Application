package pojos;

public class Products {
	private String productId;
	private String productType;
	private String productItemName;
	private Integer productQuantity;
	private String productDescription;
	private String userDescription;
	
	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Products(String productId, String productType, String productItemName, Integer productQuantity,
			String productDescription, String userDescription) {
		super();
		this.productId = productId;
		this.productType = productType;
		this.productItemName = productItemName;
		this.productQuantity = productQuantity;
		this.productDescription = productDescription;
		this.userDescription = userDescription;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductItemName() {
		return productItemName;
	}

	public void setProductItemName(String productItemName) {
		this.productItemName = productItemName;
	}

	public Integer getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getUserDescription() {
		return userDescription;
	}

	public void setUserDescription(String userDescription) {
		this.userDescription = userDescription;
	}

	@Override
	public String toString() {
		return "Products [productId=" + productId + ", productType=" + productType + ", productItemName="
				+ productItemName + ", productQuantity=" + productQuantity + ", productDescription="
				+ productDescription + ", userDescription=" + userDescription + "]";
	}
	
	

}
