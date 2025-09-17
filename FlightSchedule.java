package com.wipro.web;

public class FlightSchedule {
	private int flight_id;
	private String flight_name;
	private String avail_days;
	
	public FlightSchedule(String flight_name, String avail_days) {
		super();
		this.flight_name = flight_name;
		this.avail_days = avail_days;
	}
	public FlightSchedule(int flight_id,String flight_name, String avail_days) {
		super();
		this.flight_id = flight_id;
		this.flight_name = flight_name;
		this.avail_days = avail_days;
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
	public String getAvail_days() {
		return avail_days;
	}
	public void setAvail_days(String avail_days) {
		this.avail_days = avail_days;
	}
}
