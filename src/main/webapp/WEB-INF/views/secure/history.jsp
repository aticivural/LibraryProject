<%--
  Created by IntelliJ IDEA.
  User: vural
  Date: 17-Dec-16
  Time: 12:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Library</title>
    <style>
        .number{
            font-size: 12px;
        }
    </style>
    <link href="../webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <%@ include file="../templates/header.jsp" %>

        <div class="container" style="margin-top: 100px; margin-bottom: 100px">
            <div class="panel panel-default">
                <div class="panel-heading" style="text-align: center; font-weight: bold "><spring:message code="label.history"/></div>
                    <div class="panel-body" style="margin-top: 10px;">
                        <table class="table table-hover table-bordered" >
                            <thead class="navbar-default">
                            <tr>
                                <th style="width:15px">#</th>
                                <th><spring:message code="label.bookId"/></th>
                                <th>ISBN</th>
                                <th><spring:message code="label.bookName"/></th>
                                <th><spring:message code="label.author"/></th>
                                <th><spring:message code="label.receivedDate"/></th>
                                <th><spring:message code="label.deliveryDate"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${not empty histories}">
                                    <c:forEach var="history" items="${histories}" varStatus="historyLoop">
                                        <tr>
                                            <th style="width:15px" class="number" scope="row">${historyLoop.index + 1}</th>

                                            <%--style="overflow-wrap: break-word; max-width: 350px;"--%>

                                            <td class="number col-sm-1"><c:out value="${history.bookId}"/></td>

                                            <td class="number col-sm-2"><c:out value="${history.isbn}"/></td>

                                            <td class="number col-sm-5" style="overflow-wrap: break-word;"><c:out value="${history.bookName}"/></td>

                                            <td class="number col-sm-2">
                                                <c:forEach var="author" items="${history.authors}">
                                                    <c:out value="${author.firstname} ${author.lastname}"/>
                                                </c:forEach>
                                            </td>

                                            <td class="number col-sm-1">
                                                <c:out value="${history.startingDate}"/>
                                            </td>

                                            <td class="number col-sm-1">
                                                <c:out value="${history.deliveryDate}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:when test="${empty histories}">
                                    <tr>
                                        <td colspan="4" style="align-content: center;color: red"><h3><spring:message code="label.record_not_found"/></h3></td>
                                    </tr>
                                </c:when>
                            </c:choose>
                            </tbody>
                        </table>

                </div>
            </div>
        </div>
        <%--</div>--%>

   <%@ include file="../templates/footer.jsp" %>
</div>
<script src="../webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="../webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>