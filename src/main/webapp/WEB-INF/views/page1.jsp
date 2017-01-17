<%--
  Created by IntelliJ IDEA.
  User: vural
  Date: 17-Dec-16
  Time: 1:56 PM
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
    <link href="webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <%@ include file="templates/header.jsp" %>

    <div class="container" style="margin-top: 100px; margin-bottom: 100px">
        <div class="panel panel-default">
            <div class="panel-heading" style="text-align: center; font-weight: bold ">Give the Product</div>
            <div class="row" style="margin-top: 10px;">

                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="margin-bottom: 10px">Process</div>
                        <div class="panel-body">
                            <table class="table  table-bordered" style="margin-top: 5px;" >
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">ISBN</label>
                                    <div class="col-sm-9" style="margin-bottom: 5px">
                                        <input type="text" id="isbn" name="isbn" class="form-control" placeholder="ISBN" />
                                    </div>

                                </div>

                                <div class="form-group" style="margin-bottom: 5px">
                                    <label class="col-sm-3 control-label">Mail</label>
                                    <div class="col-sm-9" style="margin-bottom: 5px">
                                        <input type="text" id="mail" name="mail" class="form-control" placeholder="Mail" />
                                    </div>

                                </div>

                                <div class="form-group last" style="margin-top: 15px">
                                    <div class="col-sm-12" style="margin-top: 15px; text-align:center;" >
                                        <a href="/index" type="button"  class="btn btn-default btn-sm ">Cancel</a>
                                        <button type="submit" name="button" id="button" class="btn btn-success btn-sm">Display</button>
                                    </div>
                                </div>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">Book</div>
                        <div class="panel-body">
                            <c:choose>
                                <c:when test="${not empty book}">
                                    <div class="col-sm-12" style="height: 400px; margin-top: 15px; margin-top: 15px">
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
                    </div>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">User</div>
                        <div class="panel-body">
                            <c:choose>
                                <c:when test="${not empty user}">
                                    <div class="col-sm-12" style="height: 400px; margin-top: 15px; margin-top: 15px">
                                        <table class="table  table-bordered number" >
                                            <tr>
                                                <td><b>User ID : </b><c:out value="${user.userId}"/></td>
                                            </tr>
                                            <tr>
                                                <td><b>Firstname : </b><c:out value="${user.firstname}"/></td>
                                            </tr>
                                            <tr>
                                                <td><b>Lastname : </b><c:out value="${user.lastname}"/></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <%--<div class="col-sm-12">
                                        <table class="table  table-bordered number" >
                                            <div class="col-sm-4 "></div>
                                            <div class="col-sm-4 "><c:out value="${user.firstname}"/></div>
                                            <div class="col-sm-4 "><c:out value="${user.lastname}"/></div>
                                        </table>
                                    </div>--%>
                                </c:when>
                                <c:when test="${user == null}">
                                    <c:out value="user not found"/>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <%@ include file="templates/footer.jsp" %>
</div>
<script src="webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
