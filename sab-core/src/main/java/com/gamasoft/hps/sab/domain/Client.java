package com.gamasoft.hps.sab.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang.Validate;

import com.gamasoft.hps.sab.domain.base.AuditablePersistent;
import com.gamasoft.hps.sab.dto.ClientDto;
import com.gamasoft.hps.sab.dto.DashboardDto;

/**
 *
 * @author vascordoba
 */
@Entity
@Table(name = "client")
public class Client extends AuditablePersistent{

	private static final long serialVersionUID = 1L;

    @Column(name = "name", nullable = false, length = 50)
    private String name;
    
    @Column(name = "description", nullable = true, length = 50)
    private String description;
    
    @Column(name = "address", nullable = true, length = 50)
    private String address;
    
    @Column(name = "nit", nullable = true, length = 50)
    private String nit;
    
    @Column(name = "contactName", nullable = true, length = 50)
    private String contactName;
    
    @Column(name = "phone", nullable = true, length = 50)
    private String phone;
    

    public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNit() {
		return nit;
	}

	public void setNit(String nit) {
		this.nit = nit;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Client() {
    }

    public Client(ClientDto dto) {
        Validate.notNull(dto.getName(), "Name cannot be null");
        this.name = dto.getName();
        this.description = dto.getDescription();
        this.address = dto.getAddress();
        this.nit = dto.getNit();
        this.contactName = dto.getContactName();
        this.phone = dto.getPhone();
    }

    public String getName() {
        return name;
    }

    public void modify(String name) {
        Validate.notNull(name, "Name cannot be null");
        this.name = name;
    }

    @Override
    public boolean equals(final Object obj) {
        if (!(obj instanceof Client)) {
            return false;
        }
        Client other = (Client) obj;
        return (other.name.equals(name));
    }

    /**
     * Returns a hash code value for the object.
     *
     * @return a hash code value for the object.
     */
    @Override
    public int hashCode() {
        return name.hashCode();
    }

    /**
     * Returns a string representation of the object.
     *
     * @return a string representation of the object.
     */
    @Override
    public String toString() {
        return "Role: " + name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public ClientDto toDto(){
        ClientDto dto=new ClientDto();
        dto.setId(this.getId());
        dto.setName(this.name);
        dto.setDescription(this.description);
        dto.setAddress(this.address);
        dto.setNit(this.nit);
        dto.setContactName(this.contactName);
        dto.setPhone(this.phone);
        
        return dto;
    }
    
}
