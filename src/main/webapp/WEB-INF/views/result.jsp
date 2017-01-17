<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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
    <link href="webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>


<body>

<div class="container-fluid">
    <%@ include file="templates/header.jsp" %>

    <%--search bar--%>

    <form:form action="/index" commandName="searchForm" method="post" class="navbar-form" style="margin-top: 75px;">
        <div class="col-sm-7 input-group input-group-sm add-on" style="margin-left: 2%">
            <spring:message code="label.search" var="search"/>
            <form:input path="word" class="form-control" placeholder="${search}" type="text"/>
            <div class="input-group-btn">
                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
            </div>
        </div>
    </form:form>

    <%--content--%>
    <div class="col-sm-12" style="padding-bottom: 200px">

        <div class="col-sm-7 " style="margin-left: 1%; overflow-y: scroll; height: 425px; margin-top: 15px">
            <table class="table table-hover table-bordered" >
                <thead class="navbar-default">
                <tr>
                    <th style="width:15px">#</th>
                    <th><spring:message code="label.bookName"/></th>
                    <th><spring:message code="label.author"/></th>
                    <th><spring:message code="label.status"/></th>
                </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty books}">
                            <c:forEach var="book" items="${books}" varStatus="bookLoop">
                                <tr onclick="document.location='/getDetails?bookid=<c:out value="${book.bookId}"/>'" style="cursor:hand" >
                                    <th style="width:15px" class="number" scope="row">${bookLoop.index + 1}</th>
                                    <td class="number" style="overflow-wrap: break-word; max-width: 350px;"><c:out value="${book.name}"/></td>
                                    <td class="number col-sm-3" style="overflow-wrap: break-word;">
                                        <c:forEach var="author" items="${book.authors}">
                                            <c:out value="${author.firstname} ${author.lastname}"/>
                                        </c:forEach>
                                    </td>
                                    <td class="number col-sm-2" style="overflow-wrap: break-word;">
                                        <c:if test="${book.loanStatus == 0}">
                                            <spring:message code="label.available" var="available"/>
                                            <c:out value="${available}"/>
                                        </c:if>
                                        <c:if test="${book.loanStatus == 1}">
                                            <spring:message code="label.notAvailable" var="notAvailable"/>
                                            <c:out value="${notAvailable}"/>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:when test="${empty books}">
                            <tr>
                                <td colspan="4" style="align-content: center;color: darkred"><h3><spring:message code="label.record_not_found"/></h3></td>
                            </tr>
                        </c:when>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <%--details--%>
        <c:if test="${not empty book}">
            <div class="col-sm-4" style="height: 400px; margin-top: 15px; margin-top: 15px">
                <table class="table  table-bordered number" >
                    <tr>
                        <td><b><spring:message code="label.bookId"/> : </b>${book.bookId}</td>
                    </tr>
                    <tr>
                        <td><b><spring:message code="label.isbn"/> : </b>${book.ISBN}</td>
                    </tr>
                    <tr>
                        <td><b><spring:message code="label.name"/> : </b>${book.name}</td>
                    </tr>
                    <tr>
                        <td><b><spring:message code="label.author"/> : </b>  <c:forEach var="author" items="${book.authors}">
                                                <c:out value="${author.firstname} ${author.lastname}, "/>
                                            </c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <td><b><spring:message code="label.edition"/> : </b>${book.edition}</td>
                    </tr>
                    <tr>
                        <td><b><spring:message code="label.kind"/> : </b>${book.kind}</td>
                    </tr>
                    <tr>
                        <td><b><spring:message code="label.language"/> : </b>${book.language}</td>
                    </tr>
                    <tr>
                        <td><b><spring:message code="label.publisher"/> : </b>${book.publisher}</td>
                    </tr>
                    <tr>
                        <td><b><spring:message code="label.publishDate"/> : </b>${book.publishDate}</td>
                    </tr>
                    <tr>
                        <td><b><spring:message code="label.topicTitle"/> : </b>${book.topicTitle}</td>
                    </tr>
                    <tr>
                        <td><b><spring:message code="label.loanStatus"/> : </b>
                            <c:if test="${book.loanStatus == 0}">
                                <spring:message code="label.available" var="available"/>
                                <c:out value="${available}"/>
                            </c:if>
                            <c:if test="${book.loanStatus == 1}">
                                <spring:message code="label.notAvailable" var="notAvailable"/>
                                <c:out value="${notAvailable}"/>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td><b><spring:message code="label.department"/> : </b>${book.department}</td>
                    </tr>
                    <tr>
                        <td><b><spring:message code="label.storageLocation"/> : </b>${book.storageLocation}</td>
                    </tr>
                </table>
            </div>
        </c:if> <%--details end--%>
    </div> <%--content--%>

    <%@ include file="templates/footer.jsp" %>
</div>

<script src="webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
