 # Vim

` {operator}{count}{motion}`

## Operators
|Operator|Action|
|---|---|
|c|change|
|d|delete|
|y|yank into register (does not change the text)|
|~|swap case (only if 'tildeop' is set)|
|g~|swap case|
|gu|make lowercase|
|gU|make uppercase|
|!|filter through an external program|
|=|filter through 'equalprg' or C-indenting if empty|
|gq|text formatting|
|g?|ROT13 encoding|
|>|shift right|
|<|shift left|
|zf|define a fold|
|g@|call function set with the 'operatorfunc' option|