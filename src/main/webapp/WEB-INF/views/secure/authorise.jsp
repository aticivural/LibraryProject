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

    <form method="post" action="/secure/authoriseoperation" id="giveFrom" name="giveForm">
        <div class="container" style="margin-top: 100px; margin-bottom: 100px">
            <div class="panel panel-default">
                <div class="panel-heading" style="text-align: center; font-weight: bold "><spring:message code="label.authorise"/></div>
                <div class="row" style="margin-top: 10px;">

                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="margin-bottom: 10px"><spring:message code="label.process"/></div>
                            <%--<div class="panel-body">--%>
                            <table class="table  table-bordered" style="margin-top: 5px;" >

                                <div class="form-group" style="margin-bottom: 5px">
                                    <label class="col-sm-3 control-label">Mail</label>
                                    <div class="col-sm-9" style="margin-bottom: 5px">
                                        <input type="text" id="mail" name="mail" class="form-control" placeholder="Mail" />
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><spring:message code="label.accessLevel" var="accessLevel"/>${accessLevel}</label>
                                    <div class="col-sm-9" style="margin-bottom: 5px">
                                        <input type="number" id="accesslevel" name="accesslevel" class="form-control" placeholder="${accessLevel}" maxlength="1" />
                                    </div>

                                </div>

                                <div class="form-group last" style="margin-top: 15px">
                                    <div class="col-md-12" style="margin-top: 15px; margin-bottom: 15px; text-align:center;" >
                                        <a href="/index" type="button"  class="btn btn-default btn-sm "><spring:message code="label.cancel"/></a>
                                        <span><spring:message code="label.confirm"/> <input type="checkbox" id="approval" name="approval" value="1" ></span>
                                        <button type="submit" name="give" id="give" class="btn btn-success"><spring:message code="label.checkAndConfirm"/></button>
                                    </div>
                                </div>
                            </table>
                            <%--</div>--%>
                            <c:if test="${message != null}">
                                <div style="font-weight: bold; color: red; text-align: center"><c:out value="${message}"/></div>
                            </c:if>
                        </div>
                    </div>


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

                                                    <tr>
                                                        <td><b><spring:message code="label.accessLevel"/> : </b><c:out value="${user.status}"/></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </c:when>
                                        <c:when test="${user == null}">
                                            <c:out value="user not found"/>
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