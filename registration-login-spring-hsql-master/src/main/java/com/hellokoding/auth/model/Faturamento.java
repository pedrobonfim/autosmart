package com.hellokoding.auth.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "faturamento")
public class Faturamento implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="mat_user")
	private Long matUser;
	
	@Column(name="cod_func", nullable = false)
	private Long codFunc;

	public Faturamento(){
		
	}
	
	public Faturamento(Long matUser, Long codFunc) {
		this.matUser = matUser;
		this.codFunc = codFunc;
	}

	public Long getMatUser() {
		return matUser;
	}

	public void setMatUser(Long matUser) {
		this.matUser = matUser;
	}

	public Long getCodFunc() {
		return codFunc;
	}

	public void setCodFunc(Long codFunc) {
		this.codFunc = codFunc;
	}


}
