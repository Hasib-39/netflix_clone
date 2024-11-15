# Netflix Clone 🎥

A Netflix-inspired mobile application built with **Flutter** and powered by the **TMDB API**, offering a sleek interface to browse popular movies and TV shows.  

## Features 🌟  
- 🎬 **Popular Movies & TV Shows**: Browse the most popular content.  
- 🔍 **Search Functionality**: Easily search for movies or shows by title.  
- 📋 **Detailed Info**: View detailed information about movies, including release date, synopsis, and ratings.  
- 📱 **Responsive Design**: Optimized for various screen sizes.  
- 🚀 **Real-Time Data Fetching**: Data fetched dynamically from TMDB API for the latest updates.  

## Screenshots 📸  
### Home Screen
 ![Screenshot_2024-11-15-18-02-10-35_69160baf6dd5d51bc5bfca642219bfde](https://github.com/user-attachments/assets/b94074d0-fbfc-448d-8c7d-700b00f24ab0)
### Movie/Series Details Page
![Screenshot_2024-11-15-18-02-27-13_69160baf6dd5d51bc5bfca642219bfde](https://github.com/user-attachments/assets/7f79b5f9-fbf1-4009-ae8e-5d28fc5f9b8f)
### Search Page
![Screenshot_2024-11-15-18-02-39-04_69160baf6dd5d51bc5bfca642219bfde](https://github.com/user-attachments/assets/daab30ff-ed01-490e-92d3-7dbeb97c48b2)
### New & Hot Page
![Screenshot_2024-11-15-18-02-57-03_69160baf6dd5d51bc5bfca642219bfde](https://github.com/user-attachments/assets/c51279d1-b4e8-4e38-8c87-585bb89d3c62)

## Tech Stack 🛠️  
- **Framework**: [Flutter](https://flutter.dev/)  
- **API**: [TMDB API](https://www.themoviedb.org/documentation/api)  
- **State Management**: *(Specify if using any, e.g., Provider, Riverpod)*  

## Installation & Setup 🚀  
Follow these steps to run the project locally:  

1. **Clone the Repository**:  
   ```bash  
   git clone https://github.com/Hasib-39/netflix_clone.git  
   cd netflix_clone  
   ```  

2. **Install Dependencies**:  
   Ensure you have Flutter installed. Then run:  
   ```bash  
   flutter pub get  
   ```  

3. **TMDB API Key**:  
   - Visit [TMDB](https://www.themoviedb.org/) to create an account and obtain an API key.  
   - Add your API key to the `lib/constants.dart` file:  
     ```dart  
     const String TMDB_API_KEY = 'your_api_key_here';  
     ```  

4. **Run the App**:  
   Use the following command to launch the app:  
   ```bash  
   flutter run  
   ```  
5. For running the release version, You can simply download the release apk and install in your android devices. Currently I did not add ios version.

## Project Structure 📂  
```  
netflix_clone/  
├── lib/  
│   ├── screens/        # App screens  
│   ├── widgets/        # Reusable widgets  
│   ├── models/         # Data models  
│   ├── services/       # API integration  
│   ├── constants.dart  # Constants like API key  
│   └── main.dart       # Entry point  
└── assets/             # Images and assets  
```  

## Contributing 🤝  
Contributions are welcome! Feel free to fork the repo and submit a pull request.  

## License 📜  
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.  

## Acknowledgments 💖  
- Thanks to [The Movie Database (TMDB)](https://www.themoviedb.org/) for the amazing API.  
- Inspired by the design and functionality of Netflix.  

---  
**Created with ❤️ by [Hasib Altaf](https://github.com/Hasib-39)**.  

Feel free to share feedback or ideas for improvement! 🚀
