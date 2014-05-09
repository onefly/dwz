<%@page import="com.ketayao.security.entity.main.Organization"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%!
	public String tree(Organization organization, String basePath) {
		if (organization.getChildren().isEmpty()) {
			return "";
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append("<ul>" + "\n");
		for(Organization o : organization.getChildren()) {
			buffer.append("<li><a href=\"" + basePath + "/management/security/organization/list/" + o.getId() + "\" target=\"ajax\" rel=\"jbsxBox2organization\">" + o.getName() + "</a>" + "\n");
			buffer.append(tree(o, basePath));
			buffer.append("</li>" + "\n");
		}
		buffer.append("</ul>" + "\n");
		return buffer.toString();
	}
%>
<%
	Organization organization2 = (Organization)request.getAttribute("organization");
%>
<div class="pageContent">
	<div class="tabs">

		<div class="tabsContent">
			<div>
				<div layoutH="0" style="float:left; display:block; overflow:auto; width:240px; border:solid 1px #CCC; line-height:21px; background:#fff">
			    <ul class="tree treeFolder expand">
					<li><a href="<%=basePath %>/management/security/organization/list/${organization.id}" target="ajax" rel="jbsxBox2organization">${organization.name }</a>
						<%=tree(organization2, basePath) %>
					</li>
			     </ul>
				</div>
				
				<div id="jbsxBox2organization" class="unitBox" style="margin-left:246px;">
					<!--#include virtual="list1.html" -->
				</div>
	
			</div>
		</div>
	</div>
</div>
