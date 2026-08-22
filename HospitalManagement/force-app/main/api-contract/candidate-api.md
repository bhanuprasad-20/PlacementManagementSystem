# Candidate Recruitment API Contract

## Purpose

This API is used to send selected student candidate information
from Salesforce to an external recruitment system.

## Endpoint

POST /candidates

## HTTP Method

POST

## Request Content Type

application/json

## Request Body

{
    "studentId": "STU10045",
    "name": "Ananya",
    "email": "ananya@example.com",
    "branch": "CSE",
    "cgpa": 8.4,
    "jobId": "JOB1007",
    "company": "KSquare",
    "role": "Salesforce Developer",
    "selectionDate": "2026-08-21"
}

## Request Fields

| Field | Type | Description |
|---|---|---|
| studentId | String | Student identifier |
| name | String | Student name |
| email | String | Student email |
| branch | String | Student branch |
| cgpa | Decimal | Student CGPA |
| jobId | String | Job identifier |
| company | String | Company name |
| role | String | Job role |
| selectionDate | Date | Date the student was selected |

## Success Response

HTTP 201 Created

{
    "success": true,
    "externalCandidateId": "EXT-10045",
    "message": "Candidate created successfully"
}

## Error Responses

### 400 - Bad Request

The request contains invalid or missing data.

### 401 - Authentication Failed

The external API could not authenticate Salesforce.

### 403 - Forbidden

Salesforce is authenticated but does not have permission.

### 500 - Server Error

The external recruitment system has a server-side problem.

## Authentication

Authentication will be handled using a Salesforce Named Credential.
Credentials and secrets will not be hard-coded in Apex.

## Retry Strategy

Temporary failures such as server errors may be marked as
"Retry Required" for later processing.

## Idempotency

The Salesforce Application Id will be used as a unique reference
to help prevent duplicate candidate submissions.