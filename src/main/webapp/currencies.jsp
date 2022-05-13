<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*, com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" %>

<jsp:useBean id="currencies" class="com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" scope="request"/>

<html>
    <head>
        <title>Currencies</title>
    </head>
    <body>
         <H1>Currencies</H1>
         <c:set var="list" scope="session" value="${currencies.getCurrencies()}" />
         <ul>
                 <c:forEach items="${list}" var="curs" >
                   <p><c:out value="${curs}"/></p>
                 </c:forEach>
         </ul>
    </body>
</html>
