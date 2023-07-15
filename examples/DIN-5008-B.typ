#import "@preview/lttr:0.1.0": *
#show : lttr_init.with(
    format: "DIN-5008-B",
    title: "Writing Letters in Typst is Easy",
    opening: "Dear Sir, Madam or Mother,",
    closing: "Peace, I'm out",
    signature: "Hansli",
    author: none,
    date_place: (
        date: "20.04.2023",
        place: "Weitfortistan",
    ),
    receiver: (
        return_to: "Banana AG · Sesamstrasse 15 · 1234 Einestadt",
        address: (
            "Peter Empfänger",
            "Bahnhofsstrasse 16",
            "1234 Nochvielweiterwegstadt",
        ),
    ),
    sender: {
        image("logo.png", width: 100%, fit: "contain")
        h(2mm)
        text("Hanspeter Müller")
        linebreak()
        h(2mm)
        text("Sesamstrasse 15")
        linebreak()
        h(2mm)
        text("1234 Einestadt")
        linebreak()
        h(2mm)
        text("Weitfortistan")
    },
)
#show: lttr_preamble

// #lorem(50)

// ```rust
// pub fn f(x: &mut i32) -> i32 {
//     3
// }
// ```

// #lorem(80)
// #lorem(20)

// #show: lttr_closing

// #lttr_state()
