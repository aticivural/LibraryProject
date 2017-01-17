<%--
  Created by IntelliJ IDEA.
  User: vural
  Date: 09-Dec-16
  Time: 2:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Library</title>
    <link href="webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <%@ include file="templates/header.jsp" %>

    <div class="row" style="padding-top: 50px; text-align: right;padding-right: 15px" >
        <a href="?language=en" class="btn-link" >EN</a>|<a href="?language=tr" class="btn-link" >TR</a>
    </div>
    <%--content--%>
    <div class="row" style="padding-top: 100px; padding-bottom: 100px">
        <div class="col-lg-6 col-lg-offset-3">
            <p style="text-align: center; color: #4285f4; font-size: 80px;">Library</p>
        </div>
        <form:form action="/index" commandName="searchForm" method="post">
            <div class="col-md-6 col-md-offset-3 ">
                <spring:message code="label.searchField" var="searchField"/>
                <form:input path="word" type="text" class="form-control input-lg" placeholder="${searchField}" />
            </div>
            <div class="col-md-4 col-md-offset-4" style="padding-top: 10px">
                <input type="submit" class="btn btn-default btn-block" value="<spring:message code="label.search"/>">
            </div>
        </form:form>
    </div>


    <%@ include file="templates/footer.jsp" %>
</div>

<script src="webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
