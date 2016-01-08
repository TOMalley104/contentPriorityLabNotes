##Content Sizing Priorities

4 content priorities 

- 2 types— hugging vs. compression resistance.
- “Each one has a horizontal and vertical, giving us a total of 4 priorities per view.”

**In short:**

- Hugging prevents stuff from growing beyond content (e.g. - the text of a label)
- CompressionResistance prevents stuff from shrinking beyond content (^ditto)   

------
####Compression Resistance and &gt;= Size Constraints

They can be a powerful combo for UILabel. In the case you want to allow a label to shrink but no less than 50, you would **up its CR priority and constrain width &gt;= 50**.
 
 - The CR priority provides that the label cannot be shrunk below content (text) width 
 - really nice: if the text ends up growing bigger, the label will grow with it
 - caveat here is if a view who's constraints conflict has a matching priority, the behavior is undefined; one *will* win, but for no particular reason. **Avoid equally matching priorities for views that are closely related.** (*think of a better way to say that*)

 
**But** what if content is dynamic and its width becomes &lt; 50? (eg- displaying calculated numbers or user input)

 - The width >= 50 provides that, even if the label text is narrower than 50 pts, the label will not shrink below that 


######Does this mean that Hugging and <= Size Constraints are also a combo? Investigate further.

-----

**Defaults** are usually **250 for hugging** and **750 for compression resistance** (both H & V) 

**_Interesting_:** UILabel’s content hugging is 251 by default (horizontal and vertical)
 
 - could this be related to its intrinsic content size? gotta check out other intrinsically sized views
 - this prevents it from growing larger than its content (text), perhaps meant to prevent it growing and screwing up the text alignment? 
 - no matter what way the text is aligned, left/center/right, changing its size will likely mess up its position on screen (right?)
 - apple probably wanted to give it better than low priority but not quite high (250 &lt; x &lt; 750… x = 251 works) 
 - do we include this in the reading? **is this important?**

--------

**QUESTION:** Do we explain intrinsic size in detail here? or just touch on it?

 - at this point they should probably know it since they’ve worked with labels and buttons a bunch
 - do we have any readings that explain it or is it just lectured on? think its just lectured…
 - *must have at least a basic understanding of intrinsic size* to learn these priorities; would make it more thorough.
 - intrinsic size dropdown is right below the priorities in IB, might prompt questions 

---------

Priorities can be manipulated programmatically or in storyboard:

##**Programmatically Prioritizing**

####`UILayoutPriority` (enum)
 - `UILayoutPriorityRequired`  (1000)
 - `UILayoutPriorityDefaultHigh` (750)
 - `UILayoutPriorityDefaultLow` (250)
 - `UILayoutPriorityFittingSizeLevel` (50) 
  - ^why 50? just to have an option less than the horizontal default?

####`UILayoutConstraintAxis` (enum)

 - `UILayoutConstraintAxisHorizontal`
 - `UILayoutConstraintAxisVertical`

**QUESTION:** Use the term “enum” in reading? YES — this should be considered advanced auto layout, so expect them to know enums.

####Getting a View's Priority:
- `contentCompressionResistancePriorityForAxis:`
- `contentHuggingPriorityForAxis:`

Both methods take a `UILayoutConstraintAxis` and return a `UILayoutPriority`.

####Setting a View's Priority 
- setCompressionResistancePriority:forAxis
- setContentHuggingPriority:forAxis

Both methods take a `UILayoutPriority` and `UILayoutConstraintAxis`.

##Priorities via Storyboard

####Checking / Setting

- must first select that view in IB
- at the bottom of “Size Inspector” (little ruler tab of Utilities pane where constraints are listed)
- can be typed in / specified to any number
- also has dropdown for standard values (250,750,100)

*Include a screen shot of where they are and how to get there.*