# Atramin — Perfume Store UI (Flutter)

[نسخه فارسی](README.fa.md)

A UI/UX case study built as a full e-commerce app concept for **Atramin**, a fictional/demo perfume & cologne store inspired by [atramin.ir]. The goal was to design a polished, RTL-first shopping experience for a luxury fragrance market — from onboarding to product discovery to a full product detail page — entirely in Flutter.

This project focuses on **UI craftsmanship and interaction design**, not backend integration: product data is local/mock, and there is no live payment flow.

---

## Screens

### Onboarding
A 3-step animated onboarding flow introducing the brand, building trust (Iranian eNamad / eTemad trust badges), and previewing the product catalog before the user lands on the home screen.

| Welcome | Trust badges | Catalog preview |
|---|---|---|
| <img src="screenshots/onboarding-1-welcome.png" width="220"/> | <img src="screenshots/onboarding-2-trust.png" width="220"/> | <img src="screenshots/onboarding-3-cta.png" width="220"/> |

### Home
Hero carousel for featured products, quick category tabs (Most viewed / New / Men / Women), and a scrollable product grid.

<img src="screenshots/home.png" width="220"/>

### Shop / Catalog
Full catalog view with search, category filters (All / Women / Men / Decants), a filter panel, and a sort dropdown.

<img src="screenshots/shop.png" width="220"/>

### Product Detail
Fragrance rating (out of 10 with star display), authenticity guarantee badge, gender, olfactory family, release year, and a rich Persian description — styled to read like a fragrance magazine entry rather than a generic e-commerce listing.

<img src="screenshots/product-detail.png" width="220"/>

### News / Events Feed
An in-app content feed ("Atramin Events") surfacing new fragrance releases and comparison articles, keeping users engaged between purchases.

<img src="screenshots/news-feed.png" width="220"/>

---

## What this project demonstrates

- **RTL-first design** — every screen, animation, and layout was built for Persian right-to-left reading order from the ground up, not adapted after the fact.
- **Custom bottom navigation** with an animated, floating support/chat action button (`animated_bottom_navigation_bar`).
- **Dynamic, brand-consistent color system** using Material You color utilities (`material_color_utilities`) rather than hardcoded palettes.
- **Custom page transitions** (`page_transition`) for a smoother, more native-feeling navigation flow than default Flutter routes.
- **Editorial-style product content** — description copy, ratings, and provenance details designed to build trust and desirability for a luxury product, not just list a price.
- **Production-ready app shell** — custom launcher icon and adaptive icon configuration set up via `flutter_launcher_icons`.

## Tech Stack

| Category | Tools |
|---|---|
| Framework | Flutter |
| Navigation | `page_transition`, `animated_bottom_navigation_bar` |
| Theming | `material_color_utilities` (Material You dynamic color) |
| Fonts | BYekan+, Lalezar (Persian typefaces) |
| Tooling | `flutter_launcher_icons` |

## Status

This is a **UI/UX portfolio project** — the interface is fully built and interactive with local/mock data. It is not connected to a live backend or payment gateway.

## Author

**Ali Zolfaghari** — Flutter Developer
[alizolfaghari.ir](https://alizolfaghari.ir)
