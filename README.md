Charlie 
=======

Charlie is a digital butler for the NUS Hackers. This document contains
installation instructions, and will be updated concurrently with development.

Installation
------------
The normal Rails rules apply: pull the repository and run bundle. Charlie is set up to run with spork, guard and RSpec. 

Commands (Case insensitive)
--------

By default, there can be either emails directed to Charlie, with the subject lines formatted from among the following---

Format spec for the subject line

[full form]
| Charlie {Action} {Object} [flags]
| Charlie help!
| Charlie ping

[power notation]
<!-- !{action} {object} {[-u unix command to filter through]}* -->
!{action} {object}

Else, Charlie can be included(/cc'ed) into a conversation, and under such a condition it will only scan the first line of the body by default. The first line will need to trigger the parser into processing the full body, which will otherwise by ignored.

First Line: /^.charlie.\(Command\)$/i
, where the Command refers to the syntax specified under the Directed commands section.


[(Object, Action)]

(Report, {Get, Retrieve}) -s, --summary
(Draft, {Send, Aye, Nay})

TODO::Inline commands which will be replaced by their output

This document is still a work in progress.
