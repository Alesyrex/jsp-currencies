<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*, com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" %>

<jsp:useBean id="currencies" class="com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" scope="request"/>

<html>
    <head>
        <title>Convert</title>
    </head>
    <body>
       <c:set var="from" value="${param.from}"/>
       <c:set var="to" value="${param.to}"/>
       <c:set var="amount" value="${param.amount}"/>
       <H1> Converting ${from} to ${to} </H1>
       <p> ${amount}  ${from} =
       ${currencies.convert(amount,from,to)}
       ${to}
        </p>
    </body>
</html>

