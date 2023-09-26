package pojos;

public class Permission {
	private String perId;
	private String perModule;
	private String perName;
	private String rolesRoleId;
	public Permission(String perId, String perModule, String perName, String rolesRoleId) {
		super();
		this.perId = perId;
		this.perModule = perModule;
		this.perName = perName;
		this.rolesRoleId = rolesRoleId;
	}
	public Permission() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPerId() {
		return perId;
	}
	public void setPerId(String perId) {
		this.perId = perId;
	}
	public String getPerModule() {
		return perModule;
	}
	public void setPerModule(String perModule) {
		this.perModule = perModule;
	}
	public String getPerName() {
		return perName;
	}
	public void setPerName(String perName) {
		this.perName = perName;
	}
	public String getRolesRoleId() {
		return rolesRoleId;
	}
	public void setRolesRoleId(String rolesRoleId) {
		this.rolesRoleId = rolesRoleId;
	}
	@Override
	public String toString() {
		return "Permission [perId=" + perId + ", perModule=" + perModule + ", perName=" + perName + ", rolesRoleId="
				+ rolesRoleId + "]";
	}
	
	

}
