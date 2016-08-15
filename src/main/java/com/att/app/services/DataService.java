package com.att.app.services;


import java.util.Set;

import com.att.app.domain.Employee;
import com.att.app.domain.EmployeeDTO;

/**
 * Created by SujayR30 on 8/13/2016.
 */
public interface DataService {

    public void insertRow(Employee employee);

    public Set<EmployeeDTO> getList();

    public Employee getRowById(int id);

    public void updateRow(Employee employee);

    public void deleteRow(int id);
}
