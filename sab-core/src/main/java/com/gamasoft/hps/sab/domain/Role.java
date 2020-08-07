package com.gamasoft.hps.sab.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang.Validate;

import com.gamasoft.hps.sab.domain.base.AuditablePersistent;

/**
 *
 * @author vascordoba
 */
@Entity
@Table(name = "role")
public class Role extends AuditablePersistent{

	private static final long serialVersionUID = 1L;

    @Column(name = "name", nullable = false, length = 50)
    private String name;

    public Role() {
    }

    public Role(String name) {
        Validate.notNull(name, "Name cannot be null");
         this.name = name;
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
        if (!(obj instanceof Role)) {
            return false;
        }
        Role other = (Role) obj;
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
    
    
}
