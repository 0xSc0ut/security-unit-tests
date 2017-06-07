<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.BufferedReader,java.io.FileReader,java.io.IOException,java.io.InputStreamReader"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Unsafe JAXBContext</title>
</head>
<body>

<h1>Unsafe JAXBContext Unmarshaller from File Example</h1>
<%
if (System.getProperty("java.version").startsWith("1.8"))
	out.println("<h2 style=\"color:red\">NOTE: THIS APP IS CURRENTLY RUNNING JAVA 1.8, WHICH NOW MAKES THIS SAFE BY DEFAULT</h2>");
%>
<h3>Enter an XML Collection file containing an entity:</h3>
<textarea rows="15" cols="150" name="payload" form="theform">
<% 

//Anti-Caching Controls
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate"); //HTTP 1.1 controls 
response.setHeader("Pragma","no-cache"); //HTTP 1.0 controls
response.setDateHeader ("Expires", 0); //Prevents caching on proxy servers 

//Anti-Clickjacking Controls
response.setHeader("X-Frame-Options", "DENY");

StringBuilder contentBuilder = new StringBuilder();
try {
	BufferedReader in = new BufferedReader(new InputStreamReader(getClass().getResourceAsStream("/xxetestbook1web.xml")));
	String str;
    while ((str = in.readLine()) != null) {
        contentBuilder.append(str);
        contentBuilder.append("\n");
    }
    in.close();
} catch (IOException e) {
	e.printStackTrace();
}
out.println(contentBuilder.toString());
%>
</textarea>
<br>
<form id="theform" action="jaxbunsafefile" method="get" autocomplete="off">
	<input type="submit" value="Submit">	
</form>


</body>
</html>