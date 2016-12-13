package com.hellokoding.auth.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "vaga")
public class Vaga implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="cod_reserva")
	private Long codReserva;
	
	@Column(name="status_vaga", nullable = false)
	private String statusVaga;
	
	@Column(name="tipo_vaga")
	private String tipoVaga;
	
	@Column(name="valor_vaga")
	private Double valorVaga;
	
	public Vaga() {
		
	}

	public Vaga(Long codReserva, String statusVaga, String tipoVaga,
			Double valorVaga) {
		this.codReserva = codReserva;
		this.statusVaga = statusVaga;
		this.tipoVaga = tipoVaga;
		this.valorVaga = valorVaga;
	}

	public Long getCodReserva() {
		return codReserva;
	}

	public void setCodReserva(Long codReserva) {
		this.codReserva = codReserva;
	}

	public String getStatusVaga() {
		return statusVaga;
	}

	public void setStatusVaga(String statusVaga) {
		this.statusVaga = statusVaga;
	}

	public String getTipoVaga() {
		return tipoVaga;
	}

	public void setTipoVaga(String tipoVaga) {
		this.tipoVaga = tipoVaga;
	}

	public Double getValorVaga() {
		return valorVaga;
	}

	public void setValorVaga(Double valorVaga) {
		this.valorVaga = valorVaga;
	}
	
}
