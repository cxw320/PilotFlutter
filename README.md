# Pilot

A recipe app.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## **Modular Architecture**

**Module Isolation for Efficient Collaboration:** Using module isolations lets teams work together easily and independently. The app's features are split into modules, and each module has everything it needs to handle a specific part of the app. This keeps the development process self-sufficient and flexible.

**Feature Modules as Standalone Products:** Feature modules are established when a particular feature has a substantial scale, and essentially can be seen as a standalone product. Teams can separately work on these modules, making sure they can focus on their tasks without getting sidetracked.

**Customizable Architectures for Each Module:** Every module has the flexibility to adapt its unique architecture. Teams can choose the most suitable pattern for their module, fetching Domain Entities from the API within the module and performing necessary mappings there, choosing to use MVVM or MVP, etc…

**Dependency Management without Hidden Injection:** Each isolated module incorporates its Dependency Injection Provider and has **one entry point** into the module, this provides a clear overview of the module's dependencies, which also helps in creating mocks for UI and unit testing.

**Minimizing Third-Party Framework Dependence:** The architecture strives to minimize the use of third-party frameworks. If a module requires such a dependency, its use is isolated through **wrappers**, limiting its impact to that specific module. Third-party packages should not dictate the app architecture, instead, the app architecture should dictate the use of a package.

**Change Management (PRs):** Modular architecture offers the advantage of isolating a change. During pull requests, this makes it easy to identify affected modules.  

**Inter-Module Dependencies and Framework Integration:** Modules are allowed to depend on each other (without circular dependencies). For instance, a dependency chain A->B->C signifies that Module A, which imports B, will have access to C through the interface of B. 

**Enhancing Modular Design with Protocols/Interfaces/Abstract Classes/Contracts:** By defining protocols that establish a set of methods and properties, teams can create clear interfaces for communication between modules. A change request could be issued to a specific team/squad, which potentially could trigger a change of the contract used to communicate with that specific module, this would offer clarity if the desired outcome was provided, also the use of protocols could be extended to method versioning and deprecation strategies of specific APIs. Additionally, protocols facilitate the implementation of the dependency inversion principle - higher-level components should not depend on lower-level components without an **abstraction**.

**Testing and Debugging:** Modular design should make it easy to isolate, mock, test, and debug **specific functionalities**. Making sure each module is thoroughly tested helps catch and fix problems as we go. Testing on each PR would give us **a health check on each part/module/component of the project** as we move along with the development of the app.

### Folder Structure

- lib
    - Components
        - Component_Name
            - component_entry_point.dart
            - Adapters
                - Network (e.g.)
                    - Feature_name
                        - DTOs
                        - feature_network_adapter.dart
            - DependencyProviders
            - Features
                - Feature_Name
                    - Presentation
                        - MVVM files
                    - Router# PilotFlutter
