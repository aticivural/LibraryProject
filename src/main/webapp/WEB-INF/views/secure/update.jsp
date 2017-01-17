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
<%@ page import="java.text.SimpleDateFormat" %>

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

    <form method="post" action="/secure/updateoperation">
        <div class="container" style="margin-top: 100px; margin-bottom: 100px">
            <div class="panel panel-default">
                <div class="panel-heading" style="text-align: center; font-weight: bold "><spring:message code="label.updateProduct"/></div>
                <div class="row" style="margin-top: 10px;">

                    <div class="col-lg-8 col-md-8 col-sm-8  col-lg-offset-2 col-md-offset-2 col-sm-offset-2" style="text-align: center">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="margin-bottom: 10px; font-weight: bold"><spring:message code="label.process"/></div>

                            <table class="table  table-bordered" style="margin-top: 5px;" >
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"><spring:message code="label.bookId" var="bookId"/>${bookId}</label>
                                    <div class="col-sm-5" style="margin-bottom: 5px">
                                        <input type="text" id="bookId" name="bookId" class="form-control" placeholder="${bookId}" />
                                    </div>
                                    <div class="col-sm-5" style="margin-bottom: 5px">
                                        <a href="/index" type="button"  class="btn btn-default btn-sm "><spring:message code="label.cancel"/></a>
                                        <span><spring:message code="label.confirm"/> <input type="checkbox" id="approval" name="approval" value="1" ></span>
                                        <button type="submit" name="give" id="give" class="btn btn-success"><spring:message code="label.checkAndUpdate"/></button>
                                    </div>

                                </div>

                            </table>

                            <c:if test="${message != null}">
                                <div style="font-weight: bold; color: red; text-align: center"><c:out value="${message}"/></div>
                            </c:if>
                        </div>
                    </div>

                    <c:if test="${not empty book}">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="panel panel-default">
                                <div class="panel-heading"><b><spring:message code="label.book"/></b></div>
                                <div class="panel-body" style="padding: 1px">
                                    <c:choose>
                                        <%--<c:when test="${not empty book}">--%>
                                        <c:when test="${book != null}">
                                            <div class="col-sm-12" style=" margin-top: 15px; margin-top: 15px">
                                                <table class="table  table-bordered number" >
                                                    <tr>
                                                        <td><b><spring:message code="label.bookId"/> : </b>${book.bookId}</td>
                                                        <td><b><spring:message code="label.newValues"/> : </b></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-sm-5"><b><spring:message code="label.isbn"/> : </b>${book.ISBN}</td>
                                                        <td class="col-sm-7">
                                                            <spring:message code="label.isbnPlaceholder" var="isbnPlaceholder"/>
                                                            <input type="number" id="newisbn" name="newisbn" class="form-control" placeholder="ISBN ${isbnPlaceholder}" />
                                                            <span id="confirmIsbnMessage" class="confirmMessage"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-sm-5"><b><spring:message code="label.name" var="name"/>${name} : </b>${book.name}</td>
                                                        <td class="col-sm-7">
                                                            <input type="text" id="newname" name="newname" class="form-control" placeholder="${name}" />
                                                            <span id="confirmNameMessage" class="confirmMessage"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-sm-5"><b><spring:message code="label.edition" var="edition"/>${edition} : </b>${book.edition}</td>
                                                        <td class="col-sm-7">
                                                            <input type="number" id="newedition" name="newedition" class="form-control" placeholder="${edition}" />
                                                            <span id="confirmEditionMessage" class="confirmEditionMessage"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-sm-5"><b><spring:message code="label.kind" var="kind"/>${kind} : </b>${book.kind}</td>
                                                        <td class="col-sm-7">
                                                            <input type="text" id="newkind" name="newkind" class="form-control" placeholder="${kind}" />
                                                            <span id="confirmKindMessage" class="confirmKindMessage"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-sm-5"><b><spring:message code="label.language" var="language"/>${language} : </b>${book.language}</td>
                                                        <td class="col-sm-7">
                                                            <input type="text" id="newlanguage" name="newlanguage" class="form-control" placeholder="${language}" />
                                                            <span id="confirmLanguageMessage" class="confirmLanguageMessage"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-sm-5"><b><spring:message code="label.publisher" var="publisher"/>${publisher} : </b>${book.publisher}</td>
                                                        <td class="col-sm-7">
                                                            <input type="text" id="newpublisher" name="newpublisher" class="form-control" placeholder="${publisher}" />
                                                            <span id="confirmPublisherMessage" class="confirmPublisherMessage"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-sm-5"><b><spring:message code="label.publishDate" var="publishDate"/>${publishDate} : </b>${book.publishDate}</td>
                                                        <td class="col-sm-7">
                                                            <input type="text" id="newpublishdate" name="newpublishdate" class="form-control" placeholder="${publishDate} (yyyy/MM/dd)" />
                                                            <span id="confirmPublishDateMessage" class="confirmPublishDateMessage"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-sm-5"><b><spring:message code="label.topicTitle" var="topicTitle"/>${topicTitle} : </b>${book.topicTitle}</td>
                                                        <td class="col-sm-7">
                                                            <input type="text" id="newtopictitle" name="newtopictitle" class="form-control" placeholder="${topicTitle}" />
                                                            <span id="confirmTopicTitleMessage" class="confirmTopicTitleMessage"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-sm-5"><b><spring:message code="label.department" var="department"/>${department} : </b>${book.department}</td>
                                                        <td class="col-sm-7">
                                                            <input type="text" id="newdepartment" name="newdepartment" class="form-control" placeholder="${department}" />
                                                            <span id="confirmDepartmentMessage" class="confirmDepartmentMessage"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-sm-5"><b><spring:message code="label.storageLocation" var="storageLocation"/>${storageLocation} : </b>${book.storageLocation}</td>
                                                        <td class="col-sm-7">
                                                            <input type="text" id="newstoragelocation" name="newstoragelocation" class="form-control" placeholder="${storageLocation}" />
                                                            <span id="confirmStorageLocationMessage" class="confirmStorageLocationMessage"></span>
                                                        </td>
                                                    </tr>

                                                    <c:forEach var="author" items="${book.authors}" varStatus="authorLoop">
                                                        <spring:message code="label.authorFirstname" var="authorFirstname"/>
                                                        <spring:message code="label.authorLastname" var="authorLastname"/>
                                                        <tr>
                                                            <tr>
                                                                <td class="col-sm-6"><b>${authorFirstname} : </b>${author.firstname}</td>
                                                                <td class="col-sm-6"><b>${authorLastname} : </b>${author.lastname}</td>
                                                            </tr>


                                                            <tr>
                                                                <td class="col-sm-6">
                                                                    <input type="text" id="newauthorfirstname${authorLoop.index}" name="newauthorfirstname${authorLoop.index}" class="form-control" placeholder="${authorFirstname}" />
                                                                    <span id="confirmAuthorFirstnameMessage" class="confirmAuthorFirstnameMessage"></span>
                                                                </td>

                                                                <td class="col-sm-6">
                                                                    <input type="text" id="newauthorlastname${authorLoop.index}" name="newauthorlastname${authorLoop.index}" class="form-control" placeholder="${authorLastname}" />
                                                                    <span id="confirmAuthorLastnameMessage" class="confirmAuthorLastnameMessage"></span>
                                                                </td>
                                                            </tr>

                                                        </tr>
                                                    </c:forEach>
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
</body>
</html>