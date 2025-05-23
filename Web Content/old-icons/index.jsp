<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.io.*"
	import="java.util.*"
	import="net.danisoft.dslib.*"
	import="net.danisoft.wazetools.*"
%>
<%!
	private static final String PAGE_Title = "Old SIGN Icons";
	private static final String PAGE_Keywords = "";
	private static final String PAGE_Description = "";

	private static Vector<String> getOldIconsName() {

		Vector<String> vecOldI = new Vector<>();

		File[] filesList = new File(AppCfg.getServerRootPath() + "/old-icons").listFiles();

		for (File f : filesList)
			if (f.isFile())
				if (f.getName().endsWith(".png"))
					vecOldI.add(f.getName());

		return(vecOldI);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../_common/head.jsp">
		<jsp:param name="PAGE_Title" value="<%= PAGE_Title %>"/>
		<jsp:param name="PAGE_Keywords" value="<%= PAGE_Keywords %>"/>
		<jsp:param name="PAGE_Description" value="<%= PAGE_Description %>"/>
	</jsp:include>
</head>

<body>

	<jsp:include page="../_common/header.jsp" />

	<div class="mdc-layout-grid DS-layout-body">
		<div class="mdc-layout-grid__inner">
			<div class="<%= MdcTool.Layout.Cell(12, 8, 4) %>">

				<div class="DS-card-body">
					<div class="DS-text-title-shadow"><%= PAGE_Title %></div>
				</div>

				<div class="DS-card-body">
					<div class="DS-text-big">This is a list of <span class="DS-text-bold DS-text-italic">deprecated</span> forum icons that will stay online for a while longer.</div>
				</div>

				<div class="DS-card-full">
					<div class="mdc-layout-grid__inner">
						<% Vector<String> vecIcon = getOldIconsName(); %>
						<% for (int i=0; i < vecIcon.size(); i++) { %>
							<div class="<%= MdcTool.Layout.Cell(4, 4, 4) %>" align="center">
								<div class="DS-padding-5px DS-border-up DS-border-lfrg">
									<img src="<%= vecIcon.get(i) %>">
								</div>
								<div class="DS-padding-5px DS-border-dn DS-border-lfrg">
									<div class="DS-text-compact"><a href="https://sign.waze.tools/old-icons/<%= vecIcon.get(i) %>" target="_blank">https://sign.waze.tools/old-icons/<%= vecIcon.get(i) %></a></div>
								</div>
							</div>
						<% } %>
					</div>
				</div>

				<div class="DS-card-foot">
					<%= MdcTool.Button.BackTextIcon("Back", "../home/") %>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../_common/footer.jsp">
		<jsp:param name="RedirectTo" value=""/>
	</jsp:include>

</body>
</html>
