package com.wipro.web;

public class FlightDetails {
	private int flight_id;
	private String flight_name;
	private String source;
	private String destination;
	private String etd;
	private String seating_capacity;
	private String reservaton_type;
	private String reservaton_capacity;
	
		
	public FlightDetails(String flight_name, String source, String destination, String etd, String seating_capacity,
			String reservaton_type, String reservaton_capacity) {
		super();
		this.flight_name = flight_name;
		this.source = source;
		this.destination = destination;
		this.etd = etd;
		this.seating_capacity = seating_capacity;
		this.reservaton_type = reservaton_type;
		this.reservaton_capacity = reservaton_capacity;
	}
	public FlightDetails(int flight_id, String flight_name, String source, String destination, String etd,
			String seating_capacity, String reservaton_type, String reservaton_capacity) {
		super();
		this.flight_id = flight_id;
		this.flight_name = flight_name;
		this.source = source;
		this.destination = destination;
		this.etd = etd;
		this.seating_capacity = seating_capacity;
		this.reservaton_type = reservaton_type;
		this.reservaton_capacity = reservaton_capacity;
	}
	public int getFlight_id() {
		return flight_id;
	}
	public void setFlight_id(int flight_id) {
		this.flight_id = flight_id;
	}
	public String getFlight_name() {
		return flight_name;
	}
	public void setFlight_name(String flight_name) {
		this.flight_name = flight_name;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getEtd() {
		return etd;
	}
	public void setEtd(String etd) {
		this.etd = etd;
	}
	public String getSeating_capacity() {
		return seating_capacity;
	}
	public void setSeating_capacity(String seating_capacity) {
		this.seating_capacity = seating_capacity;
	}
	public String getReservaton_type() {
		return reservaton_type;
	}
	public void setReservaton_type(String reservaton_type) {
		this.reservaton_type = reservaton_type;
	}
	public String getReservaton_capacity() {
		return reservaton_capacity;
	}
	public void setReservaton_capacity(String reservaton_capacity) {
		this.reservaton_capacity = reservaton_capacity;
	}
	

}
