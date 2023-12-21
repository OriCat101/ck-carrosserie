<cfset local.contact = {
	"name":m.siteConfig().get("contactName"),
	"address":m.siteConfig().get("contactAddress"),
	"city":m.siteConfig().get("contactCity"),
	"zip":m.siteConfig().get("contactZip"),
	"email":m.siteConfig().get("contactEmail")
}>

<cfoutput>
			</div><!--- /#content --->

			<footer>
				<div class="footer">
					<div class="container columns">
						<div class="logo-wide">
							<img class="logo-wide" src="#m.siteConfig('themeAssetPath')#/images/logo/logo_long.svg" alt="Logo der #local.contact.name#" />
						</div>

						<div id="address">
							<h2>Adresse</h2>
							<p>#esapiEncode('html', local.contact.name)#<br>
							#esapiEncode('html', local.contact.address)#<br>
							#esapiEncode('html', local.contact.zip)# #esapiEncode('html', local.contact.city)#</p>
							<!--- <p>Email: <a href="mailto:#esapiEncode('html', local.contact.email)#">#esapiEncode('html', local.contact.email)#</a></p>
							<div class="featureButton">
								<a href="/kontakt/">
									<p>KONTAKT &amp; ANMELDUNG</p>
								</a>
							</div> --->
						</div>

						<div id="links">
							<h2>Links</h2>
							#m.dspPrimaryNav(
									viewDepth=1
									, id='navPrimaryFooter'
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
						</div>
					</div>
				</div>

				<div class="footer">
					<div class="container legal">
						<div id="copyright">
							<p>&copy; Copyright #year(now())#, #local.contact.name#</p>
						</div>
						<div id="imprint">
							<p><a href="/impressum">Impressum</a> | <a href="/privacy">Datenschutz</a></p>			
						</div>		
					</div>
				</div>
			</footer>

		</div><!--- /#body --->
	</body>
</html>
</cfoutput>
