# ComicsVerse: A Modern Cross-Platform Comics Reader

## Project Introduction

**ComicsVerse** is a full-featured, cross-platform mobile application developed using **Flutter**. It is designed to provide a smooth, modern reading experience for comics and manga enthusiasts. The application features a robust backend architecture utilizing Supabase for real-time interactions and data persistence.

The core focus is on intuitive content discovery, personalized library management, and a dynamic community experience.

## Key Features

* **Flexible Authentication**: Supports sign-up and sign-in via Email/Password, as well as **Google OAuth**. Authentication and user sessions are managed securely by **Supabase Auth**.
* **Intuitive Discovery**: Features categorized sections including **Weekly Rankings** (displayed in a carousel format) and a curated **"For You"** grid.
* **Advanced Search & Filtering**: Users can search comics by title and apply filters based on **genres**. The search logic incorporates a **500ms debounce** mechanism to optimize API calls while typing.
* **Optimized Reading Experience**:
    * Supports two modes: **Vertical Scroll** and **Horizontal Page Flip**.
    * Includes a floating control panel with **glassmorphism** effects and direct access to brightness settings (via `screen_brightness`).
    * Allows multi-touch image zooming (`InteractiveViewer`).
* **Real-time Community**: A fully functional comment section displayed in a sheet, featuring **nested replies**. All comments are updated instantly using **Supabase Realtime**.
* **Personal Library (Bookmarks)**: Users can easily add or remove stories from their library with immediate feedback. Supports **pull-to-refresh** to synchronize the local library list.
* **Profile Management**: Allows editing the display name and updating the **profile avatar** (uploaded to **Supabase Storage**). Includes a built-in **Dark Mode** toggle and a **Daily Reading Reminder** using local notifications and exact alarm permissions.

## Technology Stack

The project leverages the power of Flutter with a robust cloud backend and modern state management.

| Category | Technology | Key Libraries |
| :--- | :--- | :--- |
| **Frontend Platform** | **Flutter** | `flutter_animate`, `cached_network_image`, `shimmer` |
| **Backend / DB** | **Supabase** (BaaS) | `supabase_flutter`, utilizing Auth, Database, Storage & Realtime features |
| **State Management** | **Flutter Riverpod** | `flutter_riverpod` (AsyncValue, AsyncNotifierProvider) |
| **Navigation** | **GoRouter** | `go_router` (StatefulShellRoute, Custom Transitions) |
| **UI/UX** | **Glassmorphism** (Custom) | `dart:ui`'s `BackdropFilter` implementation |

## Demo & Links

| Asset | Link | Source |
| :--- | :--- | :--- |
| **GitHub Repository** | `https://github.com/25-26Sem1-Courses/ct312hm01-project-Giang0402.git` | |
| **Video Demonstration** | `https://youtu.be/VMs2ck3VO_s?si=gUpXZYO9iv6fliWb` | |

## Screenshots

*(Place high-quality screenshots of the app below, organized by feature)*

---
*(End of README)*
