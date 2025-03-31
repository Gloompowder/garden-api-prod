Garden API
A Ruby on Rails API-only backend that serves community garden data from NYC Open Data. This project uses PostgreSQL as its database and leverages NYC Open Data’s GreenThumb Garden dataset to populate garden information.

Table of Contents
Features
Tech Stack
Getting Started
Environment Variables
Running the App
API Endpoints
Data Seeding
Authentication
Deployment
Contributing
License
Features
API-Only Rails Backend: Lightweight API designed for use with modern frontends.
PostgreSQL Database: Robust data storage using PostgreSQL.
NYC Open Data Integration: Seeds garden data from the NYC GreenThumb Garden dataset.
User Authentication: Secure user authentication with Devise and JWT (or sessions, as configured).
RESTful Endpoints: Provides endpoints for gardens, visits, and user management.
Tech Stack
Ruby on Rails (API Only)
PostgreSQL
Devise (for authentication)
Devise JWT (if using token-based authentication)
NYC Open Data / SODA Ruby (for fetching external data)
Getting Started
Prerequisites
Ruby (version 3.1+ recommended)
Rails (version 7+ recommended)
PostgreSQL
Git
Installation
Clone the repository:

bash
Copy
git clone https://github.com/yourusername/garden-api.git
cd garden-api
Install dependencies:

bash
Copy
bundle install
Set up the database:

bash
Copy
rails db:create
rails db:migrate
Seed the database:

This will fetch garden data from NYC Open Data and populate your database.

bash
Copy
rails db:seed
Environment Variables
Create a .env file in the root of your project (if using dotenv-rails) and define the following:

env
Copy
# Your Rails secret key (or use Rails credentials)
SECRET_KEY_BASE=your_secret_key_here

# NYC Open Data App Token (if required)
NYC_OPEN_DATA_APP_TOKEN=your_opendata_app_token_here

# Database URL if needed (optional)
DATABASE_URL=postgres://user:password@localhost:5432/your_database_name

# API base URL for frontend integration (for development, e.g., port 3002)
NEXT_PUBLIC_RAILS_API_URL=http://localhost:3002
Note: Adjust variable names as needed and make sure to add .env to your .gitignore.

Running the App
Start your Rails server (ensure you’re in API mode) on your desired port:

bash
Copy
rails s -p 3002
Your API will now be available at http://localhost:3002.

API Endpoints
Public Endpoints
GET /api/v1/gardens - List all gardens.
GET /api/v1/gardens/:id - Show details for a specific garden.
Authenticated Endpoints
Require user authentication (via session or JWT):

GET /api/v1/current_user - Returns the current logged-in user.
POST /api/v1/visits - Create a new visit for the authenticated user.
GET /api/v1/visits - List visits for the authenticated user.
PATCH/PUT /api/v1/visits/:id - Update a visit.
DELETE /api/v1/visits/:id - Delete a visit.
Authentication Endpoints
Using Devise, endpoints are namespaced as follows (if using API namespaced controllers):

POST /api/v1/register - User registration.
POST /api/v1/login - User login.
DELETE /api/v1/logout - User logout.
Data Seeding
The db/seeds.rb file uses the soda-ruby gem to fetch garden data from NYC Open Data. Running rails db:seed will populate your database with garden records from the GreenThumb dataset.

Authentication
This API uses Devise for user authentication. Depending on your configuration, you can use sessions or JWT for API authentication. Check the Devise JWT documentation if using token-based authentication.

Deployment
For deployment, consider services like Heroku, AWS, or DigitalOcean. Make sure you configure your environment variables appropriately in your production environment.

Contributing
Contributions are welcome! Please open an issue or submit a pull request for any features or bug fixes.

License
This project is licensed under the MIT License. See the LICENSE file for details.
# garden-api-prod
# garden-api-prod
# garden-api-prod
