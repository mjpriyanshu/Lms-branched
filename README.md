# Campus Connect LMS 🌟

Learning Management System (LMS) for college students, featuring a stunning celestial-themed UI with animated starfield backgrounds.

## ✨ Features

### 🏠 **Home Dashboard**
- **Welcome Section**: Personalized greeting with student information
- **Quick Stats**: Live counters for shared notes, joined events, and discussions
- **Quick Actions Grid**: Four main action tiles with consistent sizing
  - Upload Notes - Share study materials
  - Browse Notes - Find study resources  
  - Events - Check upcoming campus events
  - Discussions - Join academic conversations
- **Recent Activity Feed**: Timeline of latest platform activities

### 📚 **Notes Management**
- **Upload Notes**: Share study materials with classmates
- **Browse Notes**: Search and filter through shared academic content
- **Download**: Access notes offline for studying
- **Categories**: Organized by subjects and topics

### 📅 **Events System**
- **Event Calendar**: View upcoming campus events
- **Event Details**: Comprehensive event information
- **RSVP System**: Join events and track attendance
- **Event Categories**: Academic, social, and extracurricular events

### 💬 **Discussion Forums**
- **Topic-based Discussions**: Academic and general conversations
- **Real-time Updates**: Live discussion participation
- **Thread Management**: Organized conversation threads
- **User Interaction**: Like, reply, and share discussions

### 👤 **User Profiles**
- **Personal Dashboard**: User statistics and activity
- **Profile Management**: Update personal information
- **Activity History**: Track contributions and participation
- **Achievement System**: Recognition for active participation

## 🌌 **Celestial Background System**

### **Animated Starfield**
The app features a unique **CelestialBackground** widget that creates an immersive space-themed experience:

```dart
class CelestialBackground extends StatefulWidget {
  final Widget child;
  // Wraps any content with animated starfield
}
```

**Key Features:**
- **100 Animated Stars**: Randomly positioned twinkling stars
- **Smooth Animations**: 4-second animation cycle with continuous loop
- **Dynamic Opacity**: Stars fade in/out with sine wave calculations
- **Glow Effects**: Bright stars get subtle glow halos
- **Gradient Background**: Deep space gradient (dark blue → purple → darker purple)
- **Performance Optimized**: Efficient CustomPainter implementation

**Technical Implementation:**
- `AnimationController` for smooth 4-second loops
- `CustomPainter` for efficient star rendering
- `TickerProviderStateMixin` for animation lifecycle
- Mathematical sine wave calculations for twinkling effects
- Layered Stack with transparent overlays

## 🎨 **UI/UX Design**

### **Material 3 Design System**
- Modern Material 3 design principles
- Consistent spacing and typography using `AppSpacing` and `AppRadius`
- Google Fonts (Inter) for professional typography
- Unified blue gradient theme across all components

### **Responsive Design**
- **Adaptive Grid Layout**: 2-4 columns based on screen width
- **Fixed Heights**: Consistent tile sizing (160px for actions, 100px for stats)
- **Flexible Text**: Overflow handling with ellipsis
- **Mobile-First**: Optimized for phone dimensions

### **Color Scheme**
```dart
// Primary Colors
static const Color primaryColor = Color(0xFF6C5CE7);    // Purple
static const Color accentColor = Color(0xFF00CEC9);     // Teal
static const Color successColor = Color(0xFF00B894);    // Green
static const Color warningColor = Color(0xFFFDCB6E);    // Yellow

// Unified Card Gradients
static const LinearGradient unifiedCardGradient = LinearGradient(
  colors: [Color(0xFFF0F4FF), Color(0xFFE1EBFF)], // Light blue theme
);
```

## 🏗️ **Architecture**

### **Project Structure**
```
lib/
├── core/
│   └── theme/
│       └── app_theme.dart          # Centralized theme system
├── features/
│   ├── home/
│   │   ├── screens/
│   │   │   └── home_screen.dart    # Main dashboard
│   │   └── widgets/
│   │       ├── dashboard_card.dart  # Action tiles
│   │       ├── quick_stats.dart    # Statistics cards
│   │       └── recent_activity_card.dart
│   ├── notes/
│   │   └── screens/
│   │       └── notes_screen.dart   # Notes management
│   ├── events/
│   │   └── screens/
│   │       └── events_screen.dart  # Events calendar
│   ├── discussions/
│   │   └── screens/
│   │       └── discussions_screen.dart
│   └── profile/
│       └── screens/
│           └── profile_screen.dart
├── shared/
│   └── widgets/
│       ├── celestial_background.dart  # Animated starfield
│       └── custom_app_bar.dart       # Branded app bar
└── main_navigation.dart              # Bottom navigation
```

### **Key Widgets**

#### **CelestialBackground**
```dart
// Animated starfield background
- AnimationController for smooth loops
- StarsPainter for efficient rendering
- 100 twinkling stars with glow effects
- Deep space gradient background
```

#### **DashboardCard**
```dart
// Action tiles with consistent sizing
- Fixed 160px height for uniformity
- Gradient backgrounds with unified theme
- Icon + title + subtitle layout
- Overflow protection with flexible text
```

#### **QuickStats**
```dart
// Statistics display cards
- Fixed 100px height for consistency
- Number + label format
- Color-coded themes
- Responsive text sizing
```

## 🚀 **Technical Features**

### **Animation System**
- Smooth celestial background animations
- Twinkling star effects using mathematical calculations
- Performance-optimized CustomPainter
- Continuous animation loops

### **Responsive Design**
- LayoutBuilder for adaptive layouts
- Screen-width based column calculations
- Consistent component sizing
- Mobile-optimized spacing

### **State Management**
- Provider pattern ready for implementation
- Modular widget architecture
- Separation of concerns

### **Performance Optimization**
- Efficient star rendering with CustomPainter
- Minimized widget rebuilds
- Optimized animation controllers
- Memory-efficient star generation



## 🎯 **Future Enhancements**
- Backend API integration
- Real-time notifications
- File upload/download functionality
- User authentication system
- Push notifications
- Offline capability
- Advanced search filters

@mjpriyanshu
