package com.jeju.app.flights;


import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.reflect.CatchClauseSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeju.app.apis.ApiItemDTO;
import com.jeju.app.reservs.SearchDTO;
import com.jeju.app.search.Days;




@Controller
@RequestMapping(value = "flights/*")
public class FlightController {
	
	@Autowired
	private FlightService flightService;
	
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public void getList(HttpServletRequest request, Model model) throws Exception {
		
		Days days =  new Days();
		days.setSearchDay(request.getParameter("depPlandTime"));
		model.addAttribute("day", days);
		model.addAttribute("airportId", request.getParameter("depAirportId"));
		model.addAttribute("list", flightService.getList(request));

	}
	
//	@RequestMapping(value = "updateList", method = RequestMethod.POST)
//	@ResponseBody
//	public List<FlightDTO> updateList(HttpServletRequest request) throws Exception {
//
//		return flightService.getList(request);
//	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public void search() throws Exception {
		System.out.println("searchGET");
	}
	
	@RequestMapping(value = "search", method = RequestMethod.POST)
	public void search(SearchDTO searchDTO, HttpSession session) throws Exception {
		searchDTO.setArrAirportId("NAARKPC");
		session.setAttribute("search", searchDTO);
	}
	
}
