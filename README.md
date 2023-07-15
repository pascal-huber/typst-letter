# typst l<sub>e</sub>tt<sub>e</sub>r

A customizable Typst letter template with some presets for DIN 5008 A/B and
Swiss C5 Letter.

Please note that the template is still under development and subject to breaking
changes. 

![preview](./preview.png)

# Letter Structure

A letter should have the following form.

```
#import "../template.typ": *
#show: lttr_init.with(
    format: "DIN-5008-B",
    title: "Writing Letters in Typst is Easy",
    opening: "Dear Sir, Madam or Mother,",
    ...
)

#show: lttr_preamble

Your letter content.

#show: lttr_closing
```

 - `lttr_init` is responsible to compute all values from the parameters and
   default values for different formats. It also sets the `page` and `text`
   attributes.
 - `lttr_preamble` renders `lttr_sender`, `lttr_receiver`,
    `lttr_indicator_lines`, `lttr_content_offset`, `lttr_date_place`,
    `lttr_title` and `lttr_opening`. You can also call them seperately.
 - `lttr_closing` renders the closing line and the signature.
 
# Init Parameters

All Parameters except for `format` are optional. If not set, either a default
value for your format will be used. If a content value is not set, the content
will simply not be rendered. The following is the top level structure of the
parameter dictionary.

 - `debug` [Bool] (default=false)  
   Whether or not to show the debug lines.
 - `format` [String] (default="custom")
   Format of the letter ("DIN-5008-A", "DIN-5008-B", "C5-WINDOW-RIGHT", "custom").
 - `_page` [Dict] (default=(:))  
   Overwrite page settings ([docs](https://typst.app/docs/reference/layout/page/)).
 - `_text` [Dict, none] (default=(:))  
   Overwrite text settings ([docs](https://typst.app/docs/reference/text/text/)).
 - `settings` [Dict, none]  
   Basic settings ([see below](#settings)).
 - `sender` [Dict, none]  
   Info to render the sender fields ([see below](#sender)).
 - `receiver` [Dict, none]   
   Info to render the receive fields ([see below](#receiver)).
 - `date_place` [Dict, String, none]   
   Info to render the `date_place` template ([see below](#date-place)).
 - `title` [Dict, String, none]   
   Info to render the `title` template ([see below](#title)). Also set as document property.
 - `author` [String, Array, none]   
   Author(s) of the letter in the document properties. If not specified, `signature` is used.
 - `opening` [Dict, String, none]   
   Info to render the `title` template ([see below](#opening)).
 - `closing` [Dict, String, none]   
   Info to render the closing ([see below](#closing)).
 - `signature` [Dict, none]   
   Info to render the signature ([see below](#signature)).
 - `indicator_lines` [Dict, none]   
   Info to render lines for the hole puncher and folding ([see below](#indicator-lines)).

## Settings

 - `min_content_spacing` [Length]  
   Minimum space between top margin and beginning of the letter content.
 - `content_spacing` [Length]  
   Minimum spacing between sender/receiver and letter content.
 - `justify_content` [Bool]  
   Wheter or not to justify the content.

Example:

```
settings: (
  min_content_spacing: 100mm, // TODO: find a good value for min_content_spacing
  content_spacing: 8.46mm, // NOTE: DIN 5008 but okay for all 
  justify_content: true,
),
```

## Sender

 - `content` [Array, Content] (default: none)  
   Content or array of lines for the sender field. 
 - `position` [Dict] (default: none)  
   Position of the sender field.
 - `width` [Length]  
   Width of the sender field.

Example:
```
sender: (
  content: (
    "John Doe",
    "Somestreet 15",
    "1234 New York",
  )
  position: (left: 110mm, top: 20mm),
  width: 80mm,
),
```

## Receiver

 - `return_to_position` [Dict]  
   Position of the return_to field (`top: [Length]`, `left: [Length]`) 
 - `return_to_dimensions` [Dict]  
   Dimensions of the return_to field (`width: [Length]`, `height: [Length]`)
 - `remark_zone_position` [Dict]  
   Position of the remark_zone field (`top: [Length]`, `left: [Length]`) 
 - `remark_zone_dimensions` [Dict]  
   Dimensions of the remark_zone field (`width: [Length]`, `height: [Length]`)
 - `address_position` [Dict]  
   Position of the address field (`top: [Length]`, `left: [Length]`) 
 - `address_dimensions` [Dict]  
   Dimensions of the address field (`width: [Length]`, `height: [Length]`)
 - `remark_zone_align` [Align]  
   Alignment of the remark_zone.
 - `return_to` [Content, String]  
   Content of the return_to field.
 - `remark_zone` [Content, String]  
   Content of the remark_zone field.
 - `address` [Array]  
   Content of the receiver field.

Note that DIN 5008 B has a combined field for `return_to` and `remark_zone`. If
`return_to` is not none, it will be rendered at the end of the `remark_zone` (as
in the following example.).

Example:
```
receiver: (
  return_to: {text("some address...")},
  remark_zone_align: bottom,
  address: (
    "Peter Doe",
    "Somestreet 16",
    "1234 New York",
  ),
),
```


## Date Place

 - `date` [Content]  
   Date of the letter.
 - `place` [Content]  
   Place of the letter.
 - `align` [Align]  
   Alignment of the place and date

Example:
``` 
date_place: (
  date: "20.04.2023",
  place: "Weitfortistan",
  align: left,
),
``` 
   
## Title

 - `spacing` [Length]  
   Spacing before the title.
 - `content` [String]  
   Content of the title.

Example:
```
title: (
  spacing: 2mm,
  content: "Writing Letters in Typst is Easy",
)
```

## Opening

 - `spacing` [Length]  
   Spacing before the letter opening.
 - `content` [Content]  
   Content of the opening (e.g. "Dear Sir....").

Example:
```
opening: (
  spacing: 2mm,
  content: "Dear Sir or Madam,",
)
```

## Closing

 - `spacing` [Length]  
   Spacing before the closing.
 - `content` [Content]  
   Content of the closing (e.g. "kind regards").

Example:
```
closing: (
  spacing: 2mm,
  content: "kind regards",
)
```

## Signature

 - `spacing` [Length]  
   Spacing before the signature.
 - `content` [Content]  
   Content of the signature

Example:
```
signature: (
  spacing: 2mm,
  content: "Peter Pan",
)
```

## Indicator Lines

 - `show_puncher_mark` [Bool]  
   Wheter or not to show the puncher mark.
 - `fold_marks` [Array]  
   Lenghts from top of page of the fold marks. Note that `fold_marks: (1cm)` is invalid as `(1cm)` has type length use `fold_marks: (1cm,)` instead.

Example:
```
indicator_lines: (
  show_puncher_mark: true,
  fold_marks: (2cm,)
)
```

# Other remarks

 - `lttr_state` prints the entire state used to render the components.

# Resources

 - [DIN 5008 Form A](https://de.wikipedia.org/wiki/DIN_5008#/media/Datei:DIN_5008,_Form_A.svg)
 - [DIN 5008 Form B](https://de.wikipedia.org/wiki/DIN_5008#/media/Datei:DIN_5008_Form_B.svg)
 - [Swiss
   Addressing](https://www.post.ch/-/media/portal-opp/pm/dokumente/briefe-spezifikation-gestaltung.pdf?sc_lang=de&hash=BB181E74C5D3A0D1D49A954793EA670A)

# Similar Projects

 - [dvdvgt/typst-letter](https://github.com/dvdvgt/typst-letter): A typst
   template for a DIN 5008 inspired letter with the goal to fit nicely into C6/5
   envelops.
 - [qjcq/awesome-typst](https://github.com/qjcg/awesome-typst): Awesome Typst
   Links 


# Test setup

  mkdir -p ${XDG_DATA_HOME}/typst/local
  ln -s path/to/this/repo ${XDG_DATA_HOME}/typst/local/lttr-0.1.0

# TODO

There are a couple of limitations in typst which I hope will be addressed.

 - [ ] there is currently no way to query properties set with `set`. This would
   be nice to query the document title and author names
   [issue](https://github.com/typst/typst/issues/763). Forthermore, it is not
   possible to call `set` after the first lttr function has been called (even if
   no content was rendered added). 
 - [ ] datetime with locales settings
