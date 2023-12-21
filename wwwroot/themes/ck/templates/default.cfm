<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<div class="image" style="background-image: url('#m.content().getImageURL('carouselimage')#')"></div>

	<!--- get feautures --->
	<cfset local.sections = m.getBean('content').loadBy(remoteId = "#lCase(m.content().get('contentid'))#-features", siteID = m.event('siteID')) />
	<cfset local.kidsIterator = local.sections.getKidsIterator().setNextN(0)>
	<cfset local.sectionNum = 0>
	<!--- get Links --->
	<cfset local.links = m.getBean('content').loadBy(remoteId = "#lCase(local.sections.get('remoteId'))#-links", siteID = m.event('siteID')) />
	<cfset local.linkKidsIterator = local.links.getKidsIterator().setNextN(0)>
	<cfset local.linkSectionNum = 0>

	<!---  loop through kids --->
	<cfloop condition="#local.kidsIterator.hasNext()#">
		<cfset local.kid = local.kidsIterator.next()>
		<!--- get slideshow --->
		<cfset local.slideshow = m.getBean('content').loadBy(remoteId = "#lCase(local.kid.get('contentid'))#-slideshow", siteID = m.event('siteID')) />
		<cfset local.slideshowKidsIterator = local.slideshow.getKidsIterator().setNextN(0)>
		<cfset local.slideshowSectionNum = 0>

		<!--- load as feature with image --->
		<cfif local.kid.get('type') eq 'Page' AND (local.kid.getImageURL('large') neq "" OR local.slideshowKidsIterator.hasNext())>
			<cfset local.sectionNum += 1>
			<div class="container">
				<div class="imgFeature#(local.sectionNum MOD 2 ? 'R':'L')#">
					<div class="text">
						<cfif local.kidsIterator.currentIndex() neq 1>
							<h2 id="#local.kid.get('urlTitle')#">#local.kid.get('title')#</h2>
						<cfelse>
							<p id="surtitle">#m.content().get('surtitle')#</p>
							<cfif local.kid.get('title') EQ "Praxisgemeinschaft Zürichhorn">
								<h1>Praxisgemeinschaft <span style="color: ##7982be;">Z&uuml;richhorn</span></h1>
							<cfelse>
								<h1>#m.content().get('title')#</h1>
							</cfif>
							<cfset local.titleSet = true>
						</cfif>
						#local.kid.get('body')#
						<cfif local.kid.get('buttonText') neq "" AND local.kid.get('buttonLink') neq "">
							<div class="featureButton">
								<a href="#local.kid.get('buttonLink')#">
									<p>#local.kid.get('buttonText')#</p>
								</a>
							</div><!--- /.featureButton --->
						</cfif>
					</div><!--- /.text --->
					<cfif local.slideshowKidsIterator.hasNext()>
						<div class="slider main-slider">
							<div class="slider-wrapper">
								<cfloop condition="#local.slideshowKidsIterator.hasNext()#">
									<cfset local.slideshowKid = local.slideshowKidsIterator.next()>
									<img class="slide content-image" src="#local.slideshowKid.getImageURL('large')#" alt="#local.slideshowKid.get('title')#" />
								</cfloop>
							</div><!--- /.slideshow --->
						</div><!--- /.slider --->
					<cfelse>
						<img class="content-image" src="#local.kid.getImageURL('large')#" alt="#local.kid.get('title')#" />
					</cfif>
					<br>
				</div><!--- /.imgFeature --->
			</div><!--- /.container --->

		<!--- load as feature --->
		<cfelseif local.kid.get('type') eq 'Page' />
			<cfset local.sectionNum += 1>
			<div id="#local.kid.get('urlTitle')#" class="container">
				<div class="feature">
					<img class="logo-round" src="#m.siteConfig('themeAssetPath')#/images/logo/logo_round.svg" alt="Logo der #m.siteConfig().get("contactName")	#" />
					<div class="text">
						<h2>#local.kid.get('title')#</h2>
						#local.kid.get('body')#
						<cfif local.kid.get('buttonText') neq "" AND local.kid.get('buttonLink') neq "">
							<div class="featureButton">
								<a href="#local.kid.get('buttonLink')#">
									<p>#local.kid.get('buttonText')#</p>
								</a>
							</div><!--- /.featureButton --->
						</cfif>
					</div><!--- /.text --->
					<br>
				</div><!--- /.feature --->
			</div><!--- /.container --->

		<!--- load as iFrame --->
		<cfelseif local.kid.get('subtype') eq 'OpenStreetMap' >
			<div id="map" class="openStreetMap">
				<iframe class="no-pointer-events" src="#local.kid.get('body')#"></iframe>
			</div><!--- /.iframe --->
		</cfif>

		<!---  loop through kids --->
		<cfif local.linkKidsIterator.hasNext()>
			<div class="linksWrapper">
				<div class="container" >
					<h2>#local.links.get('title')#</h2>
					<div class="columns">
						<cfloop condition="#local.linkKidsIterator.hasNext()#" >
							<cfset local.linkKid = local.linkKidsIterator.next()>
							<cfif local.linkKid.get('type') eq 'Link'>
								<div class="link">
									<a href="#local.linkKid.get('body')#">
										<h3>#local.linkKid.get('title')#</h3><br>
										#local.linkKid.get('summary')#
										<p>MEHR ></p>
									</a>
								</div><!--- /.link --->
							</cfif>
						</cfloop>
					</div><!--- /.columns --->
				</div> <!--- /.container --->
			</div> <!--- /.linksWrapper --->
		</cfif>
	</cfloop>

	<div class="container">
		<cfif !structKeyExists(local, "titleSet")>
			<p id="surtitle">#m.content().get('surtitle')#</p>
			<h1>#m.content().get('title')#</h1>
		</cfif>
		#m.content().get('body')#
	</div><!--- /.container --->

	<div class="displayOjbect-blowContent">
		#$.dspObjects(2)#
	</div>

	<cfinclude template="inc/footer.cfm" />
</cfoutput>