package com.att.app.dao;

import java.util.Set;

import com.att.app.domain.Employee;

/**
 * Created by SujayR30 on 8/13/2016.
 */
public interface DataDao {

	public void insertRow(Employee employee);

	public Set<Employee> getList();

	public Employee getRowById(int id);

	public void updateRow(Employee employee);

	public void deleteRow(int id);
}
