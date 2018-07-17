<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/bootstrap.min.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/bootstrap-theme.min.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/form-styles.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/breadcrumb.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/navbar.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/button-design.css"/>" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="<s:url value="/js/jquery-2.1.4.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/js/navigation.js"/>"></script>
	<title>eRSPG Proposal Submission</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">

	<table width="100%">
		<td><h2>Review Proposal</h2></td>
		<td style="text-align: right;">
			<a href="#score-header"><button class="btn my-btn">Score</button></a>
			<a href="#comment-header"><button class="btn my-btn">Comment</button></a>
		</td>
	</table>

	<form:form method="POST" modelAttribute="proposalReviewForm" action="" name="proposalReviewForm" varStatus="status" id="proposalForm">
	<table class="table">
		<tr>
			<td>
				<b>Proposal Title:</b>
			</td>
			<td colspan="1">${proposalReviewForm.proposalTitle}</td>
		</tr>
		<tr>
			<td>
				<b>Author:</b>
			</td>
			<td colspan="3">${proposalReviewForm.author}</td>
		</tr>
		<tr>
			<td>
				<b>Email Address:</b>
			</td>
			<td>${proposalReviewForm.emailAddress}</td>
		</tr>
		<tr>
			<td><b>Mail Code:</b></td>
			<td>${proposalReviewForm.mailCode}</td>
		</tr>
		<tr>
			<td><b>Extension:</b></td>
			<td>${proposalReviewForm.extension}</td>
		</tr>
		<tr><td></td><td></td></tr>
		<tr>
			<td><b>Award Type:</b></td>
			<td>${proposalReviewForm.awardType}</td>

		</tr>
		<tr>
			<td><b>Proposal Type:</b></td>
			<td>${proposalReviewForm.proposalType}</td>
		</tr>
		<tr><td></td><td></td></tr>
	</table>

	<h3>Budget</h3>

	<table class="table table-bordered table-condensed">
		<tbody>
		<tr>
			<th class="text-center" style="background-color: rgb(87,80,71); color:white">RSPG Request</th>
			<th class="text-center" style="background-color: rgb(87,80,71); color:white">Matching</th>
			<th class="text-center" style="background-color: rgb(87,80,71); color:white">Total</th>
			<th	class="text-center" style="background-color: rgb(87,80,71); color:white">% Matching</th>
		</tr>
		<tr>
			<td class="text-right">${proposalReviewForm.request}</td>
			<td class="text-right">${proposalReviewForm.matching}</td>
			<td class="text-right">${proposalReviewForm.total}</td>
			<td class="text-right">%${proposalReviewForm.matchingPercent}</td>
		</tr>
		</tbody>
	</table>

	<h3>Proposal Body</h3>

	<p><b>PROJECT SUMMARY (ABSTRACT):</b></p>
	<p>${proposalReviewForm.projectSummary}</p>

	<p><b>I-A. BACKGROUND AND OBJECTIVES OF RESEARCH/PROJECT.</b></p>
	<p>${proposalReviewForm.backgroundObjectives}</p>

	<p><b>II. PROCEDURES AND METHODS.</b></p>
	<p>${proposalReviewForm.proceduresMethods}</p>

	<p><b>III. TIME-LINE.</b></p>
	<p>${proposalReviewForm.timeline}</p>

	<p><b>IV. EVALUATION AND DISSEMINATION.</b></p>
	<p>${proposalReviewForm.evaluationDissemination}</p>

	<p><b>V. PROVIDE A BUDGET NARRATIVE</b></p>
	<p>${proposalReviewForm.budgetNarrative}</p>

	<p><b>VI. ANSWER THE FOLLOWING QUESTIONS:</b></p>

	<p><i>1. What RSPG funding have you applied for or have been awarded in the past 5 years? For awarded projects, please provide information regarding these projects including (1) the project title, (2) the status of the project, and (3) the outcome(s) of the project. Please indicate whether a final report has been submitted for each RSPG award. (It is recommended that a copy of the final report be included as an appendix.)</i></p>
	<p>${proposalReviewForm.questionOne}</p>

	<p><i>2. What other sources of funding have you sought for this project?</i><b></b></p>
	<p>${proposalReviewForm.questionTwo}</p>

	<p><i>3. Have you checked with the Office of Sponsored Projects to determine if this office is an appropriate place to seek additional funding? Please explain.</i></p>
	<p>${proposalReviewForm.questionThree}</p>

	<p><i>4. Is this the type of project your department or college would normally fund? Please explain?</i></p>
	<p>${proposalReviewForm.questionFour}</p>

	<p><i>5. Would completion of this project create opportunities for external funding (for example, is this proposal a request for a pilot study or seed money that may lead to a larger project)?</i></p>
	<p>${proposalReviewForm.questionFive}</p>

	<p><i>6. If you are applying for release time or a stipend, please list what your course load would be if you received the reassigned time. You MUST include any overload courses which you plan on teaching.</i></p>
	<p>${proposalReviewForm.questionSix}</p>

	<p><i>7. For instructional improvement proposals, are course fees an appropriate place to seek additional funding? Please explain.</i></p>
	<p>${proposalReviewForm.questionSeven}</p>


	<h3>Attachments</h3>
	<ul>
		<li><a>Attachment_1.pdf</a></li>
		<li><a>Attachment_2.xlsx</a></li>
	</ul>

	<hr />

	<h3 id="score-header">Score Proposal</h3>
	<table class="table">
		<tr>
			<th>Criteria</th>
			<th>Description</th>
			<th>Rating Suggestions</th>
			<th style="min-width: 70px">Score</th>
		</tr>
		<tr>
			<td>Budget/Project Efficiency/Support</td>
			<td>Is there broad support for the project (through matching funds or collaborations)?</td>
			<td>2 - The project has demonstrated
				support (through significant
				matching funds and/or letters of
				collaboration with other areas on
				campus or in the
				community)<br />
				1 - The project has general support
				from the college or department.<br />
				0 - The is no documentation of
				additional support for the project</td>
			<td><input class="score form-control" type="number" min="0" max="2" value="${proposalReviewForm.scoreList[0].scoreValue}" id ="1" /></td>
			<form:hidden path="scoreList[0].scoreId" id="2"/>
			<form:hidden path="scoreList[0].reviewerId" id = "3" />
			<form:hidden path="scoreList[0].scoreboxId" id = "4"/>


		</tr>
		<tr>
			<td>Summary &
				Background</td>
			<td>Does this project enhance the
				reputation of instructor's program
				and of Weber State University in
				general? Does the proposed
				project enhance the educational
				experience at Weber State
				University? How many
				students are impacted? Are
				multiple departments or
				programs involved?</td>
			<td>2 - Proposal documents a real
				need. Impacts a large number of
				students or several programs.
				Research/Presentation improves
				the university's prestige.<br/>
				1 - Impacts many students in
				one program<br/>
				0 - Impacts a small number of
				students
			</td>
			<td><input class="score form-control" type="number" min="0" max="2" value="${proposalReviewForm.scoreList[1].scoreValue}" id ="5" /></td>
			<form:hidden path="scoreList[1].scoreId" id="6"/>
			<form:hidden path="scoreList[1].reviewerId" id = "7" />
			<form:hidden path="scoreList[1].scoreboxId" id = "8"/>
		</tr>
		<tr>
			<td>Procedures,
				Methods,
				Timeline</td>
			<td>Are the proposed methods and
				strategies, realistic, effective and
				outcome oriented?</td>
			<td>2 - Methods, approaches, etc. are
				realistic, effective, and outcome
				oriented.<br/>
				1 - Some tangible strategies are
				noted.<br/>
				0 - Ability to implement project
				not addressed.</td>
			<td><input class="score form-control" type="number" min="0" max="2" value="${proposalReviewForm.scoreList[2].scoreValue}" id ="9" /></td>
			<form:hidden path="scoreList[2].scoreId" id="10"/>
			<form:hidden path="scoreList[2].reviewerId" id = "11" />
			<form:hidden path="scoreList[2].scoreboxId" id = "12"/>
		</tr>
		<tr>
			<td>Evaluation
				Dissemination</td>
			<td>How will the work be disseminated
				to other areas on campus or to
				other institutions? Are there
				publishable results or
				documentation?</td>
			<td>2 - The project has the potential to
				be widely disseminated beyond
				the University. If a conference, the
				conference has national
				importance.<br/>
				1 - The project success will be
				documented and shared within the
				University (e.g. Teaching and
				Learning Forum). If a conference,
				the conference has local
				importance.<br/>
				0 - The project will have no
				publishable or sharable results</td>
			<td><input class="score form-control" type="number" min="0" max="2" value="${proposalReviewForm.scoreList[3].scoreValue}" id ="13" /></td>
			<form:hidden path="scoreList[3].scoreId" id="14"/>
			<form:hidden path="scoreList[3].reviewerId" id = "15" />
			<form:hidden path="scoreList[3].scoreboxId" id = "16"/>
		</tr>
		<tr>
			<td>Supporting
				Documentation</td>
			<td>Are there supporting documents
				to strengthen the proposal?</td>
			<td>2 - Multiple items to support
				proposal (e.g., proof of acceptance
				to conference; memos from
				administrators, travel costs, etc.)<br/>
				1 - Some evidence to support
				proposal (e.g., email memo, etc.)<br/>
				0 - No supporting evidence.</td>
			<td><input class="score form-control" type="number" min="0" max="2" value="${proposalReviewForm.scoreList[4].scoreValue}" id ="17" /></td>
			<form:hidden path="scoreList[4].scoreId" id="18"/>
			<form:hidden path="scoreList[4].reviewerId" id = "19" />
			<form:hidden path="scoreList[4].scoreboxId" id = "20"/>


			<form:hidden path="userId" id = "21"/>
			<form:hidden path="proposalId" id = "22"/>

			<input id="numberOfComments" name="secretValue" type="hidden" value="${proposalReviewForm.comments.size()}"/>
			<input id ="userFirstName" type="hidden" value="${proposalReviewForm.comments[0].firstName}"/>
			<input id ="userLastName" type="hidden" value="${proposalReviewForm.comments[0].lastName}"/>



		</tr>
		<tr>
			<td></td>
			<td></td>
			<td><button class="btn my-btn"  id="submit-form">Submit Score</button></td>
			<td></td>
		</tr>
	</table>

	<h3 id="comment-header">Comments</h3>
	<table id="comments" class="table">
		<tbody>
		<c:forEach items="${proposalReviewForm.comments}" var="comment" varStatus="status">
            <c:if test = "${comment.comment != null}">
                <tr>
                    <td>${comment.firstName} - ${comment.date}</td>
                </tr>
                <td class="reviewerComments">${comment.comment}</td>
                </tr>
            </c:if>

		</c:forEach>
		</tbody>
	</table>



	<textarea id="commentInput" class="form-control input-xs-8" rows="4" placeholder="Write a comment..."></textarea>
	<br/>
	<button type="submit" id="commentButton" class="btn my-btn pull-right" form="proposalReviewForm">Publish</button>

</div>
</form:form>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>

<script>
    $("document").ready(function() {
        $("input.score").change(function() {
            if ($(this).val() > 2) {
                $(this).val(2);
            } else if ($(this).val() < 0) {
                $(this).val(0);
            }
            updateScoreTotal();
        });
    });

    function updateScoreTotal() {
        var score = 0;
        $("input.score").each(function() {
            score += parseInt($(this).val() || 0);
        })
        $("#score-total").text(score + " / 10");
    }

    $("#commentButton").click(function() {

		var header = document.createElement("th");
        header.innerText = document.getElementById("userFirstName").value + " - " + getDate();
        $("#comments").find('tbody')
            .append(header)
            .append($('<tr>')
                .append($('<td>')
                    .attr('class', "reviewerComments")
					.text($("#commentInput").val())
                )
            )
         document.getElementById("commentInput").value = "";
    });

    function getDate() {
        var ts = new Date();
        return ts.toLocaleDateString() + " " + ts.toLocaleTimeString();
    }
</script>

<script type="text/javascript" src="<s:url value="/js/PersistProposalDetail.js"/>"></script>

