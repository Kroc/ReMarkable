#!/usr/bin/php
<?php
#===========================================================================================================================
# Test ReMarkable
#===========================================================================================================================
include "remarkable.php";

header ('Content-type: text/plain');

echo "* Running Tests:\n";
echo "-------------------------------------------------------------------------------\n";

$units = array (
/* ======================================================================================================================
   paragraphs
   ====================================================================================================================== */
'1.0 Single Paragraph' => array (
//a single line of text with no leading or trailing space should create one paragraph
<<<REM
The quick brown fox.
REM
=> <<<HTML
<p>
	The quick brown fox.
</p>
HTML
),
/* ---------------------------------------------------------------------------------------------------------------------- */
'1.1 Multiple Paragraphs' => array (
//single line breaks should create multiple paragraphs, with the HTML tags paired
<<<REM
The quick brown fox.

Jumps over the lazy dog.
REM
=> <<<HTML
<p>
	The quick brown fox.
</p><p>
	Jumps over the lazy dog.
</p>
HTML
),
/* ---------------------------------------------------------------------------------------------------------------------- */
'1.2 Multiple Blank Lines' => array (
//the use of multiple blank lines between paragraphs should not matter
<<<REM
Lorem ipsum dolor sit amet.


Consectetur adipisicing elit.



Ut enim ad minim veniam.
REM
=> <<<HTML
<p>
	Lorem ipsum dolor sit amet.
</p><p>
	Consectetur adipisicing elit.
</p><p>
	Ut enim ad minim veniam.
</p>
HTML
),
/* ---------------------------------------------------------------------------------------------------------------------- */
'1.3 Line-Breaks' => array (
//this tests various ways of using the line-break character
<<<REM
Lorem ipsum dolor sit amet, consectetur adipisicing elit,¬
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
¬¬
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
¬nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in ¬
reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla¬
pariatur.¬
¬
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui¬ 
officia deserunt mollit anim id est laborum.
REM
=> <<<HTML
<p>
	Lorem ipsum dolor sit amet, consectetur adipisicing elit,<br />
	sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
	<br /><br />
	Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
	<br />nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in <br />
	reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla<br />
	pariatur.<br />
	<br />
	Excepteur sint occaecat cupidatat non proident, sunt in culpa qui<br /> 
	officia deserunt mollit anim id est laborum.
</p>
HTML
),
/* ======================================================================================================================
   headings
   ====================================================================================================================== */
'2.0 Individual Heading (atx style)' => array (
//sometimes the article title will come from a separate database field for example, and be processed as a single line
//this should return no leading or trailing space
<<<REM
# Title #
REM
=> <<<HTML
<h1>Title</h1>
HTML
),
/* ---------------------------------------------------------------------------------------------------------------------- */
'2.1 Heading Auto Title-casing' => array (
//headings are automatically title-cased. test sentances from <individed.com/code/to-title-case/tests.html>
<<<REM
# For step-by-step directions email someone@gmail.com #
# 2lmc Spool: ‘Gruber on OmniFocus and Vapo(u)rware’ #
# Have you read “The Lottery”? #
# your hair[cut] looks (nice) #
# People probably won’t put http://foo.com/bar/ in titles #
# Scott Moritz _and_ TheStreet.com’s million iPhone la‑la land #
# BlackBerry vs. iPhone #
# Notes and observations regarding Apple’s announcements from ‘The Beat Goes On’ special event #
# Read markdown_rules.txt to find out how _underscores around words_ will be interpretted #
# Q&A with Steve Jobs: ‘That’s what happens in technology’ #
# What is AT&T’s problem? #
# Apple deal with AT&T falls through #
# this v that #
# this vs that #
# this v. that #
# this vs. that #
# The SEC’s Apple probe: what you need to know #
# ‘by the way, small word at the start but within quotes.’ #
# Small word at end is nothing to be afraid of #
# Starting sub-phrase with a small word: a trick, perhaps? #
# Sub-phrase with a small word in quotes: ‘a trick, perhaps?’ #
# Sub-phrase with a small word in quotes: “a trick, perhaps?” #
# “Nothing to Be Afraid of?” #
# “Nothing to Be Afraid Of?” #
# a thing #
# åeiou aéiou aeïou aeiöu aeioü #
# year one—an overview — in part #
# Words after colons should be: in title-case #
REM
=> <<<HTML
<h1>For Step-by-Step Directions Email someone@gmail.com</h1>
<h1>2lmc Spool: ‘Gruber on OmniFocus and Vapo(u)rware’</h1>
<h1>Have You Read “The Lottery”?</h1>
<h1>Your Hair<ins>cut</ins> Looks (Nice)</h1>
<h1>People Probably Won’t Put http://foo.com/bar/ in Titles</h1>
<h1>Scott Moritz <em>and</em> TheStreet.com’s Million iPhone La‑La Land</h1>
<h1>BlackBerry vs. iPhone</h1>
<h1>Notes and Observations Regarding Apple’s Announcements From ‘The Beat Goes On’ Special Event</h1>
<h1>Read markdown_rules.txt to Find Out How <em>Underscores Around Words</em> Will Be Interpretted</h1>
<h1>Q&amp;A With Steve Jobs: ‘That’s What Happens in Technology’</h1>
<h1>What Is AT&amp;T’s Problem?</h1>
<h1>Apple Deal With AT&amp;T Falls Through</h1>
<h1>This v That</h1>
<h1>This vs That</h1>
<h1>This v. That</h1>
<h1>This vs. That</h1>
<h1>The SEC’s Apple Probe: What You Need to Know</h1>
<h1>‘By the Way, Small Word at the Start but Within Quotes.’</h1>
<h1>Small Word at End Is Nothing to Be Afraid Of</h1>
<h1>Starting Sub-Phrase With a Small Word: A Trick, Perhaps?</h1>
<h1>Sub-Phrase With a Small Word in Quotes: ‘A Trick, Perhaps?’</h1>
<h1>Sub-Phrase With a Small Word in Quotes: “A Trick, Perhaps?”</h1>
<h1>“Nothing to Be Afraid Of?”</h1>
<h1>“Nothing to Be Afraid Of?”</h1>
<h1>A Thing</h1>
<h1>Åeiou Aéiou Aeïou Aeiöu Aeioü</h1>
<h1>Year One—An Overview — In Part</h1>
<h1>Words After Colons Should Be: In Title-Case</h1>
HTML
),
/* ---------------------------------------------------------------------------------------------------------------------- */
'2.2 Consecutive Headings' => array (
//tests all headings in order. H2 will have two blank lines before, H3 should, but won’t when immediately after H2
<<<REM
# Title 1 #
## Title 2 ##
### Title 3 ###
#### Title 4 ####
##### Title 5 #####
###### Title 6 ######
Title 2
=======
Title 3
-------
REM
=> <<<HTML
<h1>Title 1</h1>


<h2>Title 2</h2>
<h3>Title 3</h3>
<h4>Title 4</h4>
<h5>Title 5</h5>
<h6>Title 6</h6>


<h2>Title 2</h2>
<h3>Title 3</h3>
HTML
),
/* ---------------------------------------------------------------------------------------------------------------------- */
'2.3 Consecutive Headings With IDs' => array (
<<<REM
# Title 1 # (#title1)
## Title 2 ## (#title2)
### Title 3 ### (#title3)
#### Title 4 #### (#title4)
##### Title 5 ##### (#title5)
###### Title 6 ###### (#title6)
Title 2 (#title-2)
==================
Title 3 (#title-3)
------------------
REM
=> <<<HTML
<h1 id="title1">Title 1</h1>


<h2 id="title2">Title 2</h2>
<h3 id="title3">Title 3</h3>
<h4 id="title4">Title 4</h4>
<h5 id="title5">Title 5</h5>
<h6 id="title6">Title 6</h6>


<h2 id="title-2">Title 2</h2>
<h3 id="title-3">Title 3</h3>
HTML
),
/* ---------------------------------------------------------------------------------------------------------------------- */
'2.4 H2 and H3 Spacing' => array (
//tests HTML tidying done by ReMarkable between headings
<<<REM
## Title 2 ##
### Title 3 ###

Lorem ipsum dolor sit amet.

## Title 2 ##

Consectetur adipisicing elit.

### Title 3 ###

Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### Title 3 ###
## Title 2 ##

Ut enim ad minim veniam.

## Title 2 ##
Title 3
-------

Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

Title 2
=======
### Title 3 ###

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

Title 2
=======
Title 3
-------

Excepteur sint occaecat cupidatat non proident.
REM
=> <<<HTML
<h2>Title 2</h2>
<h3>Title 3</h3>
<p>
	Lorem ipsum dolor sit amet.
</p>


<h2>Title 2</h2>
<p>
	Consectetur adipisicing elit.
</p>


<h3>Title 3</h3>
<p>
	Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
</p>


<h3>Title 3</h3>
<h2>Title 2</h2>
<p>
	Ut enim ad minim veniam.
</p>


<h2>Title 2</h2>
<h3>Title 3</h3>
<p>
	Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
</p>


<h2>Title 2</h2>
<h3>Title 3</h3>
<p>
	Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
</p>


<h2>Title 2</h2>
<h3>Title 3</h3>
<p>
	Excepteur sint occaecat cupidatat non proident.
</p>
HTML
),
/* ======================================================================================================================
   horizontal rule
   ====================================================================================================================== */
'3.0 Horizontal Rule' => array (
//horizontal rule posibilities
<<<REM
* * *
* * *

			* * *

* * *

REM
=> <<<HTML
<hr />


<hr />


<hr />


<hr />
HTML
),
/* ======================================================================================================================
   inline formatting
   ====================================================================================================================== */
'4.0 Italic & Bold' => array (
//various combinations of bold and italic. mismatching is not supported, don’t do it. use code spans to escape literal
//asterixes and underscores in technical names and terms. starting and ending spans across line breaks is not yet supported
<<<REM
*Whole Line*

_Whole Line_

Middle *of* sentence. Middle _of_ sentence.

With *multiple words*. With _multiple words_.

*And* *multiple* *instances*. _And_ _multiple_ _instances_.

*Inside _and_ out*. _Inside *and* out_

Dealing with *_mixed_* _*content*_.

**Overburn** __Overburn__

*	*Bullet list item*

* * *

Invalid_* word* breaks * do * not_* _ trigger *bold* or_ _italic_

watch_out for _file_names_with_underscores_.

No _multi-
line_ support *for
bold* and italics.
REM
=> <<<HTML
<p>
	<strong>Whole Line</strong>
</p><p>
	<em>Whole Line</em>
</p><p>
	Middle <strong>of</strong> sentence. Middle <em>of</em> sentence.
</p><p>
	With <strong>multiple words</strong>. With <em>multiple words</em>.
</p><p>
	<strong>And</strong> <strong>multiple</strong> <strong>instances</strong>. <em>And</em> <em>multiple</em> <em>instances</em>.
</p><p>
	<strong>Inside <em>and</em> out</strong>. <em>Inside <strong>and</strong> out</em>
</p><p>
	Dealing with <strong><em>mixed</em></strong> <em><strong>content</strong></em>.
</p><p>
	<strong>*Overburn*</strong> <em>_Overburn_</em>
</p>
<ul>
	<li><strong>Bullet list item</strong></li>
</ul>

<hr />

<p>
	Invalid_* word* breaks * do * not_* _ trigger <strong>bold</strong> or_ <em>italic</em>
</p><p>
	watch_out for <em>file_names_with_underscores</em>.
</p><p>
	No _multi-
	line_ support *for
	bold* and italics.
</p>
HTML
),
/* ---------------------------------------------------------------------------------------------------------------------- */
'4.1 Small Text' => array (
//small text can be either inline, or as a paragraph. nesting is not currently supported, nor correctly ignored either
<<<REM
((Lorem ipsum dolor sit amet)), consectetur (((adipisicing elit, sed))) do eiusmod tempor incididunt ut labore et dolore magna aliqua. ((((Ut enim ad
minim veniam)))), ((quis nostrud (exercitation) ullamco laboris)) nisi ut aliquip ex ea commodo consequat. ((Duis aute )irure dolor( in reprehenderit)) in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
REM
=> <<<HTML
<p>
	<small>Lorem ipsum dolor sit amet</small>, consectetur <small>(adipisicing elit, sed)</small> do eiusmod tempor incididunt ut labore et dolore magna aliqua. <small>((Ut enim ad
	minim veniam))</small>, <small>quis nostrud (exercitation) ullamco laboris</small> nisi ut aliquip ex ea commodo consequat. <small>Duis aute )irure dolor( in reprehenderit</small> in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</p>
HTML
),
/* ---------------------------------------------------------------------------------------------------------------------- */
'4.2 Citations' => array (
//there’s a lot that can go wrong here
<<<REM
Lorem «ipsum dolor sit amet», consectetur adipisicing elit, <<sed do eiusmod tempor>> incididunt ut labore et dolore magna aliqua. «Ut enim <ad (test)> minim» veniam, <<quis nostrud <exercitation (test)> ullamco>> laboris nisi ut aliquip ex ea commodo consequat. <<Duis <aute (test)>>> irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur s  int occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
REM
=> <<<HTML
<p>
	Lorem <q>ipsum dolor sit amet</q>, consectetur adipisicing elit, <q>sed do eiusmod tempor</q> incididunt ut labore et dolore magna aliqua. <q>Ut enim <a href="test">ad</a> minim</q> veniam, <q>quis nostrud <a href="test">exercitation</a> ullamco</q> laboris nisi ut aliquip ex ea commodo consequat. <q>Duis <a href="test">aute</a></q> irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur s  int occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</p>
HTML
)
//todo: <<<a (url)>>> (link touching quote boundary)
/* ====================================================================================================================== */
//todo: test raw HTML handling, including HTML lists and tables
);

foreach ($units as $title => &$unit) foreach ($unit as $test => $expected) {
	$result = reMarkable ($test, 0, -1);
	echo "- $title".str_repeat ("\t", 6 - (int) (strlen ("- $title") / 8));
	if (strcmp ($result, $expected) != 0) {
		echo "[fail]\n";
		echo "===[source]====================================================================\n";
		echo "$test\n";
		echo "===[expected]==================================================================\n";
		echo "$expected\n";
		echo "===[result]====================================================================\n";
		echo "$result\n";
		echo "===============================================================================\n";
		exit (1);
		
	} else {
		echo "[pass]\n";
	}
}

echo "-------------------------------------------------------------------------------\n";

?>