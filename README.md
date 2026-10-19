# Kindlelight

A native Android reading app for a personal EPUB, PDF, and TXT library. It uses local storage only and does not require an account or a storage permission.

## Features

- Import multiple EPUB, PDF, or TXT files through Android's document picker. The app keeps private copies, detects duplicates by file hash, and can share the original imported file.
- Organize books into multiple collections, rename books and collections, mark favorites, search, sort, and delete imported copies.
- Resume EPUB chapters, PDF pages, and scroll position in EPUB/TXT. EPUB text reflows; PDF pages support pinch zoom.
- Reader display presets: Normal, Eye Care (levels 1–5), and E-Reading with grayscale (levels 1–5) plus warmth. Typography controls include text size, serif font, line spacing, and margins.
- Adjustable warm paper tone for PDF pages, fitted page shadows, animated page turns, edge taps, and pinch zoom.
- In-app settings for keeping the screen awake while reading, page animations, edge taps, saving progress, PDF warmth, default reader display, and delete confirmations.
- Save up to eight named quick settings and switch between them with one tap.

Display modes change content **inside Kindlelight**. Android apps cannot promise the same panel-level blue light reduction as the ASUS device utility. EPUB and TXT typography controls do not reflow PDFs.

## Build and run

1. Install Android Studio with Android SDK 36 and JDK 17. Open this folder as an Android project.
2. On Windows, run `./gradlew.bat assembleDebug` from this folder. The first run downloads the Gradle 8.13 Wrapper JAR from Gradle's GitHub release tag, verifies its published SHA-256 checksum, then downloads Gradle and Android dependencies. Android Studio can also sync after this first run.
3. Install `app/build/outputs/apk/debug/app-debug.apk` on an Android 8.0 or newer device, or run the `app` configuration from Android Studio.

The project currently targets API 36, which is required for new Google Play submissions from August 31, 2026. A debug APK has been built, but release signing, store listing assets, privacy policy, and the chosen billing or advertising model still need to be configured before publishing.

## File notes

- Maximum import size: 300 MB for EPUB/PDF, 20 MB for TXT.
- EPUB support covers the package spine, local XHTML/CSS/images, and internal chapter links. DRM-protected books are not supported.
- The library and reading settings are saved locally. Android's normal app-data backup setting is enabled.
