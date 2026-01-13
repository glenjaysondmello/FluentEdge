# ✨ FluentEdge: AI-Powered English Learning ✨

FluentEdge is a **cross-platform, AI-powered English learning app** that helps users improve their **typing and speaking skills** with real-time evaluations, progress tracking, and personalized AI feedback. Built with **Flutter** for a fluid, responsive frontend and **NestJS** for a scalable backend, FluentEdge uses a **GraphQL API** to deliver a flexible, efficient, and strongly typed data layer across web, mobile, and desktop platforms.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Stars](https://img.shields.io/github/stars/FluentEdge/FluentEdge?style=social)
![Forks](https://img.shields.io/github/forks/FluentEdge/FluentEdge?style=social)
![Contributors](https://img.shields.io/badge/contributors-1-brightgreen)

![Project Preview](/preview_example.png)

---

## ✨ Key Features

* 🔑 **Authentication:** Secure email-password login and Google Sign-In via Firebase.
* 📊 **Dashboard:** Unified performance overview including typing speed WPM, accuracy, speaking scores, and test history.
* ⌨️ **Typing Practice:**

  * Timed typing tests with real-time evaluation.
  * Metrics include WPM, CPM, accuracy, mistakes, score, and AI generated suggestions.
  * Interactive charts to track progress over time.
* 🎤 **Speaking Practice:**

  * Timed speaking prompts with voice recording.
  * AI evaluation of fluency, grammar, pronunciation, and vocabulary.
  * Detailed transcripts and historical progress analytics.
* 🤖 **AI-Powered Feedback:**

  * Groq Cloud API for advanced typing and text evaluation.
  * Whisper Large v3 for speech to text transcription and pronunciation analysis.
* 🧠 **GraphQL API Layer:**

  * Strongly typed schema with queries and mutations.
  * Efficient data fetching tailored for Flutter clients.
  * Simplified frontend state management and reduced overfetching.
* 🛡️ **Secure and Scalable:** Built with NestJS, Prisma ORM, and NeonDB for high availability and reliability.

---

## 🛠️ Tech Stack

* **Frontend:** Flutter Dart, Firebase SDK, GraphQL Client
* **Backend:** NestJS TypeScript with GraphQL
* **API Layer:** GraphQL Apollo Server
* **Database:** PostgreSQL NeonDB with Prisma ORM
* **Authentication:** Firebase Email and Google Sign-In
* **AI Models:** Groq Cloud API text evaluation, Whisper Large v3 speech transcription
* **Hosting and Deployment:** Flexible for mobile, web, and desktop builds

---

## ⚙️ Installation Guide

### Prerequisites

* Git
* Node.js and npm or yarn
* Flutter SDK and Dart
* PostgreSQL or NeonDB instance
* Firebase project for authentication

### 1. Clone Repository

```bash
git clone https://github.com/glenjaysondmello/FluentEdge.git
cd FluentEdge
```

### 2. Backend Setup NestJS with GraphQL

```bash
cd nest_backend
npm install
npm run start:dev
```

Backend will run at [http://localhost:3000](http://localhost:3000)

GraphQL Playground will be available at [http://localhost:3000/graphql](http://localhost:3000/graphql)

#### Backend .env Example

```env
PORT=3000
DATABASE_URL=postgresql://user:password@localhost:5432/fluentedge
GROQ_API_KEY=
```

📌 Place serviceAccountKey.json in the backend root directory for Firebase Admin SDK authentication.

Used in firebase.service.ts

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

---

### 3. Frontend Setup Flutter

```bash
cd ../flutter_frontend
flutter pub get
flutter run
```

#### Firebase Configuration

Firebase integration generates firebase_options.dart during setup. Ensure this file is included in the Flutter project for Firebase services to function correctly.

---

## 🚀 Usage

### Typing Tests

* Start a new timed typing test.
* View WPM, accuracy, mistakes, and AI generated feedback.
* Track historical performance using visual analytics.

### Speaking Tests

* Record responses to guided prompts.
* Receive AI driven evaluation of fluency, grammar, and pronunciation.
* Review transcripts and progress trends.

### Dashboard

* Monitor overall learning progress.
* Access recent test results and long term trends.

---

## 🗺️ Roadmap

* ⭐ **Phase 1.0 Current**

  * Firebase authentication
  * Typing and speaking practice with AI feedback
  * GraphQL powered backend and analytics dashboard

* 🚀 **Phase 1.1 Upcoming**

  * Role based access control
  * Advanced user profiles and personalization
  * Third party integrations including payments
  * Performance optimization for large datasets
  * Expanded unit and integration test coverage

* 💡 **Future Vision**

  * Desktop builds for Windows macOS and Linux
  * Real time collaboration and AI tutors
  * AI driven lesson personalization
  * Community driven plugin ecosystem

---

## 🤝 Contribution Guidelines

1. Fork the repository and create a feature branch

```bash
git checkout -b feature/my-feature
```

2. Follow coding standards

* Frontend Dart style guide using flutter format .
* Backend ESLint and Prettier using npm run format

3. Use conventional commits such as feat add speaking dashboard
4. Write unit and integration tests

* Backend npm test
* Frontend flutter test

5. Submit a pull request with a clear description and references

---

## 📜 License

This project is licensed under the MIT License.

---

## 📧 Contact

**Author:** Glen Jayson Dmello
📩 Email: [glendmello04@gmail.com](mailto:glendmello04@gmail.com)

---

> 🚀 FluentEdge – Empowering learners with AI and GraphQL to improve typing speed fluency and pronunciation in English.
