﻿<!--- 
This file is part of Masa CMS. Masa CMS is based on Mura CMS, and adopts the  
same licensing model. It is, therefore, licensed under the Gnu General Public License 
version 2 only, (GPLv2) subject to the same special exception that appears in the licensing 
notice set out below. That exception is also granted by the copyright holders of Masa CMS 
also applies to this file and Masa CMS in general. 

This file has been modified from the original version received from Mura CMS. The 
change was made on: 2021-07-27
Although this file is based on Mura™ CMS, Masa CMS is not associated with the copyright 
holders or developers of Mura™CMS, and the use of the terms Mura™ and Mura™CMS are retained 
only to ensure software compatibility, and compliance with the terms of the GPLv2 and 
the exception set out below. That use is not intended to suggest any commercial relationship 
or endorsement of Mura™CMS by Masa CMS or its developers, copyright holders or sponsors or visa versa. 

If you want an original copy of Mura™ CMS please go to murasoftware.com .  
For more information about the unaffiliated Masa CMS, please go to masacms.com  

Masa CMS is free software: you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published by 
the Free Software Foundation, Version 2 of the License. 
Masa CMS is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
GNU General Public License for more details. 

You should have received a copy of the GNU General Public License 
along with Masa CMS. If not, see <http://www.gnu.org/licenses/>. 

The original complete licensing notice from the Mura CMS version of this file is as 
follows: 

This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without
Mura CMS under the license of your choice, provided that you follow these specific guidelines:

Your custom code

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

	/admin/
	/core/
	/Application.cfc
	/index.cfm

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->

<cfset $=application.serviceFactory.getBean("muraScope").init(rc.siteID)>
<cfparam name="rc.feedid" default="#rc.objectid#">
<cfset feed=$.getBean("feed").loadBy(feedID=rc.feedID)>

<cfif isDefined("form.params") and isJSON(form.params)>
	<cfset feed.set(deserializeJSON(form.params))>
</cfif>

<cfset data=structNew()>
<cfsavecontent variable="data.html">
<cfoutput>

	<cfif feed.getType() eq "local">
	<div id="availableObjectParams"
	data-object="feed"
	data-name="#esapiEncode('html_attr','#feed.getName()# - #application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.localindex')#')#"
	data-objectid="#feed.getFeedID()#">
	<cfelse>
	<div id="availableObjectParams"
	data-object="feed"
	data-name="#esapiEncode('html_attr','#feed.getName()# - #application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.remotefeed')#')#"
	data-objectid="#feed.getFeedID()#">
	</cfif>

	<h2>#esapiEncode('html',feed.getName())#</h2>
	<cfif rc.configuratorMode eq "frontEnd"
				and application.permUtility.getDisplayObjectPerm(feed.getSiteID(),"feed",feed.getFeedD()) eq "editor">
		<cfsilent>
			<cfset editlink = "?muraAction=cFeed.edit">
			<cfset editlink = editlink & "&amp;siteid=" & feed.getSiteID()>
			<cfset editlink = editlink & "&amp;feedid=" & feed.getFeedID()>
			<cfset editlink = editlink & "&amp;type=" & feed.getType()>
			<cfset editlink = editlink & "&amp;homeID=" & rc.homeID>
			<cfset editlink = editlink & "&amp;compactDisplay=true">
		</cfsilent>
		<ul class="navTask nav nav-pills">
			<li><a href="#editlink#">#application.rbFactory.getKeyValue(session.rb,'collections.editdefaultsettings')#</a></li>
		</ul>
	</cfif>
	<cfif feed.getType() eq "local">
		<div class="mura-layout-row">
			<div class="mura-control-group">
		      	<label>#application.rbFactory.getKeyValue(session.rb,'collections.imagesize')#</label>
				<select name="imageSize" data-displayobjectparam="imageSize" class="objectParam" onchange="if(this.value=='custom'){jQuery('##feedCustomImageOptions').fadeIn('fast')}else{jQuery('##feedCustomImageOptions').hide();jQuery('##feedCustomImageOptions').find(':input').val('AUTO');}">
					<cfloop list="Small,Medium,Large" index="i">
						<option value="#lcase(i)#"<cfif i eq feed.getImageSize()> selected</cfif>>#I#</option>
					</cfloop>

					<cfset imageSizes=application.settingsManager.getSite(rc.siteid).getCustomImageSizeIterator()>

					<cfloop condition="imageSizes.hasNext()">
						<cfset image=imageSizes.next()>
						<option value="#lcase(image.getName())#"<cfif image.getName() eq feed.getImageSize()> selected</cfif>>#esapiEncode('html',image.getName())#</option>
					</cfloop>
						<option value="custom"<cfif "custom" eq feed.getImageSize()> selected</cfif>>Custom</option>
				</select>
			</div>

			<div id="feedCustomImageOptions" class=""<cfif feed.getImageSize() neq "custom"> style="display:none"</cfif>>
				<div class="mura-control-group half">			
					<label>#application.rbFactory.getKeyValue(session.rb,'collections.imagewidth')#</label>
					<input class="objectParam" name="imageWidth" data-displayobjectparam="imageWidth" type="text" value="#feed.getImageWidth()#" />
				</div>
				<div class="mura-control-group half">			
					<label>#application.rbFactory.getKeyValue(session.rb,'collections.imageheight')#</label>
					<input class="objectParam" name="imageHeight" data-displayobjectparam="imageHeight" type="text" value="#feed.getImageHeight()#" />
				</div>
			</div>

			<div class="mura-control-group">
				<label>#application.rbFactory.getKeyValue(session.rb,'collections.displayname')#</label>
				<label class="radio inline">
				<input name="displayName" data-displayobjectparam="displayName" type="radio" value="1" class="objectParam radio" onchange="jQuery('##altNameContainer').toggle();"<cfif feed.getDisplayName()>checked</cfif>>
					#application.rbFactory.getKeyValue(session.rb,'collections.yes')#
				</label>
				<label class="radio inline">
				<input name="displayName" data-displayobjectparam="displayName" type="radio" value="0" class="objectParam radio" onchange="jQuery('##altNameContainer').toggle();" <cfif not feed.getDisplayName()>checked</cfif>>
				#application.rbFactory.getKeyValue(session.rb,'collections.no')#
				</label>
			</div>
			<div id="altNameContainer" class="mura-control-group"<cfif NOT feed.getDisplayName()> style="display:none;"</cfif>>
				<label>#application.rbFactory.getKeyValue(session.rb,'collections.altname')#</label>
				<input class="objectParam" name="altName" data-displayobjectparam="altName" type="text" value="#esapiEncode('html_attr',feed.getAltName())#" maxlength="250">
			</div>

			<div class="mura-control-group">
				<label>
					#application.rbFactory.getKeyValue(session.rb,'collections.cssclass')#
				</label>
				<input name="cssclass" class="objectParam" type="text" value="#esapiEncode('html_attr',feed.getCssClass())#" maxlength="255">
			</div>

			<div class="mura-control-group">
				<label>
					#application.rbFactory.getKeyValue(session.rb,'collections.viewalllink')#
				</label>
				<input name="viewalllink" class="objectParam" type="text" value="#esapiEncode('html_attr',feed.getViewAllLink())#" maxlength="255">
				<label>
					#application.rbFactory.getKeyValue(session.rb,'collections.viewalllabel')#
				</label>
				<input name="viewalllabel" class="objectParam" type="text" value="#esapiEncode('html_attr',feed.getViewAllLabel())#" maxlength="100">
			</div>

			<div class="mura-control-group">
				<label>#application.rbFactory.getKeyValue(session.rb,'collections.maxitems')#</label>
					<select name="maxItems" data-displayobjectparam="maxItems" class="objectParam">
					<cfloop list="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,25,50,100" index="m">
					<option value="#m#" <cfif feed.getMaxItems() eq m>selected</cfif>>#m#</option>
					</cfloop>
					<option value="100000" <cfif feed.getMaxItems() eq 100000>selected</cfif>>All</option>
				</select>
			    <label>#application.rbFactory.getKeyValue(session.rb,'collections.itemsperpage')#</label>
				<select name="nextN" data-displayobjectparam="nextN" class="objectParam">
					<cfloop list="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,25,50,100" index="r">
					<option value="#r#" <cfif r eq feed.getNextN()>selected</cfif>>#r#</option>
					</cfloop>
					<option value="100000" <cfif feed.getNextN() eq 100000>selected</cfif>>All</option>
				</select>
			</div>
			<div class="mura-control-group" id="availableFields">
				<label>
					<span class="half">Available Fields</span> <span class="half">Selected Fields</span>
				</label>
				<div id="sortableFields">
					<p class="dragMsg">
						<span class="dragFrom half">Drag Fields from Here&hellip;</span><span class="half">&hellip;and Drop Them Here.</span>
					</p>

					<cfset displayList=feed.getDisplayList()>
					<cfset availableList=feed.getAvailableDisplayList()>
					<div class="half">
						<ul id="availableListSort" class="displayListSortOptions">
							<cfloop list="#availableList#" index="i">
								<li class="ui-state-default">#trim(i)#</li>
							</cfloop>
						</ul>
					</div>
					<div class="half">
						<ul id="displayListSort" class="displayListSortOptions">
							<cfloop list="#displayList#" index="i">
								<li class="ui-state-highlight">#trim(i)#</li>
							</cfloop>
						</ul>
					</div>

					<input type="hidden" id="displayList" class="objectParam" value="#displayList#" name="displayList"  data-displayobjectparam="displayList"/>
				</div>
			</div>
		</div>
	<cfelse>
		<div class="mura-layout-row">
			<div class="mura-control-group">
			<cfset displaySummaries=yesNoFormat(feed.getValue("displaySummaries"))>
				<label>
					#application.rbFactory.getKeyValue(session.rb,'collections.displaysummaries')#
				</label>
				<label class="radio inline">
					<input name="displaySummaries" type="radio" value="1" class="objectParam radio" onchange="jQuery('##altNameContainer').toggle();"<cfif displaySummaries>checked</cfif>>
					#application.rbFactory.getKeyValue(session.rb,'collections.yes')#
				</label>
				<label class="radio inline">
					<input name="displaySummaries" type="radio" value="0" class="objectParam radio" onchange="jQuery('##altNameContainer').toggle();" <cfif not displaySummaries>checked</cfif>>
					#application.rbFactory.getKeyValue(session.rb,'collections.no')#
				</label>
			</div>
			<div class="mura-control-group">
				<label>
					#application.rbFactory.getKeyValue(session.rb,'collections.viewalllink')#
				</label>
				<input name="viewalllink" class="objectParam" type="text" value="#esapiEncode('html_attr',feed.getViewAllLink())#" maxlength="255">
				<label>
					#application.rbFactory.getKeyValue(session.rb,'collections.viewalllabel')#
				</label>
				<input name="viewalllabel" class="objectParam" type="text" value="#esapiEncode('html_attr',feed.getViewAllLabel())#" maxlength="100">
			</div>
		</div>
	</cfif>
</div> <!-- /availableObjectParams -->
</cfoutput>
</cfsavecontent>
<cfset data.type=feed.getType()>
<cfoutput>#createObject("component","mura.json").encode(data)#</cfoutput>
<cfabort>
