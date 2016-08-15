package com.att.app.domain;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

/**
 * Created by SujayR30 on 8/13/2016.
 */

public class Employee implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 636533475709209875L;

	private String empId;

	private int Id;

	private String firstName;

	private String lastName;

	private String address;

	private String address1;

	private String city;

	private String state;

	private String zip;

	private BigInteger ssn;

	private String phone;

	private Date dateOfBirth;

	public BigInteger getSsn() {
		return ssn;
	}

	public void setSsn(BigInteger ssn) {
		this.ssn = ssn;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
