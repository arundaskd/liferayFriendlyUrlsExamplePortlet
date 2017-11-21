<%@page import="com.liferay.portal.kernel.theme.ThemeDisplay"%>
<%@ include file="/init.jsp" %>

<portlet:renderURL var="editEntryURL">
	<portlet:param name="mvcRenderCommandName" value="/shorturl/view" />
	<portlet:param name="entryId" value="12345" />
</portlet:renderURL>

<% String path=themeDisplay.getURLCurrent().toString(); %>
<% path=path.split("\\?")[0]; %>
<% if(!path.contains("/-/")) path+="/-/shorturl"; %>
<% if(path.equals("//-/shorturl"))path="/home/-/shorturl"; %>

<p>
	<b><liferay-ui:message key="shortUrlPortlet.caption"/></b><br /><br />
	<a href="<%=path %>"> This</a> is my SHORT render url (<%=path %>)<br />
	<a href="<%=editEntryURL%>"> This</a> is my LONG render url (<%=editEntryURL%>)<br />
</p>

