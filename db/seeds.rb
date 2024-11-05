# Seed Landmarks
Spot.create!([
  {
    name: "Иракли",
    description: "Просторен плаж с множество пикове, работи и при малки прогнози",
    latitude: 42.74596163054038,
    longitude: 27.891145190638916,
    wave_type: "Shifting Peaks",
    seabed_type: "Sand",
    swell_window: "NE/E/SE",
    consistency: 5,
    break_type: "Sandbars",
    image_url: "irakli.webp",
    slug: "irakli"
  },
  {
    name: "Пристанището Бяла",
    description: "Спот работещ на силни северни прогнози, силно течение, заголващи се камъни, счупени финки, неподходящ за начинаещи",
    latitude: 42.854112057714474,
    longitude: 27.900163820768892,
    wave_type: "Lefhander",
    seabed_type: "Mixed",
    swell_window: "NE",
    consistency: 2,
    break_type: "Point break",
    image_url: "byala.webp",
    slug: "byala"
  },
  {
    name: "Несебър",
    description: "Спот работещ на големи прогнози, неподходящ за начинаещи",
    latitude: 42.65728152725585,
    longitude: 27.722264960975675,
    wave_type: "Aframe",
    seabed_type: "Rock",
    swell_window: "E/SE",
    consistency: 2,
    break_type: "Point break",
    image_url: "nesebar.webp",
    slug: "nesebar"
  },
])