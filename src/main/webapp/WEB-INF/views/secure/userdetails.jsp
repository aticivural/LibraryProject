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
    <link href="../webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <%@ include file="../templates/header.jsp" %>

    <form method="post" action="/secure/updateInformation" onsubmit="return checkMail();">
        <div class="col-md-8 col-md-offset-2" style="margin-top: 100px; margin-bottom: 150px">
            <div class="panel panel-default">

                <div class="panel-heading"> <strong class=""><spring:message code="label.myInformation"/></strong> </div>

                <div style="text-align: center; vertical-align: middle"><span class="bg-info"><b><spring:message code="label.inform"/></b></span></div>

                <div class="panel-body" style="margin-bottom: 5px">
                    <%--mail--%>
                    <div class="form-group" style="margin-bottom: 5px">
                        <label class="col-md-2 control-label">Mail</label>
                        <div class="col-md-5" style="margin-bottom: 5px">
                            <c:out value="${loggedInUser.mail}"/>
                        </div>
                        <div class="col-md-5" style="margin-bottom: 5px">
                            <spring:message code="label.newMail" var="newMail"/>
                            <input type="text" id="mail" name="mail" class="form-control" placeholder="${newMail}" />
                            <span id="confirmMailMessage" class="confirmMessage"></span>
                        </div>
                    </div>
                    <%--firstname--%>
                    <div class="form-group" style="margin-bottom: 5px">
                        <label class="col-md-2 control-label"><spring:message code="label.firstname"/></label>
                        <div class="col-md-5" style="margin-bottom: 5px">
                            <c:out value="${loggedInUser.firstname}"/>
                        </div>
                        <div class="col-md-5" style="margin-bottom: 5px">
                            <spring:message code="label.newFirstname" var="newFirstname"/>
                            <input type="text" id="firstname" name="firstname" class="form-control" placeholder="${newFirstname}" />
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 5px">
                        <label class="col-md-2 control-label"><spring:message code="label.lastname"/></label>
                        <div class="col-md-5" style="margin-bottom: 5px">
                            <c:out value="${loggedInUser.lastname}"/>
                        </div>
                        <div class="col-md-5" style="margin-bottom: 5px">
                            <spring:message code="label.newLastname" var="newLastname"/>
                            <input type="text" id="lastname" name="lastname" class="form-control" placeholder="${newLastname}" />
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 5px">
                        <label class="col-md-2 control-label"><spring:message code="label.password"/></label>
                        <div class="col-md-5" style="margin-bottom: 5px">
                            <c:out value="${loggedInUser.password}"/>
                        </div>
                        <div class="col-md-5" style="margin-bottom: 5px">
                            <spring:message code="label.newPassword" var="newPassword"/>
                            <input type="password" id="password" name="password" class="form-control" placeholder="${newPassword}" />
                        </div>
                    </div>

                        <div class="form-group" style="margin-bottom: 5px">
                            <div class="col-md-5 col-md-offset-7" style="margin-bottom: 5px">
                                <spring:message code="label.confirmPassword" var="confirmPassword"/>
                                <input type="password" id="passwordConfirm" name="passwordConfirm" class="form-control" placeholder="${confirmPassword}" onkeyup="checkPass()" />
                                <span id="confirmMessage" class="confirmMessage"></span>
                            </div>
                        </div>



                        <div class="form-group last" style="margin-top: 15px;">
                            <div class="col-md-4 col-md-offset-4 text-center" style="margin-top: 15px; align-content: center">
                                <%--<button type="button" href="/index" class="btn btn-default btn-sm " >Cancel</button>--%>
                                <a href="/index" type="button"  class="btn btn-default btn-sm "><spring:message code="label.cancel"/></a>
                                <button type="submit" name="button" id="button" class="btn btn-success btn-sm"><spring:message code="label.update"/></button>
                            </div>
                        </div>

                </div>

                <div class="panel-footer"/>

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