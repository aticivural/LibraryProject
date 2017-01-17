<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="row" style="padding-top: 100px">
    <div class="col-lg-6 col-lg-offset-3">
        <%--<p style="text-align: center; color: #34a853; font-size: 80px;">Library</p>--%>
        <p style="text-align: center; color: #4285f4; font-size: 80px;">Library</p>
    </div>
    <form:form action="/result" commandName="searchForm" method="post">
        <div class="col-md-6 col-md-offset-3 ">
            <form:input path="word" type="text" class="form-control input-lg" placeholder="Write the words you want to search..."/>
            <%--<div class="input-group input-group-lg ">
            </div>--%>
        </div>
        <div class="col-md-4 col-md-offset-4" style="padding-top: 10px">
            <%--<form:button  type="button" class="btn btn-default btn-block">Search</form:button>--%>
            <input type="submit" class="btn btn-default btn-block" value="Search">
        </div>
    </form:form>
</div>
