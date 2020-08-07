
package com.globant.dasboard.rest;

import static com.jayway.restassured.RestAssured.expect;
import static com.jayway.restassured.RestAssured.given;

import org.junit.BeforeClass;
import org.junit.Test;
import com.jayway.restassured.RestAssured;
import com.jayway.restassured.response.Response;

/**
 * 
 * @author jose.muguerza
 */
public class DashboardRestControllerIT
{

    @BeforeClass
    public static void setup()
    {
        RestAssured.baseURI = Context.EMBEDDED_SERVER;
        RestAssured.port = Context.EMBEDDED_PORT;
        RestAssured.basePath = Context.WEB_CONTEXT;
        RestAssured.authentication = Context.AUTHENTICATION;
        RestAssured.requestContentType(Context.HEADER_ACCEPT);
        RestAssured.responseContentType(Context.HEADER_CONTENT_TYPE);
    }

    @Test
    public void testCreateDashboard()
    {
        given().body(
                "{\"id\":null,\"name\":\"TestDashboard\",\"description\":\"any description\",\"widgets\":[],\"filters\":[]}}");
        expect().statusCode(201).when().post("/rest/dashboard");
    }

    @Test
    public void testGetDashboardsByOwner()
    {

        Response response = given().header("Cookie", "JSESSIONID=mj1rujbp1zia136wm0ndfq5ye").get("/rest/dahsboard/");
        String body = response.getBody().asString();
        System.out.print("TYPE: " + response.contentType());
        System.out.print(body);
    }

}
