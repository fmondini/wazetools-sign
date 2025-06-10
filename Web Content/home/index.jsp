<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*"
	import="net.danisoft.dslib.*"
	import="net.danisoft.wazetools.*"
%>
<%!
	private static final String PAGE_Title = AppCfg.getAppName();
	private static final String PAGE_Keywords = AppCfg.getAppName() + " " + AppCfg.getAppVersion();
	private static final String PAGE_Description = AppCfg.getAppAbstract();
/*
	-----
	TODO: Icons usage statistics
	-----

	private static Vector<String> vecUsage = new Vector<String>();

	private static void FillIconsUsageArray() {

		Database DB = new Database();

		try {

			Statement stAll = DB.cn.createStatement();
			Statement stDet = DB.cn.createStatement();

			ResultSet rsAll = stAll.executeQuery("SELECT DISTINCT Icon FROM SIGN_StatsByYear");

			String Icon = "";
			int Count = 0;

			while (rsAll.next()) {
		
				Icon = rsAll.getString("Icon");

				ResultSet rsDet = stDet.executeQuery("SELECT SUM(RecCount) AS Count FROM SIGN_StatsByYear WHERE Icon = '" + Icon.replace("'", "") + "'");
		
				Count = 0;
		
				if (rsDet.next())
					Count = rsDet.getInt("Count");
		
				if (Count > 0)
					vecUsage.add(Icon + SysTool.DELIMITER + Count);
			}

			rsAll.close();
			stAll.close();

		} catch (Exception e) {

			System.err.println("FillIconsUsageArray(): " + e.toString());
		}

		DB.destroy();
	}

	private static int GetIconsUsageCount(String icon) {

		int i, rc = 0;
		int vCount = 0;
		String vIcon = "";

		for (i=0; i<vecUsage.size(); i++) {

			try {

				vIcon = vecUsage.get(i).split(SysTool.DELIMITER)[0];
				vCount = Integer.parseInt(vecUsage.get(i).split(SysTool.DELIMITER)[1]);

				if (vIcon.equals("/" + icon + ".png")) {
					rc = vCount;
					break;
				}

			} catch (Exception e) {

				System.err.println("GetIconsUsageCount(): " + e.toString());
				rc = 0;
			}
		}

		return(rc);
	}
*/
%>
<!DOCTYPE html>
<html>
<head>

	<jsp:include page="../_common/head.jsp">
		<jsp:param name="PAGE_Title" value="<%= PAGE_Title %>"/>
		<jsp:param name="PAGE_Keywords" value="<%= PAGE_Keywords %>"/>
		<jsp:param name="PAGE_Description" value="<%= PAGE_Description %>"/>
	</jsp:include>

	<script>
		$(function() {
			$('#signTabs').tabs();
			$('#signTabs').css('background-color', 'white');
		});
	</script>

</head>

<body>

	<jsp:include page="../_common/header.jsp" />
<%
	//
	// INIT Arrays
	//

	Vector<String[][]> vecIcon = new Vector<>();

	vecIcon.add(new String[][] {
		{ "Waze Rank", "<span class=\"DS-text-green\">These icons are free for everyone</span>", "" },
		{ "<b>Rank 1</b><br>Baby Editor",		"c1"	},
		{ "<b>Rank 2</b><br>Junior Editor",		"c2"	},
		{ "<b>Rank 3</b><br>Area Manager",		"c3"	},
		{ "<b>Rank 4</b><br>Advanced Editor",	"c4"	},
		{ "<b>Rank 5</b><br>Senior Editor",		"c5"	},
		{ "<b>Rank 6</b><br>Monster Editor",	"c6"	},
	});

	vecIcon.add(new String[][] {
		{ "Map Edit", "<span class=\"DS-text-green\">These icons are free for everyone</span>", "" },
		{ "<b>10000 edit</b><br>or more",	"s0010"	},
		{ "<b>50000 edit</b><br>or more",	"s0050"	},
		{ "<b>100000 edit</b><br>or more",	"s0100"	},
		{ "<b>300000 edit</b><br>or more",	"s0300"	},
		{ "<b>500000 edit</b><br>or more",	"s0500"	},
		{ "<b>1000000 edit</b><br>or more",	"s1000"	},
		{ "<b>1500000 edit</b><br>or more",	"s1500"	},
		{ "<b>2000000 edit</b><br>or more",	"s2000"	},
	});

	vecIcon.add(new String[][] {
		{ "Forum Posts", "<span class=\"DS-text-green\">These icons are free for everyone</span>", "" },
		{ "<b>50 Posts</b><br>or more",		"p0050"	},
		{ "<b>100 Posts</b><br>or more",	"p0100"	},
		{ "<b>500 Posts</b><br>or more",	"p0500"	},
		{ "<b>1000 Posts</b><br>or more",	"p1000"	},
		{ "<b>2000 Posts</b><br>or more",	"p2000"	},
		{ "<b>10000 Posts</b><br>or more",	"p010k"	},
		{ "<b>50000 Posts</b><br>or more",	"p050k"	},
	});

	vecIcon.add(new String[][] {
		{ "Entitlements", "<span class=\"DS-text-exception\">Use these icons only if you have the right entitlement</span>", "" },
		{ "Coordinators",								""		},
		{ "<b>Coordinator</b>",							"coor"	},
		{ "Community Boosters",							""		},
		{ "<b>Community Booster</b>",					"cb"	},
		{ "Global Champs",								""		},
		{ "<b>Global Champ</b>",						"gc"	},
		{ "<b>Emeritus Global Champ</b>",				"gcem"	},
		{ "Country Managers",							""		},
		{ "<b>Country Manager</b>",						"cm"	},
		{ "<b>Mega Mapper</b>",							"mm"	},
		{ "<b>10 Year Anniversary</b>",					"10y"	},
		{ "Local Champs",								""		},
		{ "<b>Generic</b><br>Local Champ",				"lc"	},
		{ "<b>Belgium</b><br>Local Champ",				"lcbe"	},
		{ "<b>Bolivia</b><br>Local Champ",				"lcbo"	},
		{ "<b>Brazil</b><br>Local Champ",				"lcbr"	},
		{ "<b>Costa Rica</b><br>Local Champ",			"lccr"	},
		{ "<b>Dominican Republic</b><br>Local Champ",	"lcdo"	},
		{ "<b>Germany</b><br>Local Champ",				"lcde"	},
		{ "<b>Hungary</b><br>Local Champ",				"lchu"	},
		{ "<b>Italy</b><br>Local Champ",				"lcit"	},
		{ "<b>Nepal</b><br>Local Champ",				"lcnp"	},
		{ "<b>Nicaragua</b><br>Local Champ",			"lcni"	},
		{ "<b>Poland</b><br>Local Champ",				"lcpl"	},
		{ "<b>Qatar</b><br>Local Champ",				"lcqa"	},
		{ "<b>Russia</b><br>Local Champ",				"lcru"	},
		{ "<b>UAE</b><br>Local Champ",					"lcae"	},
		{ "<b>USA</b><br>Local Champ",					"lcus"	},
		{ "State Managers",								""		},
		{ "<b>State Manager</b>",						"sm"	},
		{ "Area Managers",								""		},
		{ "<b>Area Manager</b>",						"am"	},
	});

	vecIcon.add(new String[][] {
		{ "Specialties", "<span class=\"DS-text-exception\">Use these icons only if you have the right specialty</span>", "" },
		{ "<b>Beta App</b>",				"betc"	},
		{ "<b>Beta Editor</b>",				"beta"	},
		{ "<b>Waze Mentor</b>",				"mntr"	},
		{ "<b>Waze Beacons</b>",			"beac"	},
		{ "<b>Wiki Master</b>",				"wiki"	},
		{ "<b>Localizer</b>",				"loc"	},
		{ "<b>Map Raider</b>",				"mapr"	},
		{ "<b>Script Writer</b>",			"scrp"	},
		{ "<b>Traffic Event Marshal</b>",	"tem"	},
		{ "<b>Partner Coordinator</b>",		"ccp"	},
		{ "<b>WME Restrictions</b>",		"wmer"	},
	});

	// FillIconsUsageArray();
	
	final String UPPER_BAR_TEXT_CLASS = "DS-text-large DS-text-bold";
%>
	<div class="mdc-layout-grid DS-layout-body">
	<div class="mdc-layout-grid__inner">
	<div class="<%= MdcTool.Layout.Cell(12, 8, 4) %>">

	<div class="DS-padding-top-8px">
		<div class="mdc-tab-bar DS-back-lightgray DS-border-full" role="tablist">
			<div class="mdc-tab-scroller">
				<div class="mdc-tab-scroller__scroll-area">
					<div class="mdc-tab-scroller__scroll-content">
						<% for (int v=0; v<vecIcon.size(); v++) { %>
							<%= MdcTool.Tab.ElementText(v, vecIcon.get(v)[0][0], UPPER_BAR_TEXT_CLASS, (v == 0 ? true : false)) %>
						<% } %>
						<%= MdcTool.Tab.ElementText(vecIcon.size(), "HOW TO", UPPER_BAR_TEXT_CLASS, false) %>
						<%= MdcTool.Tab.ElementText(vecIcon.size() + 1, "LC NEW ICONS", UPPER_BAR_TEXT_CLASS, false) %>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="tab-bar-panels">
<%
		//
		// TAB PANELS
		//
%>						
		<% for (int v=0; v<vecIcon.size(); v++) { %>

			<div class="DS-tab-panel<%= (v == 0 ? " DS-tab-panel-active" : "") %>">

				<div class="DS-padding-updn16px">
					<div class="DS-text-huge DS-text-italic" align="center"><%= vecIcon.get(v)[0][1] %></div>
				</div>

				<div class="mdc-layout-grid__inner DS-grid-gap-0px">

					<div class="<%= MdcTool.Layout.Cell(3, 2, 1) %> DS-gradient-lightgray-dn DS-border-up" align="center">
						<div class="DS-padding-updn-8px">
							<div class="DS-text-big DS-text-bold DS-text-italic">Role / Status</div>
						</div>
					</div>
					<div class="<%= MdcTool.Layout.Cell(3, 2, 1) %> DS-gradient-lightgray-dn DS-border-up" align="center">
						<div class="DS-padding-updn-8px">
							<div class="DS-text-big DS-text-bold DS-text-italic">Icon Preview</div>
						</div>
					</div>
					<div class="<%= MdcTool.Layout.Cell(6, 4, 2) %> DS-gradient-lightgray-dn DS-border-up" align="center">
						<div class="DS-padding-updn-8px">
							<div class="DS-text-big DS-text-bold DS-text-italic">Icon URL</div>
						</div>
					</div>

					<% for (int s=1; s<vecIcon.get(v).length; s++) { %>

						<% if (vecIcon.get(v)[s][1].equals("")) { // Sub Section %>

							<div class="<%= MdcTool.Layout.Cell(3, 2, 1) %>" align="center">
								<div class="DS-padding-updn-8px DS-border-up">
									<div class="DS-margin-updn16px">
										<span class="DS-text-large DS-text-bold DS-back-gray DS-padding-lfrg-8px DS-padding-updn-4px DS-border-full DS-border-round"><%= vecIcon.get(v)[s][0] %></span>
									</div>
								</div>
							</div>

							<div class="<%= MdcTool.Layout.Cell(9, 6, 3) %> DS-border-up"></div>

						<% } else { // Detail %>

							<div class="<%= MdcTool.Layout.Cell(3, 2, 1) %> DS-grid-middle-center DS-border-up" align="center">
								<div class="DS-padding-updn-8px"><%= vecIcon.get(v)[s][0] %></div>
							</div>
							<div class="<%= MdcTool.Layout.Cell(3, 2, 1) %> DS-grid-middle-center DS-border-up" align="center">
								<div class="DS-padding-updn-8px"><img src="../<%= vecIcon.get(v)[s][1] %>.png"></div>
							</div>
							<div class="<%= MdcTool.Layout.Cell(6, 4, 2) %> DS-grid-middle-center DS-border-up" align="center">
								<div class="DS-padding-updn-8px">
									<div class="DS-text-fixed-small DS-padding-8px DS-back-HoneyDew DS-border-full">https://s.waze.tools/<%= vecIcon.get(v)[s][1] %>.png</div>
								</div>
							</div>

						<% } %>

					<% } %>

				</div> <!-- /mdc-layout-grid__inner -->
			</div> <!-- /DS-tab-panel[x] -->

		<% } %>
<%
		//
		// HOW TO
		//
%>						
		<div class="DS-tab-panel">

			<div class="DS-card-body">
				<div class="DS-text-huge" align="center">
					<span class="DS-text-green">HowTo</span>
					<span class="DS-text-gray">(how to use these icons)</span>
				</div>
			</div>

			<div class="mdc-layout-grid__inner">
				<div class="<%= MdcTool.Layout.Cell(3, 2, 4) %>"></div>
				<div class="<%= MdcTool.Layout.Cell(6, 4, 4) %>">
					<div class="DS-card-body">
						<div class="DS-padding-16px DS-back-lightgray DS-border-full">
							<ul class="DS-ul-padding DS-text-large">
								<li class="DS-li-padding">Look at the desired image. Select and copy the Icon URL</li>
								<li class="DS-li-padding">Go to the <a class="DS-padding-lfrg-4px DS-back-pastel-blue DS-border-full" href="https://www.waze.com/discuss/" target="_blank">Waze Discuss</a> website</li>
								<li class="DS-li-padding">Click on your avatar icon in the top right</li>
								<li class="DS-li-padding">Select <span class="DS-padding-lfrg-4px DS-back-pastel-blue DS-border-full">Preferences</span> and then <span class="DS-padding-lfrg-4px DS-back-pastel-blue DS-border-full">Profile</span></li>
								<li class="DS-li-padding">Scroll to the bottom to the <span class="DS-padding-lfrg-4px DS-back-pastel-blue DS-border-full">My Signature</span> paragraph</li>
								<li class="DS-li-padding">
									<div>Add the following line in the text box:</div>
									<div><span class="DS-text-fixed-compact DS-text-green DS-padding-lfrg-4px DS-back-white DS-border-full"><b>[img]</b><span class="DS-text-italic">&lt;URL-Of-The-Icon-You-Just-Copied&gt;</span><b>[/img]</b></span></div>
								</li>
								<li class="DS-li-padding">Cross your fingers and click on <b class="DS-text-fixed-compact DS-padding-lfrg-4px DS-back-pastel-blue DS-border-full">Save Changes</b></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="<%= MdcTool.Layout.Cell(3, 2, 4) %>"></div>
			</div>

			<!-- Desktop Only -->

			<div class="DS-desktop-only">

				<div class="DS-card-body">
					<div class="DS-text-huge" align="center">Example of use and sequence of icons in your signature</div>
				</div>

				<div class="DS-card-foot" align="center">
					<table class="TableSpacing_0px">
						<tr class="DS-back-gray DS-border-updn">
							<td align="center" nowrap class="CellPadding_8px DS-border-lf"><img src="../gc.png"></td>
							<td align="center" nowrap class="CellPadding_8px"><img src="../lc.png"></td>
							<td align="center" nowrap class="CellPadding_8px DS-border-rg"><img src="../cm.png"></td>
							<td align="center" nowrap class="CellPadding_8px"><img src="../beta.png"></td>
							<td align="center" nowrap class="CellPadding_8px"><img src="../betc.png"></td>
							<td align="center" nowrap class="CellPadding_8px"><img src="../loc.png"></td>
							<td align="center" nowrap class="CellPadding_8px DS-border-rg"><img src="../wiki.png"></td>
							<td align="center" nowrap class="CellPadding_8px DS-border-rg"><img src="../s1000.png"></td>
							<td align="center" nowrap class="CellPadding_8px DS-border-rg"><img src="../p050k.png"></td>
							<td align="center" nowrap class="CellPadding_8px DS-border-rg"><img src="../c6.png"></td>
						</tr>
						<tr class="DS-text-bold DS-back-lightgray DS-border-dn">
							<td align="center" nowrap class="CellPadding_8px DS-border-lfrg" ColSpan="3">Entitlements</td>
							<td align="center" nowrap class="CellPadding_8px DS-border-rg" ColSpan="4">Specialties</td>
							<td align="center" nowrap class="CellPadding_8px DS-border-rg">Your Edits</td>
							<td align="center" nowrap class="CellPadding_8px DS-border-rg">Your Posts</td>
							<td align="center" nowrap class="CellPadding_8px DS-border-rg ">Your Rank</td>
						</tr>
						<tr class="DS-text-compact DS-text-italic DS-text-exception DS-border-dn">
							<td align="center" nowrap class="CellPadding_8px DS-border-lfrg" ColSpan="3">place here only the<br><b>entitlements you really own</b></td>
							<td align="center" nowrap class="CellPadding_8px DS-border-rg" ColSpan="4">place here only the<br><b>specialties you really own</b></td>
							<td align="center" nowrap class="CellPadding_8px DS-border-rg">please use<br><b>Real Edits</b></td>
							<td align="center" nowrap class="CellPadding_8px DS-border-rg">please use<br><b>Real Posts</b></td>
							<td align="center" nowrap class="CellPadding_8px DS-border-rg">please use<br><b>Real Rank</b></td>
						</tr>
					</table>
				</div>
			</div>						

		</div> <!-- /DS-tab-panel (HowTo) -->
<%
		//
		// LC NEW ICONS
		//

		String cellDivLF = MdcTool.Layout.Cell(1, 1, 1) + " DS-grid-middle-center DS-padding-0px DS-back-gray";
		String cellDivRG = MdcTool.Layout.Cell(11, 7, 3) + " DS-grid-middle-left DS-padding-16px DS-back-lightgray";
%>						
		<div class="DS-tab-panel">

			<div class="mdc-layout-grid__inner">
<%
				//
				// LEFT Column
				//
%>
				<div class="<%= MdcTool.Layout.Cell(9, 6, 4) %>">
					<div class="DS-card-body DS-border-dn">
						<div class="DS-text-title">Steps to create a new Local Champ custom icon</div>
					</div>
					<div class="DS-card-body">
						<div class="mdc-layout-grid__inner DS-grid-gap-4px">
							<div class="<%= cellDivLF %>">
								<div class="DS-text-very-large DS-text-bold">&#10112;</div>
							</div>
							<div class="<%= cellDivRG %>">
								<div>Download <a href="LC_Italy.zip">this template ZIP file</a> to start from.<br>
									<span class="DS-text-small DS-text-italic">If you prefer to create an icon from scratch, look at the file specs to the right under &quot;Icon file specs&quot;</span>
								</div>
							</div>
							<div class="<%= cellDivLF %>">
								<div class="DS-text-very-large DS-text-bold">&#10113;</div>
							</div>
							<div class="<%= cellDivRG %>">
								<div>Edit the .PSD file included in the ZIP to reflect the colors and shape (or a well-known image) of your country</div>
							</div>
							<div class="<%= cellDivLF %>">
								<div class="DS-text-very-large DS-text-bold">&#10114;</div>
							</div>
							<div class="<%= cellDivRG %>">
								<div>If necessary, change the words &quot;Local Champ&quot; at the bottom of the image.<br>
									<span class="DS-text-small DS-text-italic">Please only do this if absolutely necessary: we prefer to have a common layout, and the &quot;Local Champ&quot; text is a crucial component.</span>
								</div>
							</div>
							<div class="<%= cellDivLF %>">
								<div class="DS-text-very-large DS-text-bold">&#10115;</div>
							</div>
							<div class="<%= cellDivRG %>">
								<div>Export or save the new icon in the format/type specified under &quot;Icon file specs&quot;.</div>
							</div>
							<div class="<%= cellDivLF %>">
								<div class="DS-text-very-large DS-text-bold">&#10116;</div>
							</div>
							<div class="<%= cellDivRG %>">
								<div>Email both files (the .PSD file and the .PNG file) to <b>dev</b>[at]<b>waze</b>[dot]<b>tools</b></div>
							</div>
						</div>
					</div>
				</div>
<%
				//
				// RIGHT Column
				//

				cellDivLF = MdcTool.Layout.Cell(3, 2, 1) + " DS-grid-middle-center DS-padding-0px DS-back-gray";
				cellDivRG = MdcTool.Layout.Cell(9, 6, 3) + " DS-grid-middle-left DS-padding-8px DS-back-lightgray";
%>
				<div class="<%= MdcTool.Layout.Cell(3, 2, 4) %>">
					<div class="DS-card-body DS-border-dn">
						<div class="DS-text-title">Icon file specs</div>
					</div>
					<div class="DS-card-body">
						<div class="mdc-layout-grid__inner DS-grid-gap-4px">
							<div class="<%= cellDivLF %>">
								<div class="DS-text-bold">Type</div>
							</div>
							<div class="<%= cellDivRG %>">
								<div class=""><a href="http://en.wikipedia.org/wiki/Portable_Network_Graphics" target="_blank">PNG</a></div>
							</div>
							<div class="<%= cellDivLF %>">
								<div class="DS-text-bold">Color</div>
							</div>
							<div class="<%= cellDivRG %>">
								<div class="">PNG-24 with Transparency</div>
							</div>
							<div class="<%= cellDivLF %>">
								<div class="DS-text-bold">Size</div>
							</div>
							<div class="<%= cellDivRG %>">
								<div>70x70 px (or 63x63 px)</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div> <!-- /tab-bar-panels -->

	</div>
	</div>
	</div>

	<jsp:include page="../_common/footer.jsp">
		<jsp:param name="RedirectTo" value=""/>
	</jsp:include>

</body>
</html>
