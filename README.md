# ✨ FluentEdge: AI-Powered English Learning ✨

FluentEdge is a **cross-platform, AI-powered English learning app** that helps users improve their **typing and speaking skills** with real-time evaluations, progress tracking, and personalized AI feedback. Built with **Flutter** for a fluid, responsive frontend and **NestJS** for a scalable backend, FluentEdge delivers a seamless learning experience on web, mobile, and desktop.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Stars](https://img.shields.io/github/stars/FluentEdge/FluentEdge?style=social)
![Forks](https://img.shields.io/github/forks/FluentEdge/FluentEdge?style=social)
![Contributors](https://img.shields.io/badge/contributors-1-brightgreen)

![Project Preview](/preview_example.png)

---

## ✨ Key Features

* 🔑 **Authentication:** Secure email-password login & Google Sign-In via Firebase.
* 📊 **Dashboard:** Performance overview – typing speed (WPM), accuracy, speaking scores, test history.
* ⌨️ **Typing Practice:**

  * Timed typing tests with real-time evaluation.
  * Results include WPM, CPM, accuracy, mistakes, score, and AI suggestions.
  * Charts to track progress over time.
* 🎤 **Speaking Practice:**

  * Timed prompts with voice recording.
  * AI evaluation of fluency, grammar, pronunciation, and vocabulary.
  * Dashboard with progress charts and detailed transcripts.
* 🤖 **AI-Powered Feedback:**

  * **Groq Cloud API** for typing evaluations.
  * **Whisper Large v3** for speech-to-text transcription and pronunciation scoring.
* 🛡️ **Secure & Scalable:** Built with NestJS, Prisma ORM, and NeonDB for reliability.

---

## 🛠️ Tech Stack

* **Frontend:** Flutter (Dart), Firebase SDK *(multi-platform)*
* **Backend:** NestJS (TypeScript)
* **Database:** PostgreSQL (NeonDB) with Prisma ORM
* **Authentication:** Firebase (Email & Google Sign-In)
* **AI Models:** Groq Cloud API (text evaluation), Whisper Large v3 (speech transcription)
* **Hosting/Deployment:** Flexible for mobile/web/desktop builds

---

## ⚙️ Installation Guide

### Prerequisites

* Git
* Node.js & npm/yarn *(for backend)*
* Flutter SDK & Dart *(for frontend)*
* PostgreSQL/NeonDB instance
* Firebase project (for auth & config)

### 1. Clone Repository

```bash
git clone https://github.com/glenjaysondmello/FluentEdge.git
cd FluentEdge
```

### 2. Backend Setup (NestJS)

```bash
cd nest_backend
npm install
npm run start:dev
```

Backend will run at: `http://localhost:3000`

#### Backend `.env` Example

```env
PORT=3000
DATABASE_URL=postgresql://user:password@localhost:5432/fluentedge
MONGO_URI=""
GROQ_API_KEY=""
```

📌 Place `serviceAccountKey.json` in the backend root for Firebase Admin SDK authentication.
Used in `firebase.service.ts`:

```ts
import * as admin from 'firebase-admin';
import * as path from 'path';
import { readFileSync } from 'fs';

const serviceAccountPath = path.resolve(process.cwd(), 'serviceAccountKey.json');
const serviceAccount = JSON.parse(readFileSync(serviceAccountPath, 'utf8'));

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

export default admin;
```

### 3. Frontend Setup (Flutter)

```bash
cd ../flutter_frontend
flutter pub get
flutter run
```

#### Firebase Config

Firebase integration will generate `firebase_options.dart` during setup. This file must be included in the Flutter project for Firebase services to work.

---

## 🚀 Usage

### Typing Tests

* Start a new timed test.
* View results: WPM, accuracy, mistakes, and AI feedback.
* Track typing progress with history charts.

### Speaking Tests

* Record answers to prompts.
* Receive AI-driven evaluation of fluency, grammar, and pronunciation.
* Track speaking progress over time.

### Dashboard

* See overall performance.
* Access recent tests and progress trends.

---

## 🗺️ Roadmap

* ⭐ **Phase 1.0 (Current):**

  * Secure auth (Firebase)
  * Typing & speaking practice with AI feedback
  * Dashboard & progress tracking

* 🚀 **Phase 1.1 (Upcoming):**

  * Role-based access & advanced user profiles
  * Third-party integrations (payments, external APIs)
  * Enhanced performance for large datasets
  * Comprehensive test coverage

* 💡 **Future Vision:**

  * Desktop builds for Windows, macOS, Linux
  * Real-time collaboration & AI tutors
  * AI/ML personalization for lessons
  * Community-driven plugin ecosystem

---

## 🤝 Contribution Guidelines

1. Fork repo & create a feature branch:

   ```bash
   git checkout -b feature/my-feature
   ```
2. Follow coding standards:

   * **Frontend:** Dart style guide (`flutter format .`)
   * **Backend:** ESLint + Prettier (`npm run format`)
3. Use **conventional commits** (e.g., `feat: add speaking dashboard`).
4. Write unit/integration tests:

   * Backend → `npm test`
   * Frontend → `flutter test`
5. Submit PR with clear description & references.

---

## 📜 License

This project is licensed under the **MIT License**.

---

## 📧 Contact

**Author:** Glen Jayson Dmello
📩 Email: [glendmello04@gmail.com](mailto:glendmello04@gmail.com)

---

> 🚀 FluentEdge – Empowering learners with AI to improve typing, fluency, and pronunciation in English.
