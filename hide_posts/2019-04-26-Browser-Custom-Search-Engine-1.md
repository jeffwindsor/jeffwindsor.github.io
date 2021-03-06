---
author: Jeff Windsor
when: 2019-03-27
title: Browser Custom Search Engines part 1
tags:
- browser
- chrome
- brave
- edge
- vivaldi
- code-faster
partialCount: 4
---

## TL;DR

You can initiate a site specific search directly from your address bar just by typing the keyword for any defined custom search engine.  Simply add a search engine keyword, url and name to your settings, then `keyword` + <kbd>Spacebar</kbd> + `search terms` away.

## Instructions for Chrome Based Browsers

Chrome, Chromium, Brave, Vivaldi, Edge, etc..

* Use:
    * Type in the address bar: `keyword` +  <kbd>Spacebar</kbd> + `any query text you want` + <kbd>Enter</kbd>
* Add:
    * `Browser > Hamburger Menu > Settings > Manage Search Engines > Add`
* Edit:
    * `Browser > Hamburger Menu > Settings > Manage Search Engines > row's (...)`
* Custom Search Engine Syntax:
    * `Search Engine` = Name
    * `Keyword` = letters to initiate search in address bar
    * `Url` = url of search engine with `%s` in place of user input

### Examples

Name | Keyword | Url
:--- | :------ | :--
Amazon | a | `http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s&x=0&y=0`
DuckDuckGo | d | `https://duckduckgo.com/?q=%s`
Github | gh | `https://github.com/search?q=%s&ref=opensearch`
GitHub Gist | gg | `https://gist.github.com/search?q=%s&ref=opensearch`
GitHub Issues | ghi | `https://github.com/issues?utf8=✓&q=is%3Aopen+is%3Aissue+label%3A%22help+wanted%22++%s`
GitLab | gl | `https://gitlab.com/search?search=%s`
Google | g | `https://www.google.com/search?q=%s`
Google Drive | gd | `https://drive.google.com/drive/search?q=%s`
Google Image Search | gi | `https://www.google.com/search?tbm=isch&q=%s`
Hackage | hg | `http://hackage.haskell.org/packages/search?terms=%s`
Hoogle | h | `https://www.haskell.org/hoogle/?hoogle=%s`
Stack Exchange | se | `http://skeptics.stackexchange.com/search?q=%s`
Stack Overflow | st | `http://stackoverflow.com/search?q=%s`
Translate English to Spanish | es | `http://translate.google.com/#en%7Ces%7C%s%0A`
Translate Spanish to English | se | `http://translate.google.com/#es%7Cen%7C%s%0A`
Wikipedia | w | `http://en.wikipedia.org/w/index.php?title=Special:Search&search=%s`
Wiktionary | wk | `http://en.wiktionary.org/wiki/Special:Search?search=%s&go=Go`
Wolfram Alpha | wa | `http://www.wolframalpha.com/input/?i=%s`
Youtube | y | `http://www.youtube.com/results?search_query=%s&page={startPage?}&utm_source=opensearch`

#### Custom Domain

Name | Keyword | Url
:--- | :------ | :--
Git Lab | -gl | `http://<domain>/search?utf8=%E2%9C%93&search=%s&group_id=&repository_ref=`
Jira | -j | `https://<domain>/secure/QuickSearch.jspa?searchString=CJPM-%s`
EtherPad | -p | `http://<domain>/%s`

Note: For any custom domain installs I prepend mine with a `-` keep the same acronyms as public sites.
