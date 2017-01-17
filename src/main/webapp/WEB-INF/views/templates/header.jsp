<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/index">Library</a>
            </div>

            <div class="collapse navbar-collapse">

                <ul class="nav navbar-nav navbar-right">
                    <c:choose>
                        <%--guest--%>
                        <c:when test="${empty loggedInUser}">
                            <li class="button">
                                <a href="/login" class="btn-link" ><spring:message code="label.login"/></a>
                            </li>
                            <%--<li class="button">
                                <a href="/signup" class="btn-link" >Sign Up</a>
                            </li>--%>
                            <li class="button">
                                <a href="/signup" class="btn-link" ><spring:message code="label.signUp"/></a>
                            </li>
                        </c:when>
                        <%--admin--%>
                        <c:when test="${loggedInUser.status == 1}">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="label.product"/><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/secure/give"><spring:message code="label.product.give"/></a></li>
                                    <li><a href="/secure/take"><spring:message code="label.product.take"/></a></li>
                                    <%--<li><a href="/secure/save">Save</a></li>
                                    <li><a href="/secure/delete">Delete</a></li>--%>
                                </ul>
                            </li>
                            <li class="button">
                                <a href="/secure/userdetails" class="btn-link" >${fn:toUpperCase(loggedInUser.firstname)}</a>
                            </li>
                            <li class="button">
                                <a href="/logout" class="btn-link" ><spring:message code="label.logout"/></a>
                            </li>
                        </c:when>
                        <c:when test="${loggedInUser.status == 2}">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="label.product"/><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/secure/give"><spring:message code="label.product.give"/></a></li>
                                    <li><a href="/secure/take"><spring:message code="label.product.take"/></a></li>
                                    <li><a href="/secure/save"><spring:message code="label.product.save"/></a></li>
                                    <li><a href="/secure/delete"><spring:message code="label.product.delete"/></a></li>
                                    <li><a href="/secure/update"><spring:message code="label.product.update"/></a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="label.staff"/><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/secure/authorise"><spring:message code="label.authorise"/></a></li>
                                    <%--<li><a href="/secure/disempower">Disempower</a></li>--%>
                                </ul>
                            </li>
                            <li class="button">
                                <a href="/secure/userdetails" class="btn-link" >${fn:toUpperCase(loggedInUser.firstname)}</a>
                            </li>
                            <li class="button">
                                <a href="/logout" class="btn-link" ><spring:message code="label.logout"/></a>
                            </li>
                        </c:when>
                        <%--user--%>
                        <c:otherwise>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${fn:toUpperCase(loggedInUser.firstname)} <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/secure/userdetails"><spring:message code="label.myInformation"/></a></li>
                                    <li><a href="/secure/history"><spring:message code="label.history"/></a></li>
                                    <li><a href="/secure/loan"><spring:message code="label.loan"/></a></li>
                                </ul>
                            </li>
                            <li class="button">
                                <a href="/logout" class="btn-link" ><spring:message code="label.logout"/></a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>

</div>

<%--
<div class="row">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Brand</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">Link</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Link</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>--%>
