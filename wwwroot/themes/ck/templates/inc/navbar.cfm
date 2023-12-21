<cfoutput>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light navbar-static-top py-4">
			<div class="container">

				<img class="logo-wide" src="#m.siteConfig('themeAssetPath')#/images/logo/logo_long.svg" alt="Logo der #m.siteConfig().get("contactName")#" />

				<!--- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##siteNavbar" aria-controls="siteNavbar" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button> --->
					<div id="hamburger">
						<i class="fas fa-bars"></i>
					</div>

				<div class="navbar-collapse" id="siteNavbar">

					#m.dspPrimaryNav(
						viewDepth=1
						, id='navPrimary'
						, class='navbar-nav mr-auto'
						, displayHome='always'
						, closeFolders=true
						, showCurrentChildrenOnly=false
						, liClass='nav-item'
						, liHasKidsClass='dropdown'
						, liHasKidsAttributes=''
						, liCurrentClass=''
						, liCurrentAttributes=''
						, liHasKidsNestedClass=''
						, aHasKidsClass='dropdown-toggle'
						, aHasKidsAttributes=''
						, aCurrentClass='nav-link active'
						, aCurrentAttributes=''
						, ulNestedClass='dropdown-menu'
						, ulNestedAttributes=''
						, aNotCurrentClass='nav-link'
						, siteid=m.event('siteid')
					)#

				</div><!--- /.navbar-collapse --->
			</div><!--- /.container --->
		</nav><!--- /nav --->
	</header>
</cfoutput>
