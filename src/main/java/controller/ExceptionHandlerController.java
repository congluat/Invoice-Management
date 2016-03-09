package controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;
import javassist.tools.web.BadHttpRequest;

/*
 * https://spring.io/blog/2013/11/01/exception-handling-in-spring-mvc
 * http://www.mkyong.com/spring-mvc/spring-mvc-log4j-integration-example/
 * http://stackoverflow.com/questions/29689742/how-to-globally-handle-404-exception-by-returning-a-customized-error-page-in-spr
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
		logger.error(e.getMessage() + e.getLocalizedMessage());
		mav.addObject("url", req.getRequestURL());
		mav.setViewName(DEFAULT_ERROR_VIEW);
		return mav;
	}

	@ExceptionHandler
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public ModelAndView handle404(HttpServletRequest req, NoHandlerFoundException ex) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", "404 Page not found");
		logger.error(ex.getMessage());
		mav.addObject("url", req.getRequestURL());
		mav.setViewName(DEFAULT_ERROR_VIEW);
		return mav;
	}

}
