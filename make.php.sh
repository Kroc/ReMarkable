#!/usr/bin/php
<?php
#===========================================================================================================================
# Publish ReMarkable documentation
#===========================================================================================================================
include "remarkable.php";

echo ("* Converting documentation...\n");

file_put_contents ('documentation.html',
<<<HEAD
<!DOCTYPE html>
<head>
	<meta charset="utf-8" />
	<title>ReMarkable!</title>
	<style>
		/* kroc camen’s standard documentation CSS v1. Excuse the mess this is due to be rewritten */
		/* todo: fit to a reading-rhythm of 19px per line, and add print styling */
		
		/* === defaults ========================================================================================== */
		html {font: 12px/19px "Helvetica Neue", Helvetica, Arial, sans-serif; color:#333; background-color: #ACA;}
		body {width: 800px; text-align: justify; margin: 19px auto; padding: 0 0 19px;
		      border: 1px solid #386038; background-color: #F8F8F8;}
		
		p    {padding: 0 29px 0 29px; margin: 19px 0 0;}
		
		ol, ul {padding: 0 39px; margin: 0 0;}
		li     {padding: 0; margin: 0;}
		
		hr {margin-top: 19px; border: none; border-bottom: solid 1px #888;}
		
		/* --- headings -- */
		h1 {padding: 15px 15px 15px 15px; margin: 0px;
		    background-color: #686; border-bottom: solid 3px #386038; color: #E8F0E0; font-size: 24px;}
		h2 {padding: 10px 15px 3px 15px; margin: 25px 0 5px 0; font-size: 18px;
		    border-bottom: solid 2px #686; background-color: #E8F0E0;}
		h3 {padding: 0 15px 0 15px; margin: 25px 0 5px 0; font-size: 14px;
		    border-bottom: dotted 1px #888;}
		h4 {padding-left: 15px;}
		h1+h2, h2+h3	{margin-top: 0;}
		
		#toc	{margin: 15px; border: 1px solid; background-color: #eee; font-size: 11px; line-height: 1.1em;
			 float: right; width: 244px;}
		#toc h2 	{padding: 8px; margin: 0px; border-bottom: 3px solid #606060;
				font-size: 18px; color: #F0F0F0; background-color: #888;}
		#toc ol       {padding: 0 0 0 20px; margin: 0;}
		#toc>ol		{padding: 20px 0 20px 20px;}
		#toc ol ol    {margin-left: 0;}
		#toc li       {padding: 2px 15px 2px 0; list-style-type: none;}
		#toc ol ol li {padding: 2px 0;}
		#toc a        {text-decoration: none; color: #666; border-bottom: none;}
		#toc a:hover  {color: #222;}
		
		/* --- hyperlinks --- */
		a img        {border: 0px}
		
		/* --- lists --- */
		li {padding: 3px 30px 8px 0; color: #444; text-align: left;}
		
		dl {margin-left: 15px; margin-right: 30px;}
		dt {font-weight: bold; font-style: italic;} dt:before {content: "\BB \ ";}
		dd {margin-left: 10px; margin-bottom: 15px;}
		
		pre {margin: 19px 30px 0; padding: 5px; border: solid 1px #ddd; border-left-width: 8px;
		     font: normal 13px/15px Courier, "Courier New", monospace; color: #222; overflow: auto;
		     background-color: #eee;}
		
		code {color: 222; background-color: #eee; padding: 0 2px 0 2px;}
		pre code {padding: 0;}
	</style>
</head><body>
<!-- =================================================================================================================== -->

HEAD
	.reMarkable (file_get_contents('documentation.rem'), 0, 124, ".", REMARKABLE_NOXHTML || REMARKABLE_TABSPACE_4).
<<<FOOT

<!-- =================================================================================================================== -->
</body>
FOOT
	);
?>