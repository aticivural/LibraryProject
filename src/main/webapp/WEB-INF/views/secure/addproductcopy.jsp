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

    <form method="post" action="/secure/#" id="giveFrom" name="giveForm">
        <div class="container" style="margin-top: 100px; margin-bottom: 100px">
            <div class="panel panel-default">
                <div class="panel-heading" style="text-align: center; font-weight: bold ">Give Product</div>
                <div class="row" style="margin-top: 10px;">

                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="margin-bottom: 10px">Process</div>
                            <%--<div class="panel-body">--%>
                            <table class="table  table-bordered" style="margin-top: 5px;" >
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">ISBN</label>
                                    <div class="col-sm-9" style="margin-bottom: 5px">
                                        <input type="number" id="isbn" name="isbn" class="form-control" placeholder="ISBN"   />
                                    </div>

                                </div>

                                <%--<div class="form-group" style="margin-bottom: 5px">
                                    <label class="col-sm-3 control-label">Mail</label>
                                    <div class="col-sm-9" style="margin-bottom: 5px">
                                        <input type="text" id="mail" name="mail" class="form-control" placeholder="Mail" />
                                    </div>

                                </div>--%>

                                <div class="form-group last" style="margin-top: 15px">
                                    <div class="col-md-12" style="margin-top: 15px; margin-bottom: 15px; text-align:center;" >
                                        <a href="/index" type="button"  class="btn btn-default btn-sm ">Cancel</a>
                                        <%--<button type="submit" name="check" id="check" class="btn btn-success btn-sm">Check</button>--%>
                                        <span>Confirm <input type="checkbox" id="approval" name="approval" value="1" ></span>
                                        <button type="submit" name="give" id="give" class="btn btn-success">Check & Confirm</button>
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
                                <div class="panel-heading">Book</div>
                                <div class="panel-body" style="padding: 1px">
                                    <c:choose>
                                        <%--<c:when test="${not empty book}">--%>
                                        <c:when test="${book != null}">
                                            <div class="col-sm-12" style=" margin-top: 15px; margin-top: 15px">
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
                    </c:if>

                </div>
            </div>
        </div>

    </form>

    <%@ include file="../templates/footer.jsp" %>
</div>
<script src="../webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="../webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="../webjars/custom_js/validation.js"></script>
</body>
</html>