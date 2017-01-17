<%--
  Created by IntelliJ IDEA.
  User: vural
  Date: 18-Dec-16
  Time: 11:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Details</title>
</head>
<body>
<div class="col-sm-4" style="margin-top: 100px; margin-bottom: 150px">
    <div class="panel panel-default">

        <div class="panel-heading"> <strong class="">Product Details</strong> </div>

        <div class="panel-body" style="margin-bottom: 5px">

            <%--details--%>
            <c:choose>
                <c:when test="${not empty book}">
                    <div class="col-sm-4" style="height: 400px; margin-top: 15px; margin-top: 15px">
                        <table class="table  table-bordered number" >
                            <tr>
                                <td><b>ISBN : </b>${book.ISBN}</td>
                            </tr>
                            <tr>
                                <td><b>Name : </b>${book.name}</td>
                            </tr>
                            <tr>
                                <td><b>Author(s) : </b>  <c:forEach var="author" items="${book.authors}">
                                    <c:out value="${author.firstname} ${author.lastname}, "/>
                                </c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <td><b>Edition : </b>${book.edition}</td>
                            </tr>
                            <tr>
                                <td><b>Kind : </b>${book.kind}</td>
                            </tr>
                            <tr>
                                <td><b>Language : </b>${book.language}</td>
                            </tr>
                            <tr>
                                <td><b>Publisher : </b>${book.publisher}</td>
                            </tr>
                            <tr>
                                <td><b>Publish Date : </b>${book.publishDate}</td>
                            </tr>
                            <tr>
                                <td><b>Topic Title : </b>${book.topicTitle}</td>
                            </tr>
                            <tr>
                                <td><b>Loan Status : </b>
                                    <c:if test="${book.loanStatus == 0}">
                                        <c:out value="Available"/>
                                    </c:if>
                                    <c:if test="${book.loanStatus == 1}">
                                        <c:out value=" Not Available"/>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td><b>Department : </b>${book.department}</td>
                            </tr>
                            <tr>
                                <td><b>Storage Location : </b>${book.storageLocation}</td>
                            </tr>
                        </table>
                    </div>
                </c:when>
                <c:when test="${book == null}">
                    <c:out value="book not found"/>
                </c:when>
            </c:choose>


        </div>

        <div class="panel-footer"/>

    </div>
</div>
<script src="../webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="../webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="../webjars/custom_js/validation.js"></script>
</body>
</html>
