# 📚 ComicsVerse

**ComicsVerse** is a premium, cross-platform mobile application engineered with **Flutter** to deliver an immersive comics and manga reading experience. Built on a robust **Supabase** backend, it seamlessly integrates real-time community interaction, sophisticated content discovery, and a highly customizable reading engine.

---

## 🌟 Key Features

### 📖 Immersive Reading Engine
*   **Dual Reading Modes**: Switch seamlessly between **Vertical Scroll** (Webtoon style) and **Horizontal Page Flip** (Manga style).
*   **Glassmorphism Controls**: An elegant floating control panel offering instant access to settings.
*   **Gesture Controls**: Advanced pinch-to-zoom (`InteractiveViewer`) and intuitive navigation gestures.
*   **Brightness Control**: Integrated in-app brightness adjustment via `screen_brightness` for comfortable night reading.

### 🔍 Discovery & Search
*   **Smart Home Feed**: Curated **"For You"** grids and dynamic **Weekly Rankings** carousels.
*   **Advanced Filtering**: Powerful search capability with genre-based filtering.
*   **Optimized Performance**: Implements **500ms debounce** logic to minimize API overhead during real-time typing.

### 💬 Real-Time Community
*   **Live Discussions**: Engage with the community through a responsive comment sheet.
*   **Nested Replies**: Structured conversation threads.
*   **Instant Updates**: Powered by **Supabase Realtime**, comments and reactions appear instantly across devices.

### 👤 Personalization & Integration
*   **Secure Authentication**: Flexible sign-in via Email/Password or **Google OAuth**, managed by **Supabase Auth**.
*   **Cloud Library**: Synchronized bookmarks/library with pull-to-refresh updates.
*   **User Profile**: Avatar management (Supabase Storage), display name editing, and preference settings.
*   **Daily Reminders**: Built-in **Local Notifications** to schedule daily reading sessions.
*   **Dark Mode**: Native support for light and dark themes.

---

## 🛠️ Technology Stack

ComicsVerse leverages a modern, scalable architecture to ensure performance and maintainability.

| Domain | Technology | Key Libraries/Packages |
| :--- | :--- | :--- |
| **Framework** | **Flutter** | `flutter`, `dart` |
| **Backend & Auth** | **Supabase** | `supabase_flutter` (Auth, DB, Storage, Realtime) |
| **State Management** | **Riverpod** | `flutter_riverpod` (AsyncValue, Notifiers) |
| **Navigation** | **GoRouter** | `go_router` (Deep linking, Shell routes) |
| **UI Aesthetics** | **Glassmorphism** | `flutter_animate`, `shimmer`, `cached_network_image`, `google_fonts` |
| **Local Services** | **Device Integration** | `flutter_local_notifications`, `image_picker`, `shared_preferences`, `screen_brightness` |

---

## 📂 Architecture

The project follows a scalable **Feature-First** directory structure, ensuring separation of concerns and ease of testing:

```
lib/
├── core/           # Global configurations, reusable widgets, and utilities
├── features/       # Feature-specific modules
│   ├── auth/       # Authentication logic & UI
│   ├── home/       # Discovery & Ranking feeds
│   ├── reader/     # The core reading engine
│   ├── search/     # Search & Filter logic
│   ├── library/    # User bookmarks/favorites
│   ├── comment/    # Real-time discussion system
│   └── profile/    # User settings
└── main.dart       # Application entry point
```

---

## 🚀 Getting Started

### Prerequisites
*   Flutter SDK (3.9.2 or higher)
*   Dart SDK

### Installation

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/25-26Sem1-Courses/ct312hm01-project-Giang0402.git
    cd mycomicsapp
    ```

2.  **Install Dependencies**
    ```bash
    flutter pub get
    ```

3.  **Environment Setup**
    Create a `.env` file in the root directory and add your Supabase credentials:
    ```env
    SUPABASE_URL=your_supabase_url
    SUPABASE_ANON_KEY=your_supabase_anon_key
    ```

4.  **Run the App**
    ```bash
    flutter run
    ```

---

## 📸 Screenshots

*(Add high-fidelity screenshots here to showcase the UI/UX)*

---

This project was developed as part of a university coursework requirement.
**Video Demo:** [Watch on YouTube](https://youtu.be/VMs2ck3VO_s?si=gUpXZYO9iv6fliWb)
