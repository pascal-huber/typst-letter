#import "@local/lttr:0.1.0": *
#show: lttr_init.with(
    debug: true,
    format: "C5-WINDOW-LEFT",
    title: "Brief schribä mit Typst isch zimli eifach",
    opening: "Hoi Peter,",
    closing: "Uf widerluege",
    signature: "Ruedi",
    date_place: (
        date: "20.04.2023",
        place: "Witfortistan",
    ),
    receiver: (
        "Peter Empfänger",
        "Bahnhofsstrasse 16",
        "1234 Zimliwitwegistan",
    ),
    sender: ([
        Ruedi Rösti\
        Bahnhofsgasse 15\
        8957 Spreitenbach
    ]),
)

#show: lttr_preamble

#lorem(50)

#show: lttr_closing
