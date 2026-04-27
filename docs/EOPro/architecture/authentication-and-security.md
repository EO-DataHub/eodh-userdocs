**Keycloak Integration**

The API uses Keycloak for managing user authentication and authorization,
ensuring that only authenticated users can access and submit tasks.

**Token Management and Validation**

Token-based authentication is implemented to secure API requests. The API
validates these tokens on each request to ensure secure communication.

**Secure Communication with ADES API**

All communication with the ADES API is secured using HTTPS, and tokens are used
to authenticate requests, ensuring that only authorized actions are performed. 