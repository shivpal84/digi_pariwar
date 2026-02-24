# digi_pariwar

A clean architecture Flutter MVP demonstrating:

Profile Completion

Lessons List (API-driven)

Lesson Detail with Step Completion

### Folder Structure
The project follows Clean Architecture (Feature-First Structure) to ensure scalability and maintainability.


lib/
├── network/
│    └── api_client.dart
│
├── features/
│    ├── profile/
│    │    ├── data/
│    │    ├── domain/
│    │    └── presentation/
│
│    ├── lessons/
│    │    ├── data/
│    │    ├── domain/
│    │    └── presentation/
│               ├── lesson_detail
│               └── lesson_list
│
└── main.dart


## Layers
1 Presentation Layer
- UI Screens 
- BLoC (State Management)
- Validation logic 
- UI state handling (loading, error, empty)

2 Domain Layer
- Repository contracts (abstract classes)
- Repository implementations

3 Data Layer
- API models (Freezed)
- JSON parsing

4 Core Layer
- Dio-based ApiClient
- Interceptors 
- Error handling

## State Management

Using - flutter_bloc
Reason:
- Clear separation of business logic 
- Testable architecture
- Predictable state transitions 
- Scalable for production

## How API is Integrated

- Networking is implemented using Dio with a centralized API client.

## API Client
- Base URL configuration
- Bearer token injection
- Interceptors
- Error handling

## API Configuration
Base URL: https://api.digiparivaar.com
JWT token is currently injected manually in: ApiClient.setToken("TEST_JWT_TOKEN");

## Api Used

1. Profile API
   Endpoint : PUT /users/me

2. Lessons API
   Endpoint : GET /lessons
   Response parsed using Freezed models and mapped to domain entities.

3. Lesson Steps API
   Endpoint : GET /lessons/{lessonId}/steps
   Parsed using Freezed 
   Sorted by stepOrder 
   First step shown (as per MVP requirement)

## Testing

- BLoC unit tests 
- Validation tests 
- Success & failure scenarios 
- Repository mocking using mocktail
