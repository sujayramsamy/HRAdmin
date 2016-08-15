package com.att.app.domain;

import java.util.Set;

/**
 * Created by SujayR30 on 9/15/2014.
 */
public class EmployeeJsonObject {

	int iTotalRecords;

	int iTotalDisplayRecords;

	String sEcho;

	String sColumns;

	public Set<EmployeeDTO> getAaData() {
		return aaData;
	}

	public void setAaData(Set<EmployeeDTO> aaData) {
		this.aaData = aaData;
	}

	Set<EmployeeDTO> aaData;

	public int getiTotalRecords() {
		return iTotalRecords;
	}

	public void setiTotalRecords(int iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}

	public int getiTotalDisplayRecords() {
		return iTotalDisplayRecords;
	}

	public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}

	public String getsEcho() {
		return sEcho;
	}

	public void setsEcho(String sEcho) {
		this.sEcho = sEcho;
	}

	public String getsColumns() {
		return sColumns;
	}

	public void setsColumns(String sColumns) {
		this.sColumns = sColumns;
	}

}
