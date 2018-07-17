<%--
  Created by IntelliJ IDEA.
  User: glentaylor
  Date: 2/20/2018
  Time: 6:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" type="text/css" href="<s:url value="/css/bootstrap.min.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/bootstrap-theme.min.css"/>"/>


    <link rel="stylesheet" type="text/css" href="<s:url value="/css/form-styles.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/breadcrumb.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/navbar.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/button-design.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/chairman.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/sidenavbar.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/table.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/manageBudgetDefinition.css"/>"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<s:url value="/js/manageBudgetDefinition.js"/>"></script>
    <title>eRSPG</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<nav id="sidebar" class="sidebar">
    <!-- Sidebar Header -->
    <div class="sidebar-header">
        <h3>Chair Dashboard</h3>
    </div>

    <!-- Sidebar Links -->
    <ul class="list-unstyled components">
        <li><a class="btn my-btn" type="button" onclick="window.location.href = '/eRSPG/chair/home'" value="Chair Home">Home</a></li>
        <li><a class="btn my-btn" type="button" onclick="window.location.href= '/eRSPG/chair/committee'" value="Manage Committee">Manage Committee</a></li>
        <li class="active"><a class="btn my-btn" type="button" onclick="window.location.href = '/eRSPG/chair/manageBudgetDefinition'" value="Manage Budget">Manage Budget</a></li>
        <li><a class="btn my-btn" type="button" onclick="window.location.href= '/eRSPG/chair/proposal'" value="Chair Proposals">Proposals</a></li>
        <li><a class="btn my-btn" type="button" onclick="window.location.href = '/eRSPG/chair/makeAnnouncement'" value="Announcement">Make Announcement</a></li>
    </ul>
</nav>

<!-- Page Content -->
<div id="content" class="main">

    <div class="container-fluid" id="budget-btns"  style="margin-bottom: 15px;">
        <div class="col-lg-12 col-sm-12" style="text-align: left; padding:0px;">
            <button type="button" class="btn my-btn" style="color: #FFFFFF;" data-toggle="modal" data-target="#myModal">+ New Budget</button>
            <button type="button" class="btn my-btn" style="width: auto; color: #FFFFFF" onclick="window.location.href = '/eRSPG/chair/manageBudgetHistorical'">View Historical Budget</button>
        </div>
    </div>

        <h1 style="text-align:center;">Budget for
            <script language="JavaScript" type="text/javascript">
                now = new Date
                theYear = now.getYear()
                if (theYear < 1900)
                    theYear = theYear + 1900
                document.write(theYear)
            </script>
        </h1>


            <div class="form-group col-lg-12">

                    <table align="center" class="table-hover table" style="max-width: 800px;" id="myTable">
                        <thead>
                            <tr style="background-color: #DCDCDC;">
                                <th>Fund</th>
                                <th>Available</th>
                                <th>Requested</th>
                                <th>Difference</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                    <form:form method="POST" action="/eRSPG/chair/manageBudgetDefinition" modelAttribute="BudgetItems" id="budgetForm">
                            <c:forEach items="${BudgetItems.budgetItems}" var="budget" varStatus="status"> <%--var="budget"--%>
                                <tr>
                                    <td>${budget.fundCategoryName}</td>
                                    <form:hidden path="budgetItems[${status.index}].fundAmount" id ="${status.index}"/>
                                    <td><input id="${status.index + 10}" style="text-align: center;" value="${budget.fundAmount}" onkeyup='calculateUnallocatedFundsOnInputChanges(this.id)' onblur="formatNumberAfterFocusLost(this.id)"></td>
                                    <td id ="${status.index + 20}">${budget.requestedAmount}</td>
                                    <td id="${status.index + 30}">0</td>
                                    <td><label type="button" class="btn my-btn" style="font-size: 16px" onclick='resetRowValue(document.getElementById("${status.index + 10}").id)'><i class="glyphicon glyphicon-refresh"></i></label></td>
                                    <form:hidden path="budgetItems[${status.index}].budgetFundID"/>
                                    <form:hidden path="budgetItems[${status.index}].budgetYear"/>
                                    <form:hidden path="budgetItems[${status.index}].semester.semesterId"/>
                                    <form:hidden path="budgetItems[${status.index}].fundCategory.fundCategoryId"/>
                                    <form:hidden path="budgetItems[${status.index}].budgetID"/>
                                </tr>
                            </c:forEach>





                        </tbody>
                    </table>
            </div>
</div>


<div class="footer navbar-fixed-bottom">
    <div class="main" >
        <div class="form-group" id="manageBudgetFooterContent">
                <label class="col-sm-4 control-label form-inline">Total Budget:
                           <input readonly value="${totalBudget}" placeholder="Please input budget..." id ="totalBudget"/>
                </label>
                <label class="col-sm-5 control-label form-inline">Total Unallocated Funds:
                           <input readonly value="${remainingBudget}" placeholder="Remaining Budget" id = "totalUnallocatedFunds"/>
                </label>
            <div class="btn my-btn" type="button" onclick="resetAllRowValues()">Revert</div>

            <div class="btn my-btn" type="submit" id="submit-form">Save</div>
      <%--      <input type="submit">--%>
            </form:form>
        </div>
    </div>
</div>


<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog" style="max-width: 100%">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title">+ New Budget</h3>
            </div>
            <div class="modal-body" style="text-align: center; color: red;">
                <h2>&#9888; Warning</h2>
                <p>*Creating a new budget will cause all open proposals for the current budget to be declined/closed,
                    the current budget will be locked, and any unused funds will move over to the newly created budget.*</p>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default">Create Budget for Semester 2018</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>

        </div>

    </div>
</div>

</body>


</html>
