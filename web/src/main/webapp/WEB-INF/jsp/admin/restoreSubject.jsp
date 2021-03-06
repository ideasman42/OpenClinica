<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setBundle basename="org.akaza.openclinica.i18n.notes" var="restext"/>
<fmt:setBundle basename="org.akaza.openclinica.i18n.words" var="resword"/>
<fmt:setBundle basename="org.akaza.openclinica.i18n.format" var="resformat"/>
<c:set var="dteFormat"><fmt:message key="date_format_string" bundle="${resformat}"/></c:set>



<c:import url="../include/admin-header.jsp"/>


<!-- move the alert message to the sidebar-->
<jsp:include page="../include/sideAlert.jsp"/>
<!-- then instructions-->
<tr id="sidebar_Instructions_open" style="display: none">
		<td class="sidebar_tab">

		<a href="javascript:leftnavExpand('sidebar_Instructions_open'); leftnavExpand('sidebar_Instructions_closed');"><span class="icon icon-caret-down gray"></span></a>

		<fmt:message key="instructions" bundle="${restext}"/>

		<div class="sidebar_tab_content">

		</div>

		</td>

	</tr>
	<tr id="sidebar_Instructions_closed" style="display: all">
		<td class="sidebar_tab">

		<a href="javascript:leftnavExpand('sidebar_Instructions_open'); leftnavExpand('sidebar_Instructions_closed');"><span class="icon icon-caret-right gray"></span></a>

		<fmt:message key="instructions" bundle="${restext}"/>

		</td>
  </tr>
<jsp:include page="../include/sideInfo.jsp"/>

<jsp:useBean scope='request' id='studySubs' class='java.util.ArrayList'/>
<jsp:useBean scope='request' id='events' class='java.util.ArrayList'/>
<jsp:useBean scope='request' id='subjectToRestore' class='org.akaza.openclinica.bean.submit.SubjectBean'/>

<h1><span class="title_manage"><fmt:message key="confirm_restore_of_subject" bundle="${restext}"/></span></h1>

<div class="table_title_Admin"><fmt:message key="you_choose_to_restore_the_following_subject2" bundle="${restext}"/></div>
<div style="width: 600px">
<div class="box_T"><div class="box_L"><div class="box_R"><div class="box_B"><div class="box_TL"><div class="box_TR"><div class="box_BL"><div class="box_BR">

<div class="textbox_center">

<table border="0" cellpadding="0">
  <tr valign="top" ><td class="table_header_column"><fmt:message key="person_ID" bundle="${resword}"/>:</td><td class="table_cell">
  <c:out value="${subjectToRestore.uniqueIdentifier}"/>
   </td></tr>
  <tr valign="top"><td class="table_header_column"><fmt:message key="gender" bundle="${resword}"/>:</td><td class="table_cell">
  <c:out value="${subjectToRestore.gender}"/>
  </td>
  <tr valign="top"><td class="table_header_column"><fmt:message key="date_of_birth" bundle="${resword}"/>:</td><td class="table_cell">
  <fmt:formatDate value="${subjectToRestore.dateOfBirth}" pattern="${dteFormat}"/>
  </td>
  <tr valign="top"><td class="table_header_column"><fmt:message key="date_created" bundle="${resword}"/>:</td><td class="table_cell">
  <fmt:formatDate value="${subjectToRestore.createdDate}" pattern="${dteFormat}"/>
  </td>
  </tr>
</table>
</div>

</div></div></div></div></div></div></div></div>
</div>
<br/><br/>
<div class="table_title_Admin"><fmt:message key="associated_study_subjects" bundle="${restext}"/></div>
<div style="width: 600px">
<div class="box_T"><div class="box_L"><div class="box_R"><div class="box_B"><div class="box_TL"><div class="box_TR"><div class="box_BL"><div class="box_BR">

<div class="tablebox_center">
 <table border="0" cellpadding="0" cellspacing="0" width="100%">
 <tr valign="top">
    <td class="table_header_column_top"><fmt:message key="study_subject_ID" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="secondary_ID" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="study_record_ID" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="enrollment_date" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="date_created" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="created_by" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="status" bundle="${resword}"/></td>
    </tr>
  <c:forEach var="studySub" items="${studySubs}">
    <tr valign="top">
    <td class="table_cell"><c:out value="${studySub.label}"/></td>
    <td class="table_cell"><c:out value="${studySub.secondaryLabel}"/>&nbsp;</td>
    <td class="table_cell"><c:out value="${studySub.studyId}"/></td>
    <td class="table_cell"><fmt:formatDate value="${studySub.enrollmentDate}" pattern="${dteFormat}"/></td>
    <td class="table_cell"><fmt:formatDate value="${studySub.createdDate}" pattern="${dteFormat}"/></td>
    <td class="table_cell"><c:out value="${studySub.owner.name}"/></td>
    <td class="table_cell"><c:out value="${studySub.status.name}"/></td>
    </tr>
 </c:forEach>
</table>
</div>

</div></div></div></div></div></div></div></div>
</div>
<br><br>
<div class="table_title_Admin"><fmt:message key="associated_study_events" bundle="${restext}"/></div>
<div style="width: 600px">
<div class="box_T"><div class="box_L"><div class="box_R"><div class="box_B"><div class="box_TL"><div class="box_TR"><div class="box_BL"><div class="box_BR">

<div class="tablebox_center">
 <table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr valign="top">
    <td class="table_header_column_top"><fmt:message key="record_ID" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="location" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="date_started" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="created_by" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="status" bundle="${resword}"/></td>
    </tr>
  <c:forEach var="event" items="${events}">
    <tr valign="top">
    <td class="table_cell"><c:out value="${event.id}"/></td>
    <td class="table_cell"><c:out value="${event.location}"/>&nbsp;</td>
    <td class="table_cell"><fmt:formatDate value="${event.createdDate}" pattern="${dteFormat}"/></td>
    <td class="table_cell"><c:out value="${event.owner.name}"/></td>
    <td class="table_cell"><c:out value="${event.status.name}"/></td>
    </tr>
 </c:forEach>
</table>
</div>

</div></div></div></div></div></div></div></div>
</div>
<p>
<form action='RestoreSubject?action=submit&id=<c:out value="${subjectToRestore.id}"/>' method="POST">
 <input type="submit" name="submit" value="<fmt:message key="restore_subject" bundle="${resword}"/>" class="button_long" onClick='return confirm("<fmt:message key="restore_explication" bundle="${restext}"/>");'>
</form>

<jsp:include page="../include/footer.jsp"/>
