Sprint 11 – REST API Integration with Queueable Apex

Overview

In Sprint 11, I implemented a REST API integration for the Placement Management System using Apex Queueable, Named Credentials, External Credentials, and Apex Triggers.

When an application is selected, the system automatically processes the application in the background and sends the application details to an external REST API.

Features Implemented

- Created "PlacementIntegrationQueueable" Apex class.
- Implemented "Queueable" Apex with "Database.AllowsCallouts".
- Integrated Salesforce with an external REST API.
- Created and configured a Named Credential for the Placement API.
- Created an External Credential and configured "PlacementAPIPrincipal".
- Created a Permission Set for External Credential Principal Access.
- Updated "ApplicationTrigger" to automatically enqueue the integration job when an application's Status changes to Selected.
- Added integration tracking fields:
  - Integration Status
  - External Reference
  - Last Attempt
  - Error Message
- Monitored the asynchronous execution using Apex Jobs.

Integration Flow

Application Status = Selected
            ↓
      ApplicationTrigger
            ↓
PlacementIntegrationQueueable
            ↓
      Named Credential
            ↓
       External API
            ↓
   API Response Received
            ↓
Integration Status = Success
            ↓
External Reference Stored

Test Result

The integration was successfully tested with the following application:

Field| Result
Student| Rahul
Job| Data Analyst
Student CGPA| 8.50
Minimum CGPA| 7.50
Application Status| Selected
Integration Status| Success
External Reference| 101
Error Message| None

Technologies Used

- Salesforce
- Apex
- Queueable Apex
- Apex Triggers
- REST API
- Named Credentials
- External Credentials
- Permission Sets
- JSON
- Apex Jobs

Key Learning

This sprint helped me understand how Salesforce can communicate with external systems securely using Named Credentials and External Credentials, while Queueable Apex allows the integration to run asynchronously in the background.
