package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/Revenue")
public class RevenueController {

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String chart() {

		return "monthly-statistic";
	}
}
