/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamasoft.hps.sab.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.commons.lang.Validate;

import com.gamasoft.hps.sab.domain.base.AuditablePersistent;
import com.gamasoft.hps.sab.dto.UserDto;

/**
 * 
 * @author vascordoba
 */
@Entity
@Table(name = "user")
@DiscriminatorValue("user")
public class User extends AuditablePersistent{

	private static final long serialVersionUID = 1L;

	@Column(name = "username", nullable = false, length = 50, unique = true)
	private String username;

	@Column(name = "fullname", nullable = false, length = 50)
	private String fullName;

	// Length must be 512 because the password is encrypted
	@Column(name = "password", nullable = false, length = 512)
	private String password;

	@Column(name = "email", nullable = false, length = 100, unique = true)
	private String email;

	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.PERSIST,
			CascadeType.MERGE, CascadeType.REFRESH })
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles = new HashSet<Role>();

    
	public User() {
		this("", ""); // WTF!?
	}

    public User(UserDto dto) {
        this.username = dto.getUsername();
        this.fullName = dto.getFullName();
        this.password = dto.getPassword();
        this.email = dto.getEmail();
    }
    
    

	public User(final String username, final String email) {
		Validate.notNull(username, "The user name cannot be null");
		Validate.notNull(email, "The user email cannot be null");
		this.username = username;
		this.email = email;
	}

	public void modify(final String newUsername, final String newEmail) {
		Validate.notNull(newUsername, "The user name cannot be null");
		Validate.notNull(newEmail, "The user email cannot be null");
		username = newUsername;
		email = newEmail;
	}

	/**
	 * Changes the user password.
	 * 
	 * @param newPassword
	 *            The new user password. It cannot be null.
	 * 
	 *            TODO Decide how to manage the password restrictions. Should
	 *            this decision be delegated to a strategy?
	 */
	public void changePassword(final String newPassword) {
		Validate.notNull(newPassword, "The password cannot be null");
		password = newPassword;
	}

	/**
	 * Validates the password of the user.
	 * 
	 * @param thePassword
	 *            The password to validate.
	 * 
	 * @return Returns true if the provided password matches the user password,
	 *         false otherwise.
	 */
	public boolean validatePassword(final String thePassword) {
		return password.equals(thePassword);
	}

	/**
	 * Returns the password of the user.
	 * 
	 * @return Returns the password. Never returns null.
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * Returns the email of the user.
	 * 
	 * @return the email address.
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * Returns the roles of the user.
	 * 
	 * @return the roles
	 */
	public Set<Role> getRoles() {
		return roles;
	}

	public boolean hasRole(String roleName) {
		for (Role role : this.getRoles()) {
			if (role.getName().equals(roleName)) {
				return true;
			}
		}
		return false;
	}

	public void setRole(Role role) {
		this.roles.clear();
		this.roles.add(role);
	}

	public void setEmail(String email) {
		Validate.notNull(email, "The email cannot be null");
		this.email = email;
	}

	public void setPassword(String password) {
		Validate.notNull(password, "The password cannot be null");
		this.password = password;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result
				+ ((username == null) ? 0 : username.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;

		User other = (User) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;

		return true;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(final String fullName) {
		Validate.notNull(fullName, "The user fullname cannot be null");
		this.fullName = fullName;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public void setUsername(String username) {
		Validate.notNull(username, "The username cannot be null");
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

    public UserDto toDto(){
        UserDto dto=new UserDto();
        dto.setId(getId());
        dto.setFullName(getFullName());
        dto.setEmail(getEmail());
        dto.setPassword(getPassword());
        dto.setUsername(getUsername());
        return dto;
    }

}
