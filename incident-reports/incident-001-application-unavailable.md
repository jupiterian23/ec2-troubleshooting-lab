# Incident 001: Application Unavailable on Port 8000

## Incident Summary
- **Incident type:** Application availability
- **Environment:** Local Ubuntu on WSL2
- **Service:** FastAPI application served by Uvicorn
- **Endpoint:** http://127.0.0.1:8000
- **Severity:** Low (controlled lab simulation)
- **Status:** Resolved

## Symptoms
The application health and readiness endpoints became unavailable
after the Uvicorn server was intentionally stopped during testing.

Requests to the application failed with curl error 7:
Failed to connect to 127.0.0.1 port 8000.

## Impact
The local troubleshooting dashboard and its API endpoints could not
respond while the application server was stopped.

No production systems or AWS resources were involved.

## Investigation
1. Executed the diagnostic script.
2. Reviewed listening ports using `ss -lnt`.
3. Confirmed port 8000 was not listening during the simulated outage.
4. Checked `/api/health` and `/api/ready`.
5. Both checks failed while the application was stopped.

## Root Cause
The Uvicorn application server was intentionally stopped to simulate
an application availability incident.

## Resolution
Restarted the FastAPI application using Uvicorn and verified that
the application was listening on port 8000.

## Validation
- `/api/ready` returned HTTP 200 OK.
- Readiness response: `{"status":"ready"}`.
- Application health check: PASSED.
- Application readiness check: PASSED.
- The diagnostic report recorded the successful checks.

## Preventive Actions
- Keep application health and readiness checks available.
- Run diagnostics whenever an availability issue is reported.
- Preserve timestamped diagnostic reports for troubleshooting.
- In a production environment, consider service supervision,
  monitoring, and alerting to detect unexpected application failures.

## Lessons Learned
This exercise demonstrated how to identify a local application outage,
inspect listening ports, collect system diagnostics, restore service,
and verify recovery using HTTP health checks.

This was a controlled local lab simulation, not a real AWS EC2 incident.
