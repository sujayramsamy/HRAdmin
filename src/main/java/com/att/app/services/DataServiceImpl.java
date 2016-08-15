package com.att.app.services;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.att.app.dao.DataDao;
import com.att.app.domain.Employee;
import com.att.app.domain.EmployeeDTO;

/**
 * Created by SujayR30 on 8/13/2016.
 */
public class DataServiceImpl implements DataService {

	@Autowired
	DataDao dataDao;

	public void insertRow(Employee employee) {
		dataDao.insertRow(employee);
	}

	public Set<EmployeeDTO> getList() {
		Set<EmployeeDTO> employeeDTOList = new HashSet<>();
		Set<Employee> EmployeeList = dataDao.getList();
		EmployeeDTO employeeDTO = null;

		for (Employee employee : EmployeeList) {
			employeeDTO = new EmployeeDTO();
			employeeDTO.setAddress(employee.getAddress());
			employeeDTO.setSsn(employee.getSsn());
			employeeDTO.setCity(employee.getCity());
			employeeDTO.setEmpId(employee.getEmpId());
			employeeDTO.setPhone(employee.getPhone());
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			String reportDate = df.format(employee.getDateOfBirth());
			employeeDTO.setDateOfBirth(reportDate);
			employeeDTO.setFirstName(employee.getFirstName());
			employeeDTO.setLastName(employee.getLastName());
			employeeDTO.setState(employee.getState());
			employeeDTO.setZip(employee.getZip());
			employeeDTO.setId(employee.getId());
			employeeDTOList.add(employeeDTO);
		}
		return employeeDTOList;
	}

	public Employee getRowById(int id) {
		return dataDao.getRowById(id);
	}

	public void updateRow(Employee employee) {
		dataDao.updateRow(employee);
	}

	public void deleteRow(int id) {
		dataDao.deleteRow(id);
	}

}