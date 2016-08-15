package com.att.app.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.Set;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.att.app.domain.Employee;
import com.att.app.domain.EmployeeDTO;
import com.att.app.domain.EmployeeJsonObject;
import com.att.app.services.DataService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Created by SujayR30 on 8/13/2016.
 */
@Controller
public class AdminController {
	private static final Logger logger = Logger
			.getLogger(AdminController.class);

	@Autowired
	DataService dataService;

	@Autowired
	@Qualifier("employeeValidator")
	private Validator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	String loggedInUserName = null;

	@RequestMapping("/hrModule")
	public ModelAndView Authorize(ModelMap model, Principal principal) {

		loggedInUserName = principal.getName();
		logger.info("login Success" + loggedInUserName);
		return new ModelAndView("redirect:/welcome");
	}

	@RequestMapping(value = "/welcome")
	public String welcome(ModelMap model) {
		model.addAttribute("employee", new Employee());
		if (loggedInUserName == null) {
			logger.error("User Not authorized In Valid Login");
			return "login";
		}
		return "welcome";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		if (loggedInUserName == null) {
			logger.error("User Not authorized In Valid Login");
			return "/login";
		}
		model.addAttribute("employee", new Employee());
		return "employeeInfo";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		logger.error("User Not authorized In Valid Login");
		return "/login";

	}

	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";

	}

	@RequestMapping(value = "save")
	public String saveEmployee(
			@ModelAttribute("employee") @Valid Employee employee,
			BindingResult bindingResult, Model model) {

		if (loggedInUserName == null) {
			logger.error("User Not authorized In Valid Login");
			return "/login";
		}

		try {
			if (employee.getId() != 0) {
				dataService.updateRow(employee);
			} else {
				dataService.insertRow(employee);
			}
		} catch (Exception e) {
			logger.error("Error occured while Adding the customer");
			return "/error";
		}

		return new String("redirect:getList");
	}

	@RequestMapping(value = "getList", method = RequestMethod.GET)
	public String getList(ModelMap model) {

		if (loggedInUserName == null) {
			logger.error("User Not authorized In Valid Login");
			return "/login";
		}
		Set<EmployeeDTO> employeeList = dataService.getList();
		model.addAttribute("employeeList", employeeList);
		return "list";
	}

	@RequestMapping("listUser")
	public ModelAndView listUser(@ModelAttribute Employee employee) {
		if (loggedInUserName == null) {
			logger.error("User Not authorized In Valid Login");
			return new ModelAndView("redirect:login");
		}
		return new ModelAndView("redirect:list");
	}

	@RequestMapping(value = "list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String springPaginationDataTables() throws IOException {
		Set<EmployeeDTO> employeeDTOListList = dataService.getList();
		EmployeeJsonObject employeeJsonObject = new EmployeeJsonObject();
		employeeJsonObject.setiTotalDisplayRecords(employeeDTOListList.size());
		employeeJsonObject.setiTotalRecords(employeeDTOListList.size());
		employeeJsonObject.setAaData(employeeDTOListList);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json2 = gson.toJson(employeeJsonObject);
		return json2;
	}

	@RequestMapping("edit")
	public ModelAndView editUser(@RequestParam int id,
			@ModelAttribute Employee employee) {
		if (loggedInUserName == null) {
			logger.error("User Not authorized In Valid Login");
			return new ModelAndView("redirect:login");
		}
		Employee employeeObject = dataService.getRowById(id);
		return new ModelAndView("manageEmployeeInfo", "employee",
				employeeObject);
	}

	@RequestMapping("delete")
	public ModelAndView deleteUser(@RequestParam int id) {
		if (loggedInUserName == null) {
			logger.error("User Not authorized In Valid Login");
			return new ModelAndView("redirect:login");
		}
		dataService.deleteRow(id);
		return new ModelAndView("redirect:list");
	}

}
