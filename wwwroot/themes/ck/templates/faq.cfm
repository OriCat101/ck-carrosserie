<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	
	<div class="image" style="background-image: url('#m.content().getImageURL('carouselimage')#')"></div>
	<div class="container">
		<p id="surtitle">#m.content().get('surtitle')#</p>
		<h1>#m.content().get('title')#</h1>
		#m.content().get('body')#

		<!--- get questions --->
		<cfset local.sections = m.getBean('content').loadBy(remoteId = "#lCase(m.content().get('contentid'))#-questions", siteID = m.event('siteID')) />
		<cfset local.kidsIterator = local.sections.getKidsIterator().setNextN(0)>
		<cfset local.sectionNum = 0>

		<!--- loop through questions --->
		<cfloop condition="#local.kidsIterator.hasNext()#">
			<cfset local.kid = local.kidsIterator.next()>

			<!--- load faq --->
			<cfif local.kid.get('type') eq 'Page'>
				<cfset local.sectionNum += 1>
				<div class="toggle" >
					<h2><i class="fas fa-plus"></i> #local.kid.get('title')#</h2>
					<div class="answer">#local.kid.get('body')#</div>
				</div>
			</cfif>
		</cfloop>
	</div><!--- /.container --->

	<cfinclude template="inc/footer.cfm" />

</cfoutput>
