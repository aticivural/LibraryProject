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

    <form:form action="/secure/saveoperation" commandName="bookForm" method="post" id="bookform">
        <div class="col-md-8 col-md-offset-2" style="margin-top: 100px; margin-bottom: 150px">
            <div class="panel panel-default">
                <div class="panel-heading"> <strong class=""><spring:message code="label.saveProduct"/></strong></div>

                <div class="panel-body" style="margin-bottom: 5px">

                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="label.isbn"/></label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <spring:message code="label.isbnPlaceholder" var="isbnPlaceholder"/>
                            <form:input path="ISBN"  type="text" id="isbn" name="isbn" class="form-control" placeholder="ISBN (${isbnPlaceholder})"/>
                            <form:errors path="ISBN" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 5px">
                        <label class="col-sm-3 control-label"><spring:message code="label.name" var="name"/>${name}</label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <form:input path="name" type="text" id="name" name="name" class="form-control" placeholder="${name}" />
                            <form:errors path="name" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 5px">
                        <label class="col-sm-3 control-label"><spring:message code="label.kind" var="kind"/>${kind}</label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <form:input path="kind" type="text" id="kind" name="kind" class="form-control" placeholder="${kind}" />
                            <form:errors path="kind" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="label.publisher" var="publisher"/>${publisher}</label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <form:input path="publisher" type="text" id="publisher" name="publisher" class="form-control" placeholder="${publisher}" />
                            <form:errors path="publisher" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="label.publishDate" var="publishDate"/>${publishDate}</label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <form:input path="publishDate" type="text" id="publishDate" name="publishDate" class="form-control" placeholder="${publishDate} (e.g. dd/MM/yyyy)"/>
                            <form:errors path="publishDate" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="label.edition" var="edition"/>${edition}</label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <form:input path="edition"  type="text" id="edition" name="edition" class="form-control" placeholder="${edition}"/>
                            <form:errors path="edition" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 5px">
                        <label class="col-sm-3 control-label"><spring:message code="label.storageLocation" var="storageLocation"/>${storageLocation}</label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <form:input path="storageLocation" type="text" id="storageLocation" name="storageLocation" class="form-control" placeholder="${storageLocation}" />
                            <form:errors path="storageLocation" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label"><spring:message code="label.language" var="language"/>${language}</label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <form:input path="language"  type="text" id="language" name="language" class="form-control" placeholder="${language}" />
                            <form:errors path="language" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 5px">
                        <label class="col-sm-3 control-label"><spring:message code="label.topicTitle" var="topicTitle"/>${topicTitle}</label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <form:input path="topicTitle" type="text" id="topicTitle" name="topicTitle" class="form-control" placeholder="${topicTitle}" />
                            <form:errors path="topicTitle" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 5px">
                        <label class="col-sm-3 control-label"><spring:message code="label.department" var="department"/>${department}</label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <form:input path="department" type="text" id="department" name="department" class="form-control" placeholder="${department}" />
                            <form:errors path="department" delimiter="," cssStyle="color: red"/>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 5px">
                        <label class="col-sm-3 control-label"><spring:message code="label.authors"/>1</label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <spring:message code="label.firstname" var="firstname"/>
                            <spring:message code="label.lastname" var="lastname"/>
                            <label class="col-sm-4" style="padding-left:1px;"><form:input path="authors[0].ISBN" type="text" id="aisbn" name="aisbn" class="form-control" placeholder="ISBN" /></label>
                            <label class="col-sm-4" style="padding: 1px"><form:input path="authors[0].firstname" type="text" id="afirstname" name="afirstname" class="form-control" placeholder="${firstname}" /></label>
                            <label class="col-sm-4" style="padding-right:1px"><form:input path="authors[0].lastname" type="text" id="alastname" name="alastname" class="form-control" placeholder="${lastname}" /></label>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 5px">
                        <label class="col-sm-3 control-label"><spring:message code="label.authors"/>2</label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <label class="col-sm-4" style="padding-left:1px;"><form:input path="authors[1].ISBN" type="text" id="aisbn1" name="aisbn1" class="form-control" placeholder="ISBN" /></label>
                            <label class="col-sm-4" style="padding: 1px"><form:input path="authors[1].firstname" type="text" id="afirstname1" name="afirstname1" class="form-control" placeholder="${firstname}" /></label>
                            <label class="col-sm-4" style="padding-right:1px"><form:input path="authors[1].lastname" type="text" id="alastname1" name="alastname1" class="form-control" placeholder="${lastname}" /></label>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 5px">
                        <label class="col-sm-3 control-label"><spring:message code="label.authors"/>3</label>
                        <div class="col-sm-9" style="margin-bottom: 5px">
                            <label class="col-sm-4" style="padding-left:1px;"><form:input path="authors[2].ISBN" type="text" id="aisbn2" name="aisbn2" class="form-control" placeholder="ISBN" /></label>
                            <label class="col-sm-4" style="padding: 1px"><form:input path="authors[2].firstname" type="text" id="afirstname2" name="afirstname2" class="form-control" placeholder="${firstname}" /></label>
                            <label class="col-sm-4" style="padding-right:1px"><form:input path="authors[2].lastname" type="text" id="alastname2" name="alastname2" class="form-control" placeholder="${lastname}" /></label>
                        </div>
                    </div>



                    <div class="form-group">
                        <div class="col-sm-12">
                            <div class="col-sm-4 col-sm-offset-4" style="margin-bottom: 5px">
                                <c:if test="${message != null}">
                                    <div style="font-weight: bold; font-size: large ; color: red;"><c:out value="${message}"/></div>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <div class="form-group last" style="margin-top: 15px;">
                        <div class="col-sm-12" style="margin-top: 15px; text-align: center">
                            <button type="reset" class="btn btn-default btn-sm" ><spring:message code="label.reset"/></button>
                            <button type="submit" name="button" id="button" class="btn btn-success"><spring:message code="label.save"/></button>
                        </div>
                    </div>


                </div>

                <div class="panel-footer"></div>

            </div>
        </div>
    </form:form>


    <%@ include file="../templates/footer.jsp" %>
</div>
<script src="../webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="../webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>