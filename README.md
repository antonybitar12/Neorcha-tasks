1)Architecture

This project follows the MVVM (Model–View–ViewModel) architecture with clear separation of concerns.

View (UI Layer): Flutter widgets responsible only for rendering UI.

ViewModel Layer: Implemented using BLoC to handle business logic and state.

Model/Data Layer: Contains models, repository, and API provider.

Data Flow

UI → BLoC (ViewModel) → Repository → API Provider → Remote API

API calls are fully separated from the UI through a repository and service layer, ensuring clean architecture and testability.

2)State Management

State management is implemented using the BLoC pattern.

Events represent user actions.

BLoC processes business logic.

States reflect UI updates (loading, success, error).

<div style="text-align: center;">
  <img src="assets/Screenshots/DetailsPage.jpeg" width="250">
  <img src="assets/Screenshots/HomePage.jpeg" width="250">
  <img src="assets/Screenshots/SplashScreenPage.jpeg" width="250">
</div>