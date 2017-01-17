<%--
  Created by IntelliJ IDEA.
  User: vural
  Date: 16-Dec-16
  Time: 11:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Library</title>
    <link href="webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <%@ include file="templates/header.jsp" %>

    <form:form action="/signup" commandName="userForm" method="post" id="userform">
    <div class="col-md-4 col-md-offset-4" style="margin-top: 100px; margin-bottom: 150px">
        <%--<form action="/register" method="post">--%>
            <div class="panel panel-default">

                <div class="panel-heading"> <strong class=""><spring:message code="label.signUp"/></strong> </div>

                <div class="panel-body" style="margin-bottom: 5px">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Email</label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <%--<input type="text" id="mail" name="mail" class="form-control" placeholder="Mail" />--%>
                            <form:input path="mail"  type="text" id="mail" name="mail" class="form-control" placeholder="Mail"/>
                            <form:errors path="mail" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 5px">
                        <spring:message code="label.firstname" var="firstname"/>
                        <label class="col-sm-3 control-label"><c:out value="${firstname}"/></label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <form:input path="firstname" type="text" id="firstname" name="firstname" class="form-control" placeholder="${firstname}" />
                            <form:errors path="firstname" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 5px">
                        <spring:message code="label.lastname" var="lastname"/>
                        <label class="col-sm-3 control-label"><c:out value="${lastname}"/></label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <form:input path="lastname" type="text" id="lastname" name="lastname" class="form-control" placeholder="${lastname}" />
                            <form:errors path="lastname" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <spring:message code="label.password" var="password"/>
                        <label class="col-sm-3 control-label"><c:out value="${password}"/></label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <form:password path="password" id="password" name="password" class="form-control" placeholder="${password}" />
                            <form:errors path="password" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <spring:message code="label.confirmPassword" var="confirmPassword"/>
                        <label class="col-sm-3 control-label"><c:out value="${confirmPassword}"/></label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <input type="password" id="passwordConfirm" name="passwordConfirm" class="form-control" placeholder="${confirmPassword}" onkeyup="checkPass();"/>
                            <span id="confirmMessage" class="confirmMessage"></span>
                        </div>
                    </div>

                    <div class="form-group last" style="margin-top: 15px;">
                        <div class="col-sm-offset-3 col-sm-9" style="margin-top: 15px;">
                            <button type="reset" class="btn btn-default btn-sm" ><spring:message code="label.reset"/></button>
                            <button type="submit" name="button" id="button" class="btn btn-success btn-sm"><spring:message code="label.signUp"/></button>
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                    <span style="text-align: center; color: red">${error}</span>
                </div>

            </div>
        <%--</form>--%>
    </div>
    </form:form>


    <%@ include file="templates/footer.jsp" %>
</div>
<script src="webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="webjars/custom_js/validation.js"></script>
</body>
</html>
