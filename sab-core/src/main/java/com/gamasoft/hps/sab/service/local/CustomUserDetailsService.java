/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gamasoft.hps.sab.service.local;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gamasoft.hps.sab.domain.Role;
import com.gamasoft.hps.sab.repository.UserRepository;

/**
 *
 * @author vascordoba
 */
@Service
@Transactional(readOnly = true)
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    /**
     * Sets the userRepository. This was added for testing purposes, since Spring doesn't need it.
     *
     * @param userRepository
     */
    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public UserDetails loadUserByUsername(final String email) throws UsernameNotFoundException {
        try {
            com.gamasoft.hps.sab.domain.User domainUser = userRepository.getUserByEmail(email);

            boolean enabled = true;
            boolean accountNonExpired = true;
            boolean credentialsNonExpired = true;
            boolean accountNonLocked = true;

            return new org.springframework.security.core.userdetails.User(
                    domainUser.getUsername(),
                    domainUser.getPassword().toLowerCase(),
                    enabled,
                    accountNonExpired,
                    credentialsNonExpired,
                    accountNonLocked,
                    getAuthorities(domainUser.getRoles()));

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Retrieves a collection of {@link GrantedAuthority} based on a numerical role
     *
     * @param role Set containing the user roles assigned
     * @return a collection of {@link GrantedAuthority
     */
    public Collection<? extends GrantedAuthority> getAuthorities(Set<Role> role) {
        return getGrantedAuthorities(getRoles(role));
    }

    /**
     * Converts a numerical role to an equivalent list of roles
     *
     * @param role Set containing the user roles assigned
     * @return list of roles as as a list of {@link String}
     */
    public List<String> getRoles(Set<Role> roleSet) {
        List<String> roles = new ArrayList<String>();

        Iterator<? extends Role> it = roleSet.iterator();

        while (it.hasNext()) {
            Role r = it.next();
            roles.add(r.getName());
        }

        return roles;
    }

    /**
     * Wraps {@link String} roles to {@link SimpleGrantedAuthority} objects
     *
     * @param roles {@link String} of roles
     * @return list of granted authorities
     */
    public static List<GrantedAuthority> getGrantedAuthorities(List<String> roles) {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for (String role : roles) {
            authorities.add(new SimpleGrantedAuthority(role));
        }
        return authorities;
    }
}
