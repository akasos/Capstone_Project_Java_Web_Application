<%--
  Created by IntelliJ IDEA.
  User: Andrew
  Date: 11/15/2017
  Time: 8:12 PM
  To change this template use File | Settings | File Templates.
  style="border:1px solid red"
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/bootstrap.min.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/bootstrap-theme.min.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/form-styles.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/breadcrumb.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/navbar.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/button-design.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/sidenavbar.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/table.css"/>"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/chairman.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/css/chairmanProposalHome.css"/>"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <script type="text/javascript" src="<s:url value="/js/moment.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/js/navigation.js"/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>eRSPG</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="wrapper">

    <nav id="sidebar" class="sidebar">
        <!-- Sidebar Header -->
        <div class="sidebar-header">
            <h3>Chair Dashboard</h3>
        </div>

        <!-- Sidebar Links -->
        <ul class="list-unstyled components">
            <li><a class="btn my-btn" type="button" onclick="window.location.href = '/eRSPG/chair/home'"
                   value="Chair Home">Home</a></li>
            <li><a class="btn my-btn" type="button" onclick="window.location.href= '/eRSPG/chair/committee'"
                   value="Manage Committee">Manage Committee</a></li>
            <li><a class="btn my-btn" type="button"
                   onclick="window.location.href = '/eRSPG/chair/manageBudgetDefinition'" value="Manage Budget">Manage
                Budget</a></li>
            <li class="active"><a class="btn my-btn" type="button"
                                  onclick="window.location.href= '/eRSPG/chair/proposal'" value="Chair Proposals">Proposals</a>
            </li>
            <li><a class="btn my-btn" type="button" onclick="window.location.href = '/eRSPG/chair/makeAnnouncement'"
                   value="Announcement">Make Announcement</a></li>
        </ul>
    </nav>


    <!-- Page Content -->
    <div id="content" class="main">

        <legend>
            <h1>Manage Proposals</h1>
        </legend>


        <div class="container-fluid" id="proposals-btn" style="margin-bottom: 15px;">
            <div class="col-lg-12 col-sm-12" style="text-align: left; padding:0px;">
                <button type="button" class="btn my-btn" style="color: #FFFFFF;" data-toggle="modal"
                        data-target="#myModal">Assign Proposals</button>
            </div>
        </div>

        <form:form method="POST" modelAttribute="manageProposalForm" action="/eRSPG/chair/assignproposal" id="proposal_form">

        <div id="window">
            <div id="box1">
                <table align="center" class="table-hover table" id="table-1">
                    <thead>
                    <tr style="background-color: #DCDCDC">
                        <th><input type="checkbox" id="select-all-proposals" name="SelectAllCheckBox"/></th>
                        <th onclick="sortTable(1)">Title</th>
                        <th onclick="sortTable(2)">Submitter</th>
                        <th onclick="sortTable(3)">Department</th>
                        <th onclick="sortTable(4)">College</th>
                        <th onclick="sortTable(5)">Submission Date</th>
                        <th onclick="sortTable(6)">Status</th>
                    </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${manageProposalForm.proposalDTO}" var="proposal" varStatus="status">
                            <tr>
                                <td><form:checkbox path="proposalDTO[${status.index}].checked" title="proposal"/></td>
                                <td>${proposal.proposalName}</td>
                                <form:hidden path="proposalDTO[${status.index}].proposalName"/>
                                <td>${proposal.projectDirector}</td>
                                <form:hidden path="proposalDTO[${status.index}].projectDirector"/>
                                <td>${proposal.departmentName}</td>
                                <form:hidden path="proposalDTO[${status.index}].departmentName"/>
                                <td>${proposal.college}</td>
                                <form:hidden path="proposalDTO[${status.index}].college"/>
                                <td>${proposal.proposalSubmissionDate}</td>
                                <form:hidden path="proposalDTO[${status.index}].proposalSubmissionDate"/>
                                <td>${proposal.proposalStatus}</td>
                                <form:hidden path="proposalDTO[${status.index}].proposalStatus"/>

                                <form:hidden path="proposalDTO[${status.index}].proposalId"/>
                                <form:hidden path="proposalDTO[${status.index}].proposalYear"/>
                                <form:hidden path="proposalDTO[${status.index}].userId"/>

                            </tr>

                        </c:forEach>


                    </tbody>
                </table>

            </div>
        </div>

    </div>


    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog" style="min-width: 100%; max-width: 100%;">

            <!-- Modal content-->
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Assign To...</h4>
                </div>

                <div class="modal-body">
                    <div id="review-table" style="width: 100%;">
                        <table align="center" class="table-hover table" id="table-2">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="select-all-committee-members" name=""/></th>
                                <th onclick="sortTable1(1)">First Name</th>
                                <th onclick="sortTable1(2)">Last Name</th>
                                <th onclick="sortTable1(3)">Email</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${manageProposalForm.committeeDTO}" var="reviewer" varStatus="status">
                                <tr>
                                    <td><form:checkbox path="committeeDTO[${status.index}].checked" title="committee-member"/></td>
                                    <td>${reviewer.firstName}</td>
                                    <form:hidden path="committeeDTO[${status.index}].firstName"/>
                                    <td>${reviewer.lastName}</td>
                                    <form:hidden path="committeeDTO[${status.index}].lastName"/>
                                    <td>${reviewer.email}</td>
                                    <form:hidden path="committeeDTO[${status.index}].email"/>

                                    <form:hidden path="committeeDTO[${status.index}].userRoleId"/>
                                    <form:hidden path="committeeDTO[${status.index}].userId"/>
                                </tr>
                            </c:forEach>



                            </tbody>

                        </table>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-default" form="proposal_form">Assign</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>

            </div>

        </div>
    </div>

    </form:form>


    <jsp:include page="/WEB-INF/views/footer.jsp"/>
 <%--   <script src="<s:url value="/js/assignProposalList.js"/>"></script>
    <script src="<s:url value="/js/committeeList.js"/>"></script>--%>
    <script src="<s:url value="/js/chairmanProposalHome.js"/>"></script>

</body>
</html>



