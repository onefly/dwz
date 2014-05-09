<%@page import="com.ketayao.security.entity.main.Role"%>
<%@page import="com.ketayao.security.entity.main.Module"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<h2 class="contentTitle">修改角色</h2>
<form method="post" action="<%=basePath %>/management/security/role/update" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<input type="hidden" name="id" value="${role.id }">
	<div class="pageFormContent" layoutH="97">
	<dl>
		<dt>名称：</dt>
		<dd>
			<input type="text" name="name" class="required" size="32" maxlength="32" alt="请输入角色名称" value="${role.name }"/>
		</dd>
	</dl>
	
	<div class="divider"></div>
	
	<ul class="treeCustom">
		<li>
			<div class=""><div class="first_collapsable"></div>
			<a href="#" class="permissionList">
				<span class="module_name">${module.name }</span>
				<span style="float: right;">
				<span class="crud">读取</span>
				<span class="crud">创建</span>
				<span class="crud">修改</span>
				<span class="crud">删除</span>
				<span class="crud">全部</span>
				</span>
			</a>
			</div>
			<%
				Role role = (Role)request.getAttribute("role");
				List<String> permissionList = role.getPermissionList();
				
				Module module = (Module)request.getAttribute("module");
				int ind = 0;
				out.println("<ul>");
				for (int m1ind = 0; m1ind < module.getChildren().size(); m1ind++) {
					Module m1 = module.getChildren().get(m1ind);
					if ((m1ind + 1) == module.getChildren().size()) {
						out.println("			<li class=\"last\">");	
					} else {
						out.println("			<li>");
					}
					out.println("<div class=\"\"><div class=\"indent\"></div>");
					
					if (m1.getChildren().size() > 0) {
						out.println("<div class=\"collapsable\"></div>");
					} else {
						out.println("<div class=\"node\"></div>");
					}
					
					out.println("		<a href=\"#\" class=\"permissionList\">");
					out.println("<span class=\"module_name\">" + m1.getName() + "</span>");
					out.println("<span class=\"inputValue\">");
						
					if (permissionList.contains(m1.getSn() + ":view")) {
						out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m1.getSn() + ":view\" checked=\"checked\"/>");	
					} else {
						out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m1.getSn() + ":view\" />");
					}
				
					if (permissionList.contains(m1.getSn() + ":save")) {
						out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m1.getSn() + ":save\" checked=\"checked\"/>");	
					} else {
						out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m1.getSn() + ":save\" />");
					}
					
					if (permissionList.contains(m1.getSn() + ":edit")) {
						out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m1.getSn() + ":edit\" checked=\"checked\"/>");	
					} else {
						out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m1.getSn() + ":edit\" />");
					}
					
					if (permissionList.contains(m1.getSn() + ":delete")) {
						out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m1.getSn() + ":delete\" checked=\"checked\"/>");	
					} else {
						out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m1.getSn() + ":delete\" />");
					}
					
					if (permissionList.contains(m1.getSn() + ":view") && permissionList.contains(m1.getSn() + ":save") 
							&& permissionList.contains(m1.getSn() + ":edit") && permissionList.contains(m1.getSn() + ":delete")) {
						out.println("	<input type=\"checkbox\" class=\"checkboxCtrl\" group=\"permissionList[" + ind + "]\" checked=\"checked\"/>");	
					} else {
						out.println("	<input type=\"checkbox\" class=\"checkboxCtrl\" group=\"permissionList[" + ind + "]\" />");
					}
					out.println("</span>");
					out.println("		</a>");
					out.println("		</div>");
					
					if (!m1.getChildren().isEmpty()) {
						out.println("		<ul>");
						for (int m2ind = 0; m2ind < m1.getChildren().size(); m2ind++) {
							ind++;
							Module m2 = m1.getChildren().get(m2ind);
							if ((m2ind + 1) == m1.getChildren().size()) {
								out.println("			<li class=\"last\">");	
							} else {
								out.println("			<li>");
							}
							
							out.println("<div class=\"\"><div class=\"indent\"></div><div class=\"line\"></div><div class=\"node\"></div>");
							out.println("		<a href=\"#\" class=\"permissionList\">");
							out.println("<span class=\"module_name\">" + m2.getName() + "</span>");
							out.println("<span class=\"inputValue\">");
							
							if (permissionList.contains(m2.getSn() + ":view")) {
								out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m2.getSn() + ":view\" checked=\"checked\"/>");	
							} else {
								out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m2.getSn() + ":view\" />");
							}
							
							if (permissionList.contains(m2.getSn() + ":save")) {
								out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m2.getSn() + ":save\" checked=\"checked\"/>");	
							} else {
								out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m2.getSn() + ":save\" />");
							}
							
							if (permissionList.contains(m2.getSn() + ":edit")) {
								out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m2.getSn() + ":edit\" checked=\"checked\"/>");	
							} else {
								out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m2.getSn() + ":edit\" />");
							}
							
							if (permissionList.contains(m2.getSn() + ":delete")) {
								out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m2.getSn() + ":delete\" checked=\"checked\"/>");	
							} else {
								out.println("	<input type=\"checkbox\" name=\"permissionList[" + ind + "]\" value=\"" + m2.getSn() + ":delete\" />");
							}
							
							if (permissionList.contains(m2.getSn() + ":view") && permissionList.contains(m2.getSn() + ":save") 
									&& permissionList.contains(m2.getSn() + ":edit") && permissionList.contains(m2.getSn() + ":delete")) {
								out.println("	<input type=\"checkbox\" class=\"checkboxCtrl\" group=\"permissionList[" + ind + "]\" checked=\"checked\"/>");	
							} else {
								out.println("	<input type=\"checkbox\" class=\"checkboxCtrl\" group=\"permissionList[" + ind + "]\" />");
							}
							out.println("</span>");
							out.println("		</a>");
							out.println("</div>");
							out.println("			</li>");
						}
						out.println("		</ul>");
					}
					out.println("	</li>");
					ind++;	
				}
				out.println("</ul>");
			%>
		</li>
	</ul>
	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>