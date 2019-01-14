GCP App Engine template
=======================
This repository contains a sample application and supporting configuration files
for Google App Engine Standard to be tested and evaluated.

Terraform
=========
Terraform orchestrates the project setup, creating databases, source repo,
storage and kms.

Circle CI
=========
Terraform and the Google Cloud SDK are invoked on commit by Circle CI, which
enables required APIs, creates a Terraform plan, and waits for operator approval
prior to changing production.

Rails / App Engine
=============================
To test locally run `cd rails-example && bundle install && bin/rails server`.

.NET Core / App Engine
======================
XXX

Java Spring Boot / App Engine
=============================
XXX

Bootstrap Process
=================

1. Create a Terraform service account via
   `Console -> IAM & admin -> Service Accounts` in GCP
1. Save the JSON credentials to `$HOME/gcloud-service-key.json`
1. Go to `Console -> IAM & admin` in GCP, click on `View by: Roles`,
   and then add `Project -> Owner` to the terraform service account.
1. Enable circleci on this repo, then add some environment variables in circleci:
   * GCLOUD_SERVICE_KEY:  Set this to the contents of `$HOME/gcloud-service-key.json`
   * GOOGLE_PROJECT_ID: Set this to your google project ID
   * BASICAUTH_PASSWORD: Set this to a basic auth password to frontend your app with.
     If it is not set, then your app will be public.
