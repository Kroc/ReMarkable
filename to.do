1.0 Goals:
============================================================================================================================
•	Finalise feature set
•	Unit tests for everything
•	Finalise documentation CSS
•	Finalise documentation
•	Some sort of error detection / throwing
	(if something non-blank goes in, and blank comes out, return null?)


Fixes:
============================================================================================================================
•	BUG: A bullet list followed immediately by a number list combines into one.
	Need to detect type of list, and stick to it

•	BUG: << / >> quotes break Blockquote?
•	“Win9x” causes a multiply sign! “0xFFFFFF” too!
•	LIs being wrapped too early?
•	Superscript within cite, and others ~ABC^TM~
•	Multi-line images / thumbnails within blockquotes is broken (requires bar break),
	images would have to be processed within the block processor instead
•	Add IDs to figures
!	Also remove HTML <pre>, <code>, <samp> blocks
	(can’t do due to race conditions created by ``<code>…</code>`` and vice-versa)

Features:
============================================================================================================================
•	Add ID to UL/OL? E.g.:

	(#id)	• (#item1)	…
		• (#item2)	…
	
•	Allow classes, similar to IDs
	
	• (.class)	…

•	Provide config options (probably an enumerable)
	-	currency middot (should be off by default)
	-	pair p tags (and other tags)
?	Superscript ordinals like *, dagger, double dagger, ¹ ² ³ &c. (Footnotes?)
?	Standalone superscript, “^1”
P3	ReMarkable auto-text (like SmartyPants). auto correct ASCII into unicode, other typographic fixes
	-	divide sign?	→ ÷
	-	Degrees?	→ 15ºC, 32ºF? Note that there’s a symbol for it too “℃/℉”
	-	#No.?		→ №
	-	Keyboard icons	→ ⌘, ⌥, ⌃, ⇧, ↩, ⌅,  ⌫, ⎋, ␣ &c. (use <kbd>)
	-	Currencies	→ ¥, £ (not on USA keyboard), &c.
	-	Currency middot	→ £12·34 (would have to be optional)
P4	Markup for footnotes?
P4	Markup for Audio / Video (Video for Everybody?)
P4	Predefining common abbreviations? (&c.|et cetera)
