# Proposal Management & Collaboration System

A full-featured Ruby on Rails app that allows organizations to:

- Collaboratively create and manage proposals
- Invite co-authors and track approvals
- Estimate costs and assess feasibility
- Track implementation with milestones and evidence
- Generate public dashboards and export reports

---

## 🚀 Features

- User authentication (registration, login, logout)
- Proposal collaboration with co-author invitations
- Approval workflow for proposals
- Structured cost breakdown and feasibility scoring
- Implementation tracking with milestone updates
- File uploads for progress evidence
- Public dashboard for approved/in-progress/completed proposals
- PDF export of financial impact reports

---

## 🛠 Tech Stack

- Ruby on Rails 7
- Bootstrap 5 (via Sprockets)
- PostgreSQL
- Active Storage for file uploads
- Wicked PDF for PDF generation

---

## 🔧 Setup Instructions

git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
bundle install
yarn install
rails db:create db:migrate db:seed
bin/dev
