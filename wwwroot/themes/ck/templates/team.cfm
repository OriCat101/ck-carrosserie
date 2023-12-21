<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
		<div id="body">
			<cfinclude template="inc/navbar.cfm" />
			<div id="content">
				<div class="image" style="background-image: url('#m.content().getImageURL('carouselimage')#')" /></div>
				<div class="container">
					<p id="surtitle">#m.content().get('surtitle')#</p>
					<h1>#m.content().get('title')#</h1>
					#m.content().get('body')#

					<!--- get teammember --->
					<cfset local.sections = m.getBean('content').loadBy(remoteId = "#lCase(m.content().get('contentid'))#-teammembers", siteID = m.event('siteID')) />
					<cfset local.kidsIterator = local.sections.getKidsIterator().setNextN(0)>
					<cfset local.sectionNum = 0>

					<!--- loop through questions --->
					<cfloop condition="#local.kidsIterator.hasNext()#">
						<cfset local.kid = local.kidsIterator.next()>
						
						<!--- load teammember --->
						<cfif local.kid.get('type') eq 'Page'>
							<cfset local.sectionNum += 1>
							<div class="team-member columns">
								<div class="portrait">
									<cfif local.kid.getImageURL('portrait').len()>
										<img src="#local.kid.getImageURL('portrait')#" alt="Portrait des Teammitgliedes">
									<cfelse>
										<img src="#$.siteConfig('themeAssetPath')#/images/user_placeholder.jpg" alt="Portrait des Teammitgliedes">
									</cfif>
								</div>
								<div class="infos">
									<h2>#local.kid.get('title')#</h2>
									<p class="surtitle">#local.kid.get('surtitle')#</p>

									<!--- get extended attributes --->
									<div class="toggle">
										<h2><i class="fas fa-plus"></i> Spezialisierung</h2>
										<div class="answer">#local.kid.get('specials')#</div>
									</div>
									<div class="toggle">
										<h2><i class="fas fa-plus"></i> Werdegang</h2>
										<div class="answer">#local.kid.get('history')#</div>
									</div>
									<cfif local.kid.get('memberIn').len()>
										<div class="toggle">
											<h2><i class="fas fa-plus"></i> Mitgliedschaften</h2>
											<div class="answer">#local.kid.get('memberIn')#</div>
										</div>
									</cfif>
									<cfif local.kid.get('papers').len()>
										<div class="toggle">
											<h2><i class="fas fa-plus"></i> Publikation</h2>
											<div class="answer">#local.kid.get('papers')#</div>
										</div>
									</cfif>
								</div><!--- /.infos --->								
							</div><!--- /.team-member --->
						</cfif>
					</cfloop>
				</div><!--- /.container --->
      </div><!--- /#content --->
			<cfinclude template="inc/footer.cfm" />
    </div><!--- /#body --->
</cfoutput>
