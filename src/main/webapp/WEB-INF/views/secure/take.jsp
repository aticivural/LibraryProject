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

    <form method="post" action="/secure/takeoperation">
        <div class="container" style="margin-top: 100px; margin-bottom: 100px">
            <div class="panel panel-default">
                <div class="panel-heading" style="text-align: center; font-weight: bold "><spring:message code="label.takeProduct"/></div>
                <div class="row" style="margin-top: 10px;">

                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="margin-bottom: 10px"><spring:message code="label.process"/></div>
                            <%--<div class="panel-body">--%>
                            <table class="table  table-bordered" style="margin-top: 5px;" >
                                <div class="form-group">
                                    <spring:message code="label.bookId" var="bookId"/>
                                    <label class="col-sm-3 control-label"><c:out value="${bookId}"/></label>
                                    <div class="col-sm-9" style="margin-bottom: 5px">
                                        <input type="text" id="bookId" name="bookId" class="form-control" placeholder="${bookId}" />
                                    </div>

                                </div>

                                <div class="form-group last" style="margin-top: 15px">
                                    <div class="col-md-12" style="margin-top: 15px; margin-bottom: 15px; text-align:center;" >
                                        <a href="/index" type="button"  class="btn btn-default btn-sm "><spring:message code="label.cancel"/></a>
                                        <%--<button type="submit" name="check" id="check" class="btn btn-success btn-sm">Check</button>--%>
                                        <span><spring:message code="label.confirm"/><input type="checkbox" id="approval" name="approval" value="1" ></span>
                                        <button type="submit" name="give" id="give" class="btn btn-success"><spring:message code="label.check_take"/></button>
                                    </div>
                                </div>
                            </table>
                            <%--</div>--%>
                            <c:if test="${message != null}">
                                <div style="font-weight: bold; color: red; text-align: center"><c:out value="${message}"/></div>
                            </c:if>
                        </div>
                    </div>

                    <c:if test="${not empty book}">
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="panel panel-default">
                                <div class="panel-heading"><spring:message code="label.book"/></div>
                                <div class="panel-body" style="padding: 1px">
                                    <c:choose>
                                        <%--<c:when test="${not empty book}">--%>
                                        <c:when test="${book != null}">
                                            <div class="col-sm-12" style=" margin-top: 15px; margin-top: 15px">
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
                                        </c:when>
                                        <c:when test="${book == null}">
                                            <spring:message code="label.record_not_found" var="record_not_found"/>
                                            <c:out value="${record_not_found}"/>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${not empty user}">
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="panel panel-default">
                                <div class="panel-heading"><spring:message code="label.user"/></div>
                                <div class="panel-body" style="padding: 1px;">
                                    <c:choose>
                                        <c:when test="${user != null}">
                                            <div class="col-sm-12" style="; margin-top: 15px; margin-bottom: 15px">
                                                <table class="table  table-bordered number" >
                                                    <tr>
                                                        <td><b><spring:message code="label.userId"/> : </b><c:out value="${user.userId}"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><b><spring:message code="label.firstname"/> : </b><c:out value="${user.firstname}"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><b><spring:message code="label.lastname"/> : </b><c:out value="${user.lastname}"/></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </c:when>
                                        <c:when test="${user == null}">
                                            <spring:message code="label.user_not_found" var="user_not_found"/>
                                            <c:out value="${user_not_found}"/>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>

    </form>

    <%@ include file="../templates/footer.jsp" %>
</div>
<script src="../webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="../webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>