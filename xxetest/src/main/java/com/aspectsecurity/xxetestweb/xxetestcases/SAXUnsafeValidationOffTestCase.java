package com.aspectsecurity.xxetestweb.xxetestcases;

import com.aspectsecurity.xxetest.SAXHandler;
import com.aspectsecurity.xxetestweb.XXETestCase;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.ByteArrayInputStream;
import java.io.IOException;

@WebServlet("/saxunsafevalidationoff")
public class SAXUnsafeValidationOffTestCase extends XXETestCase {

    /*
     * SAXParser: Unsafe when Disabling Validation Example
     * Proves that disabling validation for the SAXParserFactory leaves the SAXParser parsing entities
     */
    protected void doTest(HttpServletRequest request, HttpServletResponse response) throws IOException {

        final boolean expectedSafe = false;

        // parsing the XML
        try {
            SAXParserFactory saxParserFactory = SAXParserFactory.newInstance();
            saxParserFactory.setValidating(false);	// not safe!
            SAXParser saxParser = saxParserFactory.newSAXParser();
            SAXHandler handler = new SAXHandler();

            saxParser.parse (new ByteArrayInputStream(request.getParameter("payload").getBytes()), handler);

            // testing the result
            printResults(expectedSafe, handler.getTestValue(), response);
        }
        catch (Exception ex) {
            printResults(expectedSafe, ex, response);	// safe: exception thrown when parsing XML
        }
    }
}
