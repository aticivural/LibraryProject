<%--
  Created by IntelliJ IDEA.
  User: vural
  Date: 16-Dec-16
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Library</title>
    <link href="webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <%@ include file="templates/header.jsp" %>

    <div class="col-md-4 col-md-offset-4" style="margin-top: 100px">
        <form action="/login" method="post">
        <div class="panel panel-default">

            <div class="panel-heading"> <strong class=""><spring:message code="label.loginlabel"/> <span style="color: red;align-self: center"><c:out value="${loginError}"/></span></strong> </div>

            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9" style="margin-bottom: 5px">
                        <input type="text" id="mail" name="mail" class="form-control" placeholder="Mail" />
                    </div>
                </div>

                <div class="form-group">
                    <spring:message code="label.password" var="password"/>
                    <label class="col-sm-3 control-label"><c:out value="${password}"/></label>
                    <div class="col-sm-9">
                        <input type="password" id="password" name="password" class="form-control" placeholder="${password}" />
                    </div>
                </div>

                <div class="form-group last" style="margin-top: 15px;">
                    <div class="col-sm-offset-3 col-sm-9" style="margin-top: 15px;">
                        <button type="reset" class="btn btn-default btn-sm" ><spring:message code="label.reset"/></button>
                        <button type="submit" name="button" id="button" class="btn btn-success btn-sm"><spring:message code="label.loginlabel"/></button>
                    </div>
                </div>

            </div>

            <div class="panel-footer"><spring:message code="label.notRegistered"/> <a href="/signup" class=""><spring:message code="label.registerHere"/></a></div>

        </div>
        </form>
    </div>


    <%@ include file="templates/footer.jsp" %>
</div>
<script src="webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
