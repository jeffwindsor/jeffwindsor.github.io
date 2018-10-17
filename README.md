[Home](https://jeffwindsor.carrd.co/) > Github.io

[[ Github Overview ](https://jeffwindsor.github.io/resumes)] [[ Projects ](https://jeffwindsor.github.io/projects)] [[ Resumes ](https://jeffwindsor.github.io/resumes)]

# Awesome List (Personal)

An awesome list is a list of awesome things curated by me.  Modeled after, but not completely adherent to the [Awesome Lists](https://github.com/topics/awesome) and [Awesomo Lists](https://github.com/lk-geimfari/awesomo).

## Personal, Career and Presence

* [Resume in JSON](https://jsonresume.org/getting-started)
* [FontAwesome](https://fontawesome.com)
* [OSS Licensing Explained](https://choosealicense.com)
* [Unfurling](https://medium.com/slack-developer-blog/everything-you-ever-wanted-to-know-about-unfurling-but-were-afraid-to-ask-or-how-to-make-your-e64b4bb9254)

## Productivity

* [The Sweet Setup](https://jeffwindsor.github.io/the-sweet-setup.io/)
* [Chrome Custom Search Engines](https://github.com/daturkel/custom-search-engines)
* [Markdown Cheat Sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#images)

## Git

* **Github close issue with commit message** - add `fix`, `close`, or `resolve` plus ` #{id}` in the comment.  ie `-m "Wrong.cs class deleted to fix #1452"`

## Tools

* [iTerm2](https://iterm2.com) for macOS with [Themes](https://github.com/mbadolato/iTerm2-Color-Schemes)
* [Fish Shell](https://fishshell.com/docs/current/index.html)

## Learning

* [Top Down Design and Test First at CJ](https://www.youtube.com/channel/UC2OoWaGVtOgOM4he75rFuWg/videos)
* [Lambda Conf Videos](https://www.youtube.com/channel/UCEtohQeDqMSebi2yvLMUItg)

## Mac
1. Open a terminal. You can access it from the Launchpad.
2. Type the following commands (and press Enter after each line):
  ```sh
  cd ~/Library
  mkdir KeyBindings
  cd KeyBindings
  nano DefaultKeyBinding.dict
  What the above commands do is create a new “KeyBindings” folder in the “Library” folder and add a new “DefaultKeyBinding.dict” file.
  ```
3. In the text editor that opens, copy and paste the following commands to it:
```sh
{
  /* Remap Home / End keys */
  /* Home Button*/
  "\UF729" = "moveToBeginningOfLine:";
  /* End Button */
  "\UF72B" = "moveToEndOfLine:";
  /* Shift + Home Button */
  "$\UF729" = "moveToBeginningOfLineAndModifySelection:";
  /* Shift + End Button */
  "$\UF72B" = "moveToEndOfLineAndModifySelection:";
  /* Ctrl + Home Button */
  "^\UF729" = "moveToBeginningOfDocument:";
  /* Ctrl + End Button */
  "^\UF72B" = "moveToEndOfDocument:";
  /* Shift + Ctrl + Home Button */
  "$^\UF729" = "moveToBeginningOfDocumentAndModifySelection:";
  /* Shift + Ctrl + End Button*/
  "$^\UF72B" = "moveToEndOfDocumentAndModifySelection:";
}
Save (using shortcut “Ctrl + o”) and exit (“Ctrl + x”) the file.
```
4. Restart your Mac. The “Home” and “End” should be working now, and you can use it in conjunction with the “Shift” and “Ctrl” modifier buttons.


### Humor

* [Monty Python's Flying Circus - World's Funniest Joke](https://www.youtube.com/watch?v=ienp4J3pW7U)
* [Light Grenade](https://www.youtube.com/watch?v=dCeD2gF9jUo)
* [Monty Python The Holy Grail - The killer bunny](https://www.youtube.com/watch?v=tgj3nZWtOfA)
