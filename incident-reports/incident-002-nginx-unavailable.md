# Incident 002: Nginx Web Server Unavailable

## Incident Summary
- **Incident type:** Web server availability
- **Environment:** Local Ubuntu on WSL2
- **Service:** Nginx
- **Port:** 80
- **Severity:** Low (controlled lab simulation)
- **Status:** Resolved

## Symptoms
Requests to `http://127.0.0.1/` failed with curl error 7:
the client could not connect to port 80.

## Impact
The local HTML website was temporarily unavailable while Nginx
was stopped. The FastAPI application remained accessible on port 8000.

## Investigation
1. Checked the Nginx service state using `systemctl is-active nginx`.
2. Confirmed the service was `inactive`.
3. Tested the website using `curl -I`.
4. Confirmed the request failed on port 80.
5. Tested FastAPI independently and received HTTP 200 OK.

## Root Cause
Nginx was intentionally stopped to simulate a web-server outage.

## Resolution
Restarted Nginx using `sudo systemctl start nginx`.

## Validation
- Nginx service state: `active`.
- Website returned HTTP 200 OK.
- FastAPI readiness endpoint continued returning HTTP 200 OK.

## Preventive Actions
- Monitor web-server availability and HTTP responses.
- Inspect service status and logs when the website becomes unreachable.
- Test the web server and backend independently to isolate failures.

## Lessons Learned
A backend application can remain healthy even when the web server
is unavailable. Check each service independently before identifying
the failing component.

This was a controlled local WSL2 simulation, not a production AWS incident.
