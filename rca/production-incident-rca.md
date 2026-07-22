# Production Incident Root Cause Analysis

## Incident Summary

- **Incident ID:** INC-YYYY-MM-DD-001
- **Date:** YYYY-MM-DD
- **Start Time:** HH:MM UTC
- **End Time:** HH:MM UTC
- **Duration:** XX minutes
- **Severity:** SEV-1 / SEV-2 / SEV-3
- **Affected Services:** service-a / service-b / service-c
- **Environment:** Production
- **Incident Owner:** Name
- **RCA Owner:** Name

## Executive Summary

Provide a short, non-technical summary of what happened, which users were affected, and how the incident was resolved.

## Customer Impact

Describe:

- Number or percentage of affected users
- Failed requests or degraded functionality
- Data impact, if any
- Geographic or tenant impact
- Business impact

## Timeline

| Time | Event |
|---|---|
| HH:MM | Alert triggered |
| HH:MM | Engineer acknowledged |
| HH:MM | Initial investigation started |
| HH:MM | Root cause identified |
| HH:MM | Rollback or fix started |
| HH:MM | Service restored |
| HH:MM | Incident closed |

## Detection

Explain how the issue was detected:

- Monitoring alert
- Customer report
- Error-rate spike
- Latency increase
- Failed deployment
- Argo CD sync failure

## Root Cause

Describe the technical root cause in detail.

Example:

A production Helm values change set the container port to a value different from the Spring Boot server port. Kubernetes readiness probes failed, the new pods never became ready, and the deployment reduced available capacity during rollout.

## Contributing Factors

- Missing pre-production validation
- Incomplete readiness probe testing
- No automated smoke test after deployment
- Environment-specific values not reviewed
- Insufficient resource limits
- Manual change outside GitOps workflow

## Resolution

Describe the action that restored service.

Example:

The team rolled back the Helm release to the last healthy revision and corrected the production values file. Argo CD then synchronized the corrected configuration.

## Corrective and Preventive Actions

| Action | Owner | Priority | Due Date | Status |
|---|---|---|---|---|
| Add Helm template validation in CI | Name | High | YYYY-MM-DD | Open |
| Add post-deployment smoke tests | Name | High | YYYY-MM-DD | Open |
| Protect production values with review rules | Name | Medium | YYYY-MM-DD | Open |
| Add alert for readiness failures | Name | Medium | YYYY-MM-DD | Open |

## Lessons Learned

### What Went Well

- Monitoring detected the issue quickly.
- Rollback procedure worked.
- Team communication was clear.

### What Did Not Go Well

- Production configuration was not validated.
- No automated endpoint verification existed.
- The deployment lacked a gradual rollout strategy.

### Where We Got Lucky

- No data corruption occurred.
- A previous healthy Helm revision was available.

## Evidence

Attach or link:

- Argo CD sync history
- Helm release history
- Kubernetes events
- Pod logs
- Monitoring dashboards
- Related pull request
- Incident communication thread

## Approval

- **Engineering Lead:** Name
- **SRE/DevOps Lead:** Name
- **Product Owner:** Name
- **Approval Date:** YYYY-MM-DD
