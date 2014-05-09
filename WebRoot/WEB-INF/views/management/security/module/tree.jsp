<%@page import="com.ketayao.security.entity.main.Module"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%!
	public String tree(Module module, String basePath) {
		if (module.getChildren().isEmpty()) {
			return "";
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append("<ul>" + "\n");
		for(Module o : module.getChildren()) {
			buffer.append("<li><a href=\"" + basePath + "/management/security/module/list/" + o.getId() + "\" target=\"ajax\" rel=\"jbsxBox2module\">" + o.getName() + "</a>" + "\n");
			buffer.append(tree(o, basePath));
			buffer.append("</li>" + "\n");
		}
		buffer.append("</ul>" + "\n");
		return buffer.toString();
	}
%>
<%
	Module module2 = (Module)request.getAttribute("module");
%>
<div class="pageContent">
	<div class="tabs">

		<div class="tabsContent">
			<div>
				<div layoutH="0" style="float:left; display:block; overflow:auto; width:240px; border:solid 1px #CCC; line-height:21px; background:#fff">
			    <ul class="tree treeFolder expand">
					<li><a href="<%=basePath %>/management/security/module/list/${module.id}" target="ajax" rel="jbsxBox2module">${module.name }</a>
						<%=tree(module2, basePath) %>
					</li>
			     </ul>
				</div>
				
				<div id="jbsxBox2module" class="unitBox" style="margin-left:246px;">
					<!--#include virtual="list1.html" -->
				</div>
	
			</div>
		</div>
	</div>
</div>
