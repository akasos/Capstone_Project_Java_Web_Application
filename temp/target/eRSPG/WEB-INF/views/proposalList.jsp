<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="container">

	<h2>List of Proposals</h2>

	<table id="proposalTable" class="table">
		<tr>
			<th>Submitted By</th>
			<th>Project Title</th>
			<th>Project Director</th>
			<th>Department</th>
			<th>Award Type</th>
			<th>Status</th>
			<th>Submission Date</th>
			<th>Actions</th>
		</tr>
		<%--<c:forEach items="${proposals}" var="proposalId">--%>
			<%--<tr>--%>
				<%--<td> ${proposalId.userId} </td>--%>
				<%--<td> ${proposalId.proposalTitle} </td>--%>
				<%--<td> ${proposalId.projectDirector} </td>--%>
				<%--&lt;%&ndash;<td> ${proposalId.departmentName} </td>&ndash;%&gt;--%>
				<%--<td> department name </td>--%>
				<%--<td> unknown </td>--%>
				<%--<td> ${proposalId.proposalStatus} </td>--%>
				<%--<td> ${proposalId.proposalYear} </td>--%>
				<%--<td><button class="btn my-btn" onclick="window.location.href = '/eRSPG/reviewer/reviewProposal?1'">Review</button></td>--%>
			<%--</tr>--%>
		<%--</c:forEach>--%>
		<c:forEach items="${proposalList}" var="proposalId">
			<tr>
				<td> ${proposalId.userId} </td>
				<td> ${proposalId.proposalName} </td>
				<td> ${proposalId.projectDirector} </td>
				<td> ${proposalId.departmentName} </td>
				<td> Research Grant </td>
				<%--<td> ${proposalId.awardName} </td>--%>
				<td> ${proposalId.proposalStatus} </td>
				<td> ${proposalId.proposalSubmissionDate} </td>
				<td><button class="btn my-btn" onclick="window.location.href = '/eRSPG/reviewer/reviewProposal?id=${proposalId.proposalId}'">Review</button></td>
			</tr>
		</c:forEach>
	</table>

	<hr/>
</div>
