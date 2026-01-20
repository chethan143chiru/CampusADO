# CampusADO 📚  
**Campus Administration & Data Organizer — iOS App (SwiftUI + MVVM + SQLite)**

CampusADO is a modular iOS application built using **SwiftUI**, **MVVM architecture**, and **SQLite-based persistence**, designed to solve real campus administration problems such as student management, attendance, notices, tasks, and shared academic data.

This project is structured professionally to reflect **industry-grade iOS architecture**, making it suitable for:
- DBMS Mini Project
- iOS Academic Projects
- Portfolio Demonstration
- Campus Utility Applications

---

## 🚀 Project Overview

CampusADO focuses on **clean separation of concerns**, scalability, and maintainability.

### 🎯 Core Goals
- Admin & Student role separation
- Offline-first local database (SQLite)
- Modular architecture
- Soft delete & recovery system
- Real-time capable extension layer

---

## 🧠 Architecture

CampusADO follows **MVVM (Model–View–ViewModel)** architecture:

- **Views** → UI layer (SwiftUI)
- **ViewModels** → Business logic & state
- **Models** → Data structures
- **Services** → Database, APIs, logic handlers
- **Utils** → Helpers & extensions
- **Config** → App-level configuration
- **Components** → Reusable UI components

---

## 📂 Folder Structure (Actual)


---

## ✨ Features

### 🔐 Authentication
- Admin & Student login
- Session persistence
- Soft-deleted account recovery

### 🎓 Student Management (Admin)
- Add / Edit / Delete student profiles
- Role-based access
- Centralized control panel

### 🗒 Notices, Tasks & Schedules
- Admin posts global data
- Students can view shared content
- Modular Services + ViewModels

### 📊 Attendance Management
- Subject-wise attendance
- Present / Absent tracking
- Color-coded UI
  - 🟢 Present
  - 🔴 Absent

### ♻ Trash & Restore System
- Soft delete using flags
- Central Trash module
- Restore or permanent delete

### ⚡ Realtime Ready
- `Realtime/` module designed for future Firebase / socket integration
- Sync-ready architecture

---

## 🛠 Installation & Setup

### ✅ Requirements
- macOS **12+**
- **Xcode 14+**
- iOS **15+ Simulator** or physical device

---

### 🔧 Setup Steps

#### 1️⃣ Clone the Repository
```bash
git clone https://github.com/chethan143chiru/CampusADO.git
cd CampusADO
