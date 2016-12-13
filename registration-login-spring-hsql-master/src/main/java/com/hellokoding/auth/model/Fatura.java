package com.hellokoding.auth.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "fatura")
public class Fatura implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="cod_fatura")
	private Long codFatura;
	
	@Column(name="dt_entrada")
	private Date dtEntrada;
	
	@Column(name="dt_saida")
	private Date dtSaida;
	
	@Column(name="valor_parcial")
	private Double valorParcial;
	
	@Column(name="valor_final")
	private Double valorFinal;
	
	@Column(name="status_fatura")
	private String statusFatura;
	
	public Fatura() {
		
	}
	
	public Fatura(Long codFatura, Date dtEntrada, Date dtSaida,
			Double valorParcial, Double valorFinal, String statusFatura) {
		this.codFatura = codFatura;
		this.dtEntrada = dtEntrada;
		this.dtSaida = dtSaida;
		this.valorParcial = valorParcial;
		this.valorFinal = valorFinal;
		this.statusFatura = statusFatura;
	}

	public Long getCodFatura() {
		return codFatura;
	}

	public void setCodFatura(Long codFatura) {
		this.codFatura = codFatura;
	}

	public Date getDtEntrada() {
		return dtEntrada;
	}

	public void setDtEntrada(Date dtEntrada) {
		this.dtEntrada = dtEntrada;
	}

	public Date getDtSaida() {
		return dtSaida;
	}

	public void setDtSaida(Date dtSaida) {
		this.dtSaida = dtSaida;
	}

	public Double getValorParcial() {
		return valorParcial;
	}

	public void setValorParcial(Double valorParcial) {
		this.valorParcial = valorParcial;
	}

	public Double getValorFinal() {
		return valorFinal;
	}

	public void setValorFinal(Double valorFinal) {
		this.valorFinal = valorFinal;
	}

	public String getStatusFatura() {
		return statusFatura;
	}

	public void setStatusFatura(String statusFatura) {
		this.statusFatura = statusFatura;
	}

}
