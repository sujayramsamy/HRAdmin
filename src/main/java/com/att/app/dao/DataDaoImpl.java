package com.att.app.dao;

import java.util.HashMap;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import com.att.app.controller.AdminController;
import com.att.app.domain.Employee;

/**
 * Created by SujayR30 on 8/13/2016.
 */
@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DataDaoImpl implements DataDao {
	private static final Logger logger = Logger
			.getLogger(AdminController.class);

	// List<Employee> employeePersistanceList = new ArrayList<>();

	HashMap<Employee, Integer> hmap = new HashMap<Employee, Integer>();

	public void insertRow(Employee employee) {
		employee.setId(hmap.size() + 1);

		hmap.put(employee, hmap.size() + 1);
		logger.info("User has beed successfully added  User ID"
				+ employee.getEmpId());

		logger.info("List of total User" + hmap.size());

	}

	public Set<Employee> getList() {
		logger.info("reterviging the list of user from getList()");
		hmap.keySet();
		logger.info("List of total User" + hmap.size());
		return hmap.keySet();

	}

	public Employee getRowById(int id) {

		Set<Employee> emPlist = hmap.keySet();
		Employee employee = null;
		for (Employee emp : emPlist) {
			if (emp.getId() == id) {
				employee = new Employee();
				employee.setFirstName(emp.getFirstName());
				employee.setLastName(emp.getLastName());
				employee.setPhone(emp.getPhone());
				employee.setAddress(emp.getAddress());
				employee.setCity(emp.getCity());
				employee.setState(emp.getState());
				employee.setSsn(emp.getSsn());
				employee.setZip(emp.getZip());
				employee.setDateOfBirth(emp.getDateOfBirth());
				employee.setId(emp.getId());
				employee.setEmpId(emp.getEmpId());
			}
		}
		return employee;
	}

	public void updateRow(Employee employee) {

		logger.info("Updating user record for:" + employee.getEmpId());
		hmap.values().remove(employee.getId());
		hmap.put(employee, hmap.size() + 1);
		logger.info("User has been updated successfully for:"
				+ employee.getEmpId());
	}

	public void deleteRow(int id) {
		logger.info("Removeing the user from the DB for:" + id);
		hmap.remove(id);
	}

}