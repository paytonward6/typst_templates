#let conf(
    title: none,
    authors: (),
    date: none,
    margin: 1in,
    font: "Times New Roman",
    font_size: 12pt,
    line_spacing: "double",
    doc
) = {

    set page(
        paper: "us-letter",
        margin: (
            top: margin,
            bottom: margin,
            right: margin,
            left: margin
        )
    )

    set text(
        size: font_size,
        font: font
    )

    let line_spacing_options = (
        double: 1em,
        single: 0.65em
    )

    set document(author: authors, title: title)

    set par(
        leading: line_spacing_options.at(line_spacing)
    )

    align(center)[
        #block(text(weight: 700, 1.75em, title))
        #v(1em, weak: true)
        #date
    ]

    // Author information.
    pad(
        top: 0.5em,
        bottom: 0.5em,
        x: 2em,
        grid(
            columns: (1fr,) * calc.min(3, authors.len()),
            gutter: 1em,
            ..authors.map(author => align(center, text(1.3em, author))),
        ),
    )

    doc
}

#let indent = [
    /*
        Defines a 4 space indent
            3 spaces used to define the indent since the space
            after calling `#indent` will appear in the text:
                #indent Text post indent
            Will yield:
                "    Text post indent"
    */
    #raw("   ")
]
