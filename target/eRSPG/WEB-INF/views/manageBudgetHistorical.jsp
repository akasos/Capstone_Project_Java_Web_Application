<%--
  Created by IntelliJ IDEA.
  User: lawrencemagana
  Date: 3/4/2018
  Time: 10:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/manageBudgetHistorical.css"/>"/>
   <%-- <script type="text/javascript" src="<s:url value="/js/jquery-2.1.4.min.js"/>"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="<s:url value="/js/bootstrap.min.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/js/manageBudgetHistorical.js"/>"></script>



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

    <div class="container-fluid" id="proposals-btn" style="margin-bottom: 15px;">
        <div class="col-lg-12 col-sm-12" style="text-align: left; padding:0px;">
            <button type="button" class="btn my-btn" style="width: auto; color: #FFFFFF" onclick="window.location.href = '/eRSPG/chair/manageBudgetDefinition'">Return</button>
        </div>
    </div>


        <h1 style="text-align:center;">Budget for <span id = "header-semester">Fall</span> <span id ="header-year">
            <script language="JavaScript" type="text/javascript">
                now = new Date
                theYear = now.getYear()
                if (theYear < 1900)
                    theYear = theYear + 1900
                document.write(theYear)
            </script>
        </span>
        </h1>


    <div id="window" style="/*border: 1px solid green*/">
        <div id="box1" style="/*border: 1px solid red*/">

            <div class="row">
                <div class="col-sm-6" style="/*border: 1px solid purple;*/ text-align: right">
                    <div class="dropdown" style="/*border: 1px solid blue*/">
                        <button class="btn btn-primary btn-year-semester-submit" id="year">Year &nbsp;
                            <span class="caret"></span></button>
                            <ul class="dropdown-menu semester-year">
                <%--<form:form method="get" action="/eRSPG/chair/manageBudget" modelAttribute="ManageBudgetForm">--%>
                                <c:forEach items="${budgetYears}" var="year" varStatus="status">
                                    <li class="year-btn" onclick="changeYear(this.innerHTML)">${year}</li>
                                </c:forEach>
                            </ul>
                    </div>

                </div>

                <div class="col-sm-6" style="/*border: 1px solid purple;*/ text-align: left;">
                    <div class="dropdown" style="/*border: 1px solid blue*/">
                        <button class="btn btn-primary btn-year-semester-submit" id="semester">Semester &nbsp;
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu semester-menu" id="semester-menu">
                        </ul>
                    </div>

                </div>


            </div>



        </div>
    </div>

    <hr/>

    <div class="form-group col-lg-12">

        <table align="center" class="table-hover table" style="max-width: 800px;" id="myTable">
            <thead>
            <tr style="background-color: #DCDCDC">
                <th>Fund</th>
                <th>Available</th>
                <th>Requested</th>
                <th>Difference</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${BudgetItems}" var="budget" varStatus="status">
                <tr>
                    <td id="${status.index}">${budget.fundCategoryName}</td>
                    <td id="${status.index + 10}">${budget.fundAmount}</td>
                    <td id="${status.index + 20}">${budget.requestedAmount}</td>
                    <td id="${status.index + 30}"></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>


    <div class="footer navbar-fixed-bottom">
        <div class="main">
            <div class="form-group" id="manageBudgetFooterContent">
                    <label class="col-sm-4 control-label form-inline" style="margin-bottom: 21px;">Total Budget:
                        <label id="totalBudget"></label>
                    </label>

            </div>
        </div>
    </div>




</div>
</body>
</html>

