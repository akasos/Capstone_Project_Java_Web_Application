<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<div class="container">

	<script type="text/javascript">
        year = new Date().getFullYear();
	</script>

	<% String pageName = "department"; %>
	<%@include file="/WEB-INF/views/breadcrumbs.jsp" %>

	<legend>
		<h2 style="text-align: center;">Project Details</h2>

	</legend>

	<form:form class="form-horizontal" method="post" action="department"
			   modelAttribute="departmentForm">
		<div class="form-group">
			<label class="col-sm-3 control-label required-field"
				   for="departmentID">Department: </label>
			<div class="col-sm-9">
				<form:select id="departmentID" items="${deptList}" path="departmentID">

				</form:select>

			</div>



		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label required-field">Semester:
			</label>
			<div class="col-sm-9">

				<div id="semesterID"><p>${currentSemester}</p></div>
			</div>



		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label required-field">Year:
			</label>
			<div class="col-sm-9">
				<div id ="year"><p>${currentYear}</p></div>
			</div>

		</div>

		<input type="hidden" name="nextPage" id="nextPage" value="0" />





		<%--
                <script>
                    function asyncSubmit(dest) {
                        var xhttp = new XMLHttpRequest();

                        xhttp.open("POST", "<s:url value="/proposal/department" />", true);
                        xhttp.send();

                        window.location.href="<s:url value="/proposal/awardType" />"
                    }
                </script>
        --%>

		<div class="button-row">
			<!-- Placeholder to help align buttons -->
			<button type="submit" class="btn my-btn pull-left" onclick='setNextPage("proposal/detail", "<s:url value="/" />")'>Previous</button>
			<button type="submit" class="btn my-btn" onclick='setNextPage("proposal/department", "<s:url value="/" />")'>Save</button>
			<button type="submit" class="btn my-btn pull-right" onclick='updateProposalDepartment(); setNextPage("proposal/awardType", "<s:url value="/" />")'>Next</button>
		</div>
	</form:form>

</div>

<script type="text/javascript" src="<s:url value="/js/PersistProposalDeparment.js"/>"></script>