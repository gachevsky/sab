package com.globant.dasboard.rest;

import static com.jayway.restassured.RestAssured.basic;
import groovyx.net.http.ContentType;

import com.jayway.restassured.authentication.AuthenticationScheme;


/**
 *
 * @author jose.muguerza
 */
public abstract class Context {
	
	public static final String EMBEDDED_SERVER = "http://localhost";
	public static final int EMBEDDED_PORT = 8090;
	public static final String WEB_CONTEXT = "/sab";
	public static final AuthenticationScheme AUTHENTICATION = basic("user@none.com", "1111");
	
	public static final ContentType HEADER_ACCEPT = ContentType.JSON;
	public static final ContentType HEADER_CONTENT_TYPE= ContentType.JSON;;
	

}
