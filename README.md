# 📚 BookBuddy

A simple and elegant Flutter mobile application that helps users discover, search, and manage their favorite books. BookBuddy integrates with the Google Books API to provide a vast collection of books and uses local SQLite storage for wishlist management.

## ✨ Features

### 🔐 Authentication
- **Login/Register Interface**: Clean and intuitive user authentication UI
- **Dummy Authentication**: Simple validation for development purposes
- **Session Management**: Basic logout functionality

### 📖 Book Discovery
- **Search Books**: Search through millions of books using Google Books API
- **Popular Books**: Browse trending and popular books
- **Book Details**: View book information including title, author, description, and cover image
- **Real-time Search**: Instant search results as you type

### ❤️ Wishlist Management
- **Add to Wishlist**: Save your favorite books for later
- **Local Storage**: All wishlist data stored locally using SQLite
- **Remove Books**: Easy removal of books from your wishlist
- **Persistent Storage**: Your wishlist persists between app sessions

### 🎨 User Interface
- **Modern Design**: Clean and intuitive Material Design interface
- **Responsive Layout**: Optimized for different screen sizes
- **Loading States**: Smooth loading indicators and error handling
- **Navigation**: Easy navigation between different sections

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code
- Android Emulator or Physical Device

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/bookbuddy.git
   cd bookbuddy
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## 📱 App Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── book.dart            # Book data model
├── services/
│   ├── api_service.dart     # Google Books API integration
│   └── database_service.dart # SQLite database operations
└── screens/
    ├── login_page.dart      # Authentication screen
    ├── homepage.dart        # Main book discovery screen
    └── wishlist_page.dart   # Wishlist management screen
```

## 🔧 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0      # HTTP requests for API calls
  sqflite: ^2.3.0   # SQLite database for local storage
  path: ^1.8.3      # Path manipulation utilities
```

## 📊 Database Schema

### Wishlist Table
```sql
CREATE TABLE wishlist(
  id TEXT PRIMARY KEY,           # Unique book identifier
  title TEXT NOT NULL,           # Book title
  author TEXT NOT NULL,          # Book author
  imageUrl TEXT,                 # Book cover image URL
  description TEXT               # Book description
)
```

## 🌐 API Integration

### Google Books API
- **Base URL**: `https://www.googleapis.com/books/v1/volumes`
- **Search Endpoint**: `?q={query}&maxResults=20`
- **No API Key Required**: For basic usage (rate limited)

### Sample API Response
```json
{
  "items": [
    {
      "id": "book_id",
      "volumeInfo": {
        "title": "Book Title",
        "authors": ["Author Name"],
        "description": "Book description...",
        "imageLinks": {
          "thumbnail": "image_url"
        }
      }
    }
  ]
}
```

## 🎯 Key Features Implementation

### 1. Book Search
- Integrates with Google Books API
- Handles search queries and displays results
- Error handling for network issues

### 2. Wishlist Management
- SQLite database for local storage
- CRUD operations (Create, Read, Delete)
- Duplicate prevention using book IDs

### 3. State Management
- Uses Flutter's built-in `setState()` for simplicity
- Future-ready for advanced state management solutions

### 4. Navigation
- MaterialPageRoute for screen transitions
- Proper back navigation handling
- App bar actions for quick access

## 🔄 App Flow

1. **Login Screen**: User enters credentials (dummy validation)
2. **Homepage**: Browse and search books, add to wishlist
3. **Wishlist**: View saved books and manage collection
4. **Logout**: Return to login screen

## 🛠️ Development Notes

### Current Implementation
- **Authentication**: Dummy implementation for development
- **Local Storage**: SQLite for wishlist persistence
- **API**: Google Books API for book data
- **UI**: Material Design components

### Future Enhancements
- Real authentication with JWT tokens
- User profiles and cloud sync
- Reading progress tracking
- Book recommendations
- Social features (sharing, reviews)
- Offline reading capabilities

## 🚨 Known Limitations

- **Authentication**: Currently uses dummy validatio
- **API Rate Limits**: Google Books API has usage limits
- **Network Dependency**: Requires internet for book search
- **Image Loading**: Dependent on external image URLs

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 Development Guidelines

### Code Style
- Follow Dart/Flutter conventions
- Use meaningful variable names
- Add comments for complex logic
- Maintain consistent indentation

### Testing
- Write unit tests for services
- Test database operations
- Validate API integration
- Test UI components

### Performance
- Optimize image loading
- Implement pagination for large results
- Cache frequently accessed data
- Handle memory efficiently

## 🐛 Troubleshooting

### Common Issues

1. **API Not Working**
   - Check internet connection
   - Verify API endpoint URLs
   - Check for API rate limiting

2. **Database Issues**
   - Clear app data if schema changes
   - Check file permissions
   - Verify SQLite version compatibility

3. **Build Errors**
   - Run `flutter clean` and `flutter pub get`
   - Check Flutter SDK version
   - Update dependencies

## 📄 License

This project is licensed under the MIT License.

## 👨‍💻 Author

Created as a learning project to develop proficiency in:
- Flutter mobile development
- SQLite database management
- API integration
- Mobile UI/UX design

## 🙏 Acknowledgments

- Google Books API for providing book data
- Flutter team for the amazing framework
- Material Design for UI guidelines
- SQLite for reliable local storage

---

**Happy Coding! **
