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
@Table(name = "reserva")
public class Reserva implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="cod_reserva")
	private Long codReserva;
	
	@Column(name="dt_reserva")
	private Date dtReserva;
	
	public Reserva() {
		
	}

	public Reserva(Long codReserva, Date dtReserva) {
		this.codReserva = codReserva;
		this.dtReserva = dtReserva;
	}

	public Long getCodReserva() {
		return codReserva;
	}

	public void setCodReserva(Long codReserva) {
		this.codReserva = codReserva;
	}

	public Date getDtReserva() {
		return dtReserva;
	}

	public void setDtReserva(Date dtReserva) {
		this.dtReserva = dtReserva;
	}
	
}
