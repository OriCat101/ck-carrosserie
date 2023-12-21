<cfoutput>
	<cfinclude template="inc/html_head.cfm" />

	<div class="container" style="margin-top: 100px;">
		<h1>#m.content().get('title')#</h1>
		#m.content().get('body')#
	</div>

	<cfinclude template="inc/footer.cfm" />
</cfoutput>