<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<% String pageName = "body"; %>
	<%@include file="/WEB-INF/views/breadcrumbs.jsp" %>
	
	<legend>
		<h2 style="text-align: center;">Body of Proposal</h2>
	</legend>

	<p>The abstract and Sections I-A through VI should not exceed 3
		single-spaced pages. Supporting documents or materials should be
		included as addenda. PROPOSALS SHOULD BE WRITTEN CLEARLY AND SIMPLY.</p>

	<form:form method="post" modelAttribute="bodyForm" action="body"
		class="labels-no-bold tall-textarea">
		<div class="form-group">
			<label for="summary" class="required-field"><strong>PROJECT
					SUMMARY (ABSTRACT):</strong></label>
			<form:textarea class="form-control" path="summary"
				cssErrorClass="missing-error form-control" />
		</div>
		<div class="form-group">
			<label for="background" class="required-field"><strong>I-A.
					BACKGROUND AND OBJECTIVES OF RESEARCH/PROJECT.</strong> (Describe the nature
				and significance of the problem and provide a brief review of the
				relevant literature and expected outcomes. Include a bibliography as
				an appendix, if appropriate.)</label>
			<form:textarea class="form-control" path="background"
				cssErrorClass="missing-error form-control" />
		</div>

		<c:if test="${ excellence}">
			<div class="form-group">
				<label for="hemmingwayExcellence">I-B. If applying for a <em>Hemingway
						award for Faculty Excellence</em>, please describe what the impact of
					your project will be on the larger community. In short, what makes
					this project qualify for a Hemingway Award?
				</label>
				<form:textarea class="form-control" path="hemmingwayExcellence" />
			</div>
		</c:if>

		<c:if test="${ collaborative }">
			<div class="form-group">
				<label for="hemmingwayCollaboration">I-C. If applying for a
					<em>Hemingway Collaborative Award</em>, explain the collaborative
					nature of the project. What faculty and disciplines are involved?
				</label>
				<form:textarea class="form-control" path="hemmingwayCollaboration" />
			</div>
		</c:if>
		<div>
			<input type="hidden" name="nextPage" id="nextPage" value="0" />
			
			<div class="button-row">
				<button type="submit" class="btn my-btn pull-left" onclick='setNextPage("proposal/budget", "<s:url value="/" />")'>Previous</button>
				<button type="submit" class="btn my-btn" onclick='setNextPage("proposal/body", "<s:url value="/" />")'>Save</button>
	           	<button type="submit" class="btn my-btn pull-right" onclick='setNextPage("proposal/bodyDetails", "<s:url value="/" />")'>Next</button>
	        </div>
		</div>
	</form:form>
</div>