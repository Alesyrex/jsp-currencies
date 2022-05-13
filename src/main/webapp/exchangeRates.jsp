<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*, com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" %>

<jsp:useBean id="currencies" class="com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" scope="request"/>

<html>
    <head>
        <title>ExchangeRates</title>
    </head>
    <body>
    <H1> Exchange Rates for ${param.from} </H1>
        <c:set var="map" scope="session" value="${currencies.getExchangeRates(param.from)}" />
         <ul>
                 <c:forEach items="${map}" var="entry">
                    <p> 1 ${param.from} = ${entry.value} ${entry.key} </p>
                 </c:forEach>
         </ul>
    </body>
</html>
