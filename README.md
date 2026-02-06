# ✨ FluentEdge: AI-Powered English Learning ✨

**FluentEdge — AI-Powered English Learning Platform | Flutter, NestJS, PostgreSQL, Prisma, Firebase (2025–)**
Developed an AI-powered English learning platform with a Flutter frontend and a NestJS backend exposing GraphQL APIs; implemented Firebase Authentication for user sign-in and Firestore-based leaderboards, managed application data using Prisma with PostgreSQL, and integrated Groq for AI-driven text evaluation along with Whisper Large v3 for speech transcription and pronunciation analysis.

FluentEdge is a **cross-platform, AI-powered English learning app** that helps users improve their **typing and speaking skills** with real-time evaluations, progress tracking, and personalized AI feedback. Built with **Flutter** for a fluid, responsive frontend and **NestJS** for a scalable backend, FluentEdge uses a **GraphQL API** to deliver a flexible, efficient, and strongly typed data layer across web, mobile, and desktop platforms.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Stars](https://img.shields.io/github/stars/FluentEdge/FluentEdge?style=social)
![Forks](https://img.shields.io/github/forks/FluentEdge/FluentEdge?style=social)
![Contributors](https://img.shields.io/badge/contributors-1-brightgreen)

![Project Preview](/preview_example.png)

---

## ✨ Key Features

* 🔑 **Authentication:** Secure email-password login and Google Sign-In via Firebase Authentication.
* 📊 **Dashboard:** Unified performance overview including typing speed (WPM), accuracy, speaking scores, and test history.
* ⌨️ **Typing Practice:**

  * Timed typing tests with real-time evaluation.
  * Metrics include WPM, CPM, accuracy, mistakes, score, and AI-generated suggestions (Groq).
  * Interactive charts to track progress over time.
* 🎤 **Speaking Practice:**

  * Timed speaking prompts with voice recording.
  * Speech transcription via **Whisper Large v3** and AI evaluation of fluency, grammar, pronunciation, and vocabulary.
  * Detailed transcripts and historical progress analytics.
* 🏆 **Leaderboards:** Firestore-based leaderboards that rank users by score, accuracy, or WPM — updated in real-time for social/competitive features.
* 🤖 **AI-Powered Feedback:**

  * **Groq Cloud API** for advanced typing and text evaluation and personalized suggestions.
  * **Whisper Large v3** for high-quality speech-to-text transcription and pronunciation analysis.
* 🧠 **GraphQL API Layer:**

  * NestJS backend exposing a strongly typed GraphQL schema with queries and mutations.
  * Efficient data fetching tailored for Flutter clients.
  * Simplified frontend state management and reduced overfetching.
* 🛡️ **Secure and Scalable:** Built with NestJS, Prisma ORM, and PostgreSQL (NeonDB compatible) for high availability and reliability.

---

## 🛠️ Tech Stack

* **Frontend:** Flutter (Dart), Firebase SDK, GraphQL client
* **Backend:** NestJS (TypeScript) exposing GraphQL APIs
* **API Layer:** Apollo GraphQL (server & client patterns)
* **Database:** PostgreSQL (NeonDB/Postgres) managed via **Prisma ORM**
* **Authentication & Realtime:** Firebase Authentication and Firestore (leaderboards, realtime features)
* **AI Models / Services:** Groq Cloud API (text evaluation), Whisper Large v3 (speech transcription & pronunciation)
* **Hosting and Deployment:** Flexible for mobile, web, and desktop builds; backend deployable to any Node-friendly host or serverless provider

---

## ⚙️ Installation Guide

### Prerequisites

* Git
* Node.js and npm or yarn
* Flutter SDK and Dart
* PostgreSQL or NeonDB instance
* Firebase project for Authentication & Firestore
* (Optional) Groq API key and access to Whisper model endpoint

### 1. Clone Repository

```bash
git clone https://github.com/glenjaysondmello/FluentEdge.git
cd FluentEdge
```

### 2. Backend Setup — NestJS with GraphQL & Prisma

```bash
cd nest_backend
npm install
```

#### Environment (.env) example

```env
PORT=3000
DATABASE_URL=postgresql://user:password@localhost:5432/fluentedge
FIREBASE_PROJECT_ID=your-firebase-project-id
FIREBASE_CLIENT_EMAIL=your-firebase-client-email
FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----\n"
GROQ_API_KEY=your-groq-api-key
WHISPER_ENDPOINT_URL=https://api.whisper.example/v1/...
```

> 📌 Place `serviceAccountKey.json` (Firebase Admin credentials) in the backend root for server-side Firebase Admin SDK usage.

---

### 3. Frontend Setup — Flutter

```bash
cd ../flutter_frontend
flutter pub get
flutter run
```

---

## 🚀 Usage

### Typing Tests

* Start a new timed typing test.
* View WPM, accuracy, mistakes, and AI-generated feedback (Groq).
* Track historical performance using visual analytics.

### Speaking Tests

* Record responses to guided prompts.
* Transcription and pronunciation scoring provided by Whisper Large v3.
* Receive AI-driven evaluation of fluency, grammar, and vocabulary; review transcripts and progress trends.

### Dashboard

* Monitor overall learning progress.
* View recent test results and long-term performance trends.
* Access the Leaderboard from a dedicated screen to compare rankings with other users.

---

## 🗺️ Roadmap

* ⭐ **Phase 1.0 Current**

  * Firebase Authentication & Firestore leaderboards
  * Typing and speaking practice with AI feedback
  * GraphQL powered backend and analytics dashboard
* 🚀 **Phase 1.1 Upcoming**

  * Role-based access control (RBAC)
  * Advanced user profiles and personalization
  * Third-party integrations (payments, analytics)
  * Performance optimization for large datasets
  * Expanded unit and integration test coverage
* 💡 **Future Vision**

  * Desktop builds for Windows, macOS, and Linux
  * Real-time collaboration and AI tutors
  * AI-driven lesson personalization
  * Community-driven plugin ecosystem

---

## 🤝 Contribution Guidelines

1. Fork the repository and create a feature branch
2. Follow coding standards (Flutter format, ESLint, Prettier)
3. Use conventional commits
4. Write unit and integration tests
5. Submit a clear pull request

---

## 📜 License

This project is licensed under the MIT License.

---

## 📧 Contact

**Author:** Glen Jayson Dmello
📩 Email: [glendmello04@gmail.com](mailto:glendmello04@gmail.com)

---

> 🚀 FluentEdge – Empowering learners with AI and GraphQL to improve typing speed, fluency, and pronunciation in English.
