package com.hellokoding.auth.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "gerente")
public class Gerente implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="mat_func")
    private Long matFunc;

	@Column(name = "nome", nullable = false)
    private String nome;   

	@Column(name = "senha_func", nullable = false)
    private String senhaFunc;   

	@Column(name = "tel_func")
    private Long telFunc;
	
	public Gerente(){
		
	}
	
	public Gerente(Gerente gerente) {
	        this.matFunc = gerente.matFunc;
	        this.nome = gerente.nome;
	        this.senhaFunc = gerente.senhaFunc;       
	        this.telFunc = gerente.telFunc;
	}

	public Long getMatFunc() {
		return matFunc;
	}

	public void setMatFunc(Long matFunc) {
		this.matFunc = matFunc;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSenhaFunc() {
		return senhaFunc;
	}

	public void setSenhaFunc(String senhaFunc) {
		this.senhaFunc = senhaFunc;
	}

	public Long getTelFunc() {
		return telFunc;
	}

	public void setTelFunc(Long telFunc) {
		this.telFunc = telFunc;
	}
    
}
