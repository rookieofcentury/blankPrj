package com.blank.app.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Servlet Filter implementation class EncodingFilter
 */
public class EncodingFilter implements Filter {
	
	private String encoding = "";
	private String forceEncoding = "false";

    /**
     * Default constructor. 
     */
    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if (null != encoding && !"".equals(encoding)) {
			System.out.println("Apply Request Encoding");
			request.setCharacterEncoding(encoding);
		}

		// pass the request along the filter chain
		chain.doFilter(request, response);
		if (null != encoding && "true".equalsIgnoreCase(forceEncoding)) {
			System.out.println("Apply Response Encoding");
			response.setCharacterEncoding(encoding);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		encoding = fConfig.getInitParameter("encoding") == null ? "" : fConfig.getInitParameter("encoding");
		forceEncoding = fConfig.getInitParameter("forceEncoding") == null ? "false" : fConfig.getInitParameter("forceEncoding");
	}

}
