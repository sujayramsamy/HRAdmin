package com.att.app.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.att.app.domain.Employee;
/**
 * Created by SujayR30 on 8/13/2016.
 */
public class EmployeeValidator implements Validator {

    public boolean supports(Class<?> klass) {
        return Employee.class.isAssignableFrom(klass);
    }

  
    public void validate(Object target, Errors errors) {

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "firstName.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "lastName.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "address.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "city", "city.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "state", "state.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "zip", "zip.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ssn", "ssn.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "phone.required");
        Employee emp = (Employee) target;

        if(emp.getPhone().length() <=5){
            errors.rejectValue("Phone", "phoneLength", new Object[]{"'phone'"}, "phone.required");
        }

       

    }
}
