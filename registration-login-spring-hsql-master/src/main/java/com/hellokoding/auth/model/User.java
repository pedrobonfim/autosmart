package com.hellokoding.auth.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "user")
public class User {
    private Long id;
    private String username;
    private String password;
    private String passwordConfirm;
    private Set<Role> roles;
    
    @Column(name = "email", nullable = false)
    private String email;
	
	@Column(name="rg", nullable = false)
	private String rG;
	
	@Column(name="cpf", nullable = false)
	private String cPF;
	
	@Column(name="cartao_credito")
	private Long cartaoCredito;
	
	@Column(name="validade_cartao")
	private String validadeCartao;
	
	@Column(name="cod_seg_cartao")
	private Long codSegCartao;
	
	@Column(name="tel_user")
	private Long telUser;
	
	@Column(name="status_user")
	private String statusUser;
    

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    @ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
    
    public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRG() {
		return rG;
	}

	public void setRG(String rg) {
		this.rG = rg;
	}

	public String getCPF() {
		return cPF;
	}

	public void setCPF(String cpf) {
		this.cPF = cpf;
	}

	public Long getCartaoCredito() {
		return cartaoCredito;
	}

	public void setCartaoCredito(Long cartaoCredito) {
		this.cartaoCredito = cartaoCredito;
	}

	public String getValidadeCartao() {
		return validadeCartao;
	}

	public void setValidadeCartao(String validadeCartao) {
		this.validadeCartao = validadeCartao;
	}

	public Long getCodSegCartao() {
		return codSegCartao;
	}

	public void setCodSegCartao(Long codSegCartao) {
		this.codSegCartao = codSegCartao;
	}

	public Long getTelUser() {
		return telUser;
	}

	public void setTelUser(Long telUser) {
		this.telUser = telUser;
	}

	public String getStatusUser() {
		return statusUser;
	}

	public void setStatusUser(String statusUser) {
		this.statusUser = statusUser;
	}

}
