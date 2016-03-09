package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import org.springframework.core.annotation.AnnotationUtils;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

/*
 * https://spring.io/blog/2013/11/01/exception-handling-in-spring-mvc
 * http://www.mkyong.com/spring-mvc/spring-mvc-log4j-integration-example/
 */

@ControllerAdvice
class ExceptionHandlerController {
	public static final String DEFAULT_ERROR_VIEW = "error/custom-error";

	private static final Logger logger = Logger.getLogger(ExceptionHandlerController.class);

	@ExceptionHandler(value = Exception.class)
	public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {

		if (AnnotationUtils.findAnnotation(e.getClass(), ResponseStatus.class) != null)
			throw e;

		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", e.getMessage());
		logger.error(e.getMessage());
		mav.addObject("url", req.getRequestURL());
		mav.setViewName(DEFAULT_ERROR_VIEW);
		return mav;
	}
}
