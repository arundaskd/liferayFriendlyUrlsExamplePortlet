<%@page import="shortUrlPortlet.portlet.ShortURLUtil"%>
<%@page import="com.liferay.portal.kernel.util.URLUtil"%>
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

<hr />
<p>
	<portlet:actionURL name="myAction" var="myActionURL" />
	<% 
		String p_p_id=ShortURLUtil.getParameterFromURL(myActionURL,"p_p_id");
		String p_p_state=ShortURLUtil.getParameterFromURL(myActionURL,"p_p_state");
		String p_p_mode=ShortURLUtil.getParameterFromURL(myActionURL,"p_p_mode");
		String p_p_lifecycle=ShortURLUtil.getParameterFromURL(myActionURL,"p_p_lifecycle");
		String p_auth=ShortURLUtil.getParameterFromURL(myActionURL,"p_auth");
		
		myActionURL=ShortURLUtil.removeParameterFromURL(myActionURL, "p_p_id");
		myActionURL=ShortURLUtil.removeParameterFromURL(myActionURL, "p_p_state");
		myActionURL=ShortURLUtil.removeParameterFromURL(myActionURL, "p_p_mode");
		myActionURL=ShortURLUtil.removeParameterFromURL(myActionURL, "p_p_lifecycle");
		myActionURL=ShortURLUtil.removeParameterFromURL(myActionURL, "p_auth");
		myActionURL=ShortURLUtil.removeParameterFromURL(myActionURL, renderResponse.getNamespace()+"javax.portlet.action");
	%>
	<form action="<%=myActionURL%>" method="post" name="<portlet:namespace />fm" >
		<input type="hidden" name="p_p_id" value="<%=p_p_id%>" />
		<input type="hidden" name="p_p_state" value="<%=p_p_state%>" />
		<input type="hidden" name="p_p_mode" value="<%=p_p_mode%>" />
		<input type="hidden" name="p_p_lifecycle" value="<%=p_p_lifecycle%>" />
		<input type="hidden" name="p_auth" value="<%=p_auth%>" />
		<input type="hidden" name="<portlet:namespace />javax.portlet.action" value="myAction" />

		<input type="text" name="<portlet:namespace />param1" value="param1value" />

		<br /><input type="submit" value="Trigger CLEAN-Url-Action <%=myActionURL%>"/>
	</form>
</p>