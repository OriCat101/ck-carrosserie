<cfoutput>
	<!DOCTYPE html>
	<html lang="de"<cfif $.hasFETools()> class="mura-edit-mode"</cfif>>
	<head>
		<!-- Start cookieyes banner -->
		<script id="cookieyes" type="text/javascript" src="https://cdn-cookieyes.com/client_data/e759cd0d48864fe24e4e6930/script.js"></script>
		<!-- End cookieyes banner -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0", maximum-scale=1.0__/>
		<meta name="description" content="#esapiEncode('html_attr', $.content('metaDesc'))#">
		<meta name="keywords" content="#esapiEncode('html_attr', $.content('metaKeywords'))#">
		<cfif len($.content('credits'))><meta name="author" content="#esapiEncode('html_attr', $.content('credits'))#"></cfif>
		<cfif YesNoFormat($.content('searchExclude'))><meta name="robots" content="noindex"></cfif>
			
		<title>#esapiEncode('html', $.content('HTMLTitle'))# - #esapiEncode('html', $.siteConfig('site'))#</title>
	
		<!--- Masa CMS Base Styles--->
		<!--- Optional: Masa CMS Skin Styles. Duplicate to your theme to customize, changing 'assetPath' to 'themeAssetPath' below. Don't forget to move, remove or replace sprite.png. --->
		#$.outputMuraCSS(version="7.1", includeskin=true)#			
		
		<!--- CSS --->
		<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/assets/css/styles.min.css">
		<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/assets/css/styles.css">
		<!--- google fonts --->


		<!--- Fontawesome --->
		<script src="#m.siteConfig('themeAssetPath')#/js/kit.fontawesome_1b2f4a737c.js"></script>

		<!--- JQuery --->
		<script src="#m.siteConfig('themeAssetPath')#/js/jquery_3-7-0.min.js"></script>

		<!--- JS --->
		<script src="#m.siteConfig('themeAssetPath')#/js/site.js"></script>

		<!--- FAV AND TOUCH ICONS --->
		<link rel="apple-touch-icon" sizes="180x180" href="#m.siteConfig('themeAssetPath')#/images/favicons/apple-touch-icon.png">
		<link rel="icon" type="image/png" sizes="32x32" href="#m.siteConfig('themeAssetPath')#/images/favicons/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="16x16" href="#m.siteConfig('themeAssetPath')#/images/favicons/favicon-16x16.png">
		<link rel="manifest" href="#m.siteConfig('themeAssetPath')#/images/favicons/site.webmanifest">
		<link rel="mask-icon" href="#m.siteConfig('themeAssetPath')#/images/favicons/safari-pinned-tab.svg" color="##5bbad5">
		<link rel="shortcut icon" href="#m.siteConfig('themeAssetPath')#/images/favicons/favicon.ico">
		<meta name="msapplication-TileColor" content="##da532c">
		<meta name="msapplication-config" content="#m.siteConfig('themeAssetPath')#/images/favicons/browserconfig.xml">
		<meta name="theme-color" content="##ffffff">

		<!--- Masa CMS FEEDS --->
		<cfset rs=$.getBean('feedManager').getFeeds($.event('siteID'),'Local',true,true) />
		<cfset apiEndpoint=$.siteConfig().getApi('feed','v1').getEndpoint() />
		<cfloop query="rs"><link rel="alternate" type="application/rss+xml" title="#esapiEncode('html_attr', $.siteConfig('site'))# - #esapiEncode('html_attr', rs.name)#" href="#XMLFormat('#apiEndpoint#/?feedID=#rs.feedID#')#"></cfloop>
	</head>
	<body id="#$.getTopID()#" class="depth-#$.content('depth')# #$.createCSSHook($.content('menuTitle'))#">
		<div id="body">
			<cfinclude template="navbar.cfm" />
			<div id="content">
</cfoutput>
	